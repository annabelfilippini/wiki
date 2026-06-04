---
title: "Filbert: How we built our background coding agent in an afternoon"
source: "https://x.com/philhchen/status/2043751476355629358"
author:
  - "[[@philhchen]]"
published: 2026-04-13
created: 2026-04-14
description: "Filbert has written over 95% of our PRs across our codebase over the last week. He runs 14 scheduled jobs daily: production bug triage, secu..."
tags:
  - "clippings"
---
![[raw/assets/03659baa34b9658509158f411f9d8341_MD5.jpg]]

Filbert has written over 95% of our PRs across our codebase over the last week. He runs 14 scheduled jobs daily: production bug triage, security audits, dead code sweeps, CI optimization. He reviews his own output and self-approves when the diff is innocuous. We built him in one afternoon.

To be clear, this was only possible because we'd been building agent-first in 2026: self-hosted GitHub Actions, secrets in GCP Secret Manager, infra in Terraform, a monorepo with both infra and product code, and skills for agents to work with all this infrastructure. Filbert didn't need much new infrastructure. He just needed prompts and a runtime.

# What Filbert actually is

Mention [@Filbert](https://x.com/@Filbert) in a Slack thread with a bug report, and a Pi supervisor spins up, dispatches Codex or Claude into a git worktree scoped to that thread, and posts results back. Filbert also runs 14 daily clean-up jobs, alternating between OpenAI and Anthropic, covering everything from integration test proposals to security audits to dead code sweeps.

# How we built Filbert

## Hour 0: Infrastructure

Secrets (e.g. OpenAI / Anthropic API keys, read-only staging DB URLs) and IAM roles were already defined in Terraform. Self-hosted CI runners were already provisioned. We added a VM pool behind a load balancer and a WAF exposing exactly two paths (\`/slack/events\` and \`/healthz\`). Each instance runs under a service account with access to only the secrets it needs. A stored GitHub token gives the agent git clone/push and PR access. The VM startup script pulls the repo, installs the runtime, and enables systemd units.

## Hour 1: Scheduled tasks

I noticed some of our engineering time was going towards maintenance every day. Each maintenance task became a prompt template and a line in a YAML config. The config defines schedule, provider, model, and reasoning effort per task. We also chose to alternate between Codex on Monday/Wednesday/Friday/Sunday, Claude on Tuesday/Thursday/Saturday. No human in the loop for docs changes. Human review for code changes.

```yaml
# Schedule strategy: most tasks run on alternating days between two providers.
#   Codex (openai / 5.3-codex):  Mon, Wed, Fri, Sun  → DOW 0,1,3,5
#   Claude (anthropic / 4.6-opus): Tue, Thu, Sat      → DOW 2,4,6

jobs:
  - id: logs-triage-codex
    schedule: "7 2 * * 0,1,3,5"
    provider: openai
    model: 5.3-codex
    reasoning_effort: xhigh
    prompt_template_file: cron-04-logs-triage.prompt.md
    pr_title: "devex(cron): triage production and staging errors"

  - id: logs-triage-claude
    schedule: "7 2 * * 2,4,6"
    provider: anthropic
    model: 4.6-opus
    reasoning_effort: high
    prompt_template_file: cron-04-logs-triage.prompt.md
    pr_title: "devex(cron): triage production and staging errors"
```

## Hour 3: Slack ingress and thread state

The scheduled tasks are fire-and-forget. The Slack agent is conversational. You @ him in a thread, he works, you reply with follow-ups, and he picks up where he left off.

We wrote an HTTP server that receives Slack Events API webhooks, verifies request signatures, deduplicates events, and persists them to disk. Each thread gets a directory:

```plaintext
/var/lib/filbert/threads/<thread-hash>/
├── thread.md            # Full Slack thread snapshot
├── inbox.md             # Append-only feed of new messages
├── agent-notes.md       # Durable working memory across runs
├── reaction-state.json
└── runs/
    └── <run-id>/
        ├── stdout.log
        ├── stderr.log
        ├── result.json
        └── agent-prompt.md
```

The thread directory is the memory. When Filbert picks up a follow-up message three hours later, he reads his own notes from the last run to remember what he already tried. Filbert maintains one worktree per thread, reused across follow-ups, so git state carries over too.

## Hour 4: The agent harness

The key architectural decision was inspired by OpenClaw: don't build one monolithic agent that does everything. Build a lightweight supervisor that manages interfaces with humans, coding agents, and the environment.

The **human interface** is Slack. The supervisor reads thread snapshots, posts status updates, and manages a reaction lifecycle. Follow-up messages in the same thread are appended to the inbox and processed in order, so the human can refine the request mid-flight or add context after the first dispatch.

The **coding agent interface** is async dispatch. The supervisor doesn't write code. It decides when to dispatch Codex or Claude, what context to pass, and what to tell the human when the agent is done. Dispatch is asynchronous: the wrapper starts the coding agent in the background and returns immediately. While the agent works, the supervisor stays available, polls status, tails logs, and checks the Slack inbox for new messages. If a follow-up arrives mid-run that changes the task, the supervisor can cancel and restart, or queue a follow-up run.

The supervisor's tools:

```bash
# Dispatch (async — returns immediately)
filbert-run-codex  --prompt-file <path> --worktree <dir> --run-dir <dir>
filbert-run-claude --prompt-file <path> --worktree <dir> --run-dir <dir>

# Monitor
filbert-codex-status --run-dir <dir>    # JSON status of running agent
filbert-codex-tail   --run-dir <dir>    # bounded log tail
filbert-codex-cancel --run-dir <dir>    # kill a running agent

# (same for claude: filbert-claude-status, filbert-claude-tail, filbert-claude-cancel)
```

Under the hood, the dispatch wrappers load API keys from the secret store, prepend a system prompt that teaches bounded diagnostics, and invoke the CLI in the thread's worktree.

The **environment interface** is resource awareness. The supervisor checks disk usage, memory pressure, and worktree sprawl before dispatching expensive coding agents. It knows when to prune stale worktrees, clean build artifacts, and back off when the machine is under pressure.

What's different from OpenClaw is that the supervisor is stateless. It gets spun up fresh for each Slack event, reads its own durable notes from the previous run, does its work, writes updated notes, and exits. The thread directory is the memory, not the process. Crashes lose nothing, and the supervisor prompt stays small because it only needs to reason about one thread at a time.

## Hour 5: Self-improvement

We deployed and started @-mentioning Filbert with real issues. He worked but roughly. He over-explained in Slack. He didn't acknowledge messages before diving into long diagnostics. He left stale worktrees filling up disk.

Filbert can read his own prompts. His supervisor prompt and coding-agent prompt live in the repo, in the same worktree he operates on. So when we told Filbert "you're too verbose in Slack," he could read his own supervisor prompt, understand why he was being verbose, and open a PR to fix it. When we said "you're not acknowledging messages fast enough," he read the prompt, saw there was no acknowledgment protocol, and added one.

Almost every change to Filbert's system prompt was Filbert's own PR, reviewed and merged by a human. The coding-agent prompt grew the same way: bounded diagnostics, resource hygiene, the rule about never loading production credentials. Each fix was a sentence or two of English that Filbert proposed after experiencing the problem itself.

This is the part that feels qualitatively different from other agent setups. Filbert is iterating on his prompts on top of just executing prompts. He has read access to his own instructions, he encounters the consequences of those instructions in production, and he can propose changes. The feedback loop is: Filbert does something wrong → human notices in Slack → tells Filbert → Filbert reads his own prompt → opens a PR to fix the behavior → human merges → Filbert is better next run.

# Learnings

**Paying the upfront cost of a proper terraform setup in a monorepo is absolutely worth it.** Filbert debugs his own permissions issues. He can read how local, staging, and prod permissions are set up, so he can figure out what permissions he's missing. He can even terraform plan his changes to validate prior to creating a PR.

**Dual-provider alternation accidentally became our best model eval.** We didn't have to build eval infrastructure. The PR review process became the eval. You see which models write better tests, which ones find real bugs vs. false positives, which ones respect the "don't remove exports from contracts" safety rule.

**The future is specialized agents with clear communication protocols.** Filbert's supervisor doesn't write code. Codex and Claude don't manage Slack. Each agent has a small prompt because it has a narrow job. The communication protocol between them is deliberately simple: the supervisor writes a prompt file and points the coding agent at a worktree. The coding agent writes result.json and agent-notes.md. Currently the entire is just files on disk. This only works because the responsibility boundary is explicit in the prompts. The protocol is the interface: prompt file in, progress/result file out. Any agent that speaks that protocol can be dispatched. We've already started swapping in different models per task category without changing a line of supervisor code.

# Closing

Building in 2026 has fundamentally changed. The future belongs to those who own their full stack: infra, prompts, and the feedback loops between them.