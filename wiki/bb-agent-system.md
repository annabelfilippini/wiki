---
title: BB Agent System
type: concept
created: 2026-04-07
updated: 2026-04-07
sources: []
tags: [bb, agents, claude-code, entrepreneurship]
missing_links: []
---

**BB** is Annabel's co-founder agent system built on top of Claude Code + gstack. It's a set of prompt overlays that route decisions to specialized subagents, with a self-improving decision loop.

## Structure

Seven agents live in `~/.claude/agents/`:

- **bb** — coordinator, routes to the right specialist
- **bb-strategy** — ideas, scope, kill signals, YC-style office hours
- **bb-design** — visual identity, UX, design systems
- **bb-engineering** — architecture, code review, debugging
- **bb-quality** — QA, bug hunting, performance
- **bb-ship** — deploy, PRs, releases
- **bb-docs** — documentation coherence, post-ship updates

Each agent wraps relevant gstack skills (`/office-hours`, `/plan-ceo-review`, `/ship`, etc.) with Annabel-specific context: her founder profile, decision style, and past patterns.

## Knowledge layer

All agents share a knowledge base at `~/.claude/bb/knowledge/`:
- **decisions.jsonl** — decision log for the self-improving loop
- **patterns.md** — graduated patterns (distribution before depth, kill on bad unit economics, etc.)
- **[domain].md** — per-agent knowledge files (strategy, design, engineering, etc.)

## Why BB exists

Annabel moves fast. BB exists to add *intellectual friction* at decision points — not bureaucratic — and to accumulate learning across sessions. See [[autonomous-business-system]] for the broader second brain context.

## Related

- [[autonomous-business-system]] — the bigger system BB is part of
- [[llm-wiki]] — the knowledge layer BB reads from
- [[validate-before-redesigning]] — one of BB's graduated patterns
