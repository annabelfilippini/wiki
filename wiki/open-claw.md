---
title: Open Claw
type: entity
created: 2026-04-07
updated: 2026-04-08
sources: [note-2026-04-06-openclaw-freedom-brain-dump.md, notes-thoughts.md, article-2026-04-08-databricks-co-founder-wins-prestigious-acm-award.md]
tags: [tool, execution-layer, system-design]
missing_links: [obsidian-bridge]
---

# Open Claw

OpenClaw is the execution layer in Annabel's [[autonomous-business-system]] — the runtime where projects actually get built, as distinct from Obsidian/wiki, which is where knowledge and ideas live. As of April 2026 it is aspirational/partially adopted: Wayloft, [[pickleball-portal]], and [[bb-agent-system]] all run "in" OpenClaw in the sense that their code and agent work happen in the Claude Code harness Annabel has standardized on.

## Key Facts
- **Role:** The action / execution layer. Where Wayloft, PBP, BB, and future business ideas get built.
- **Contrast with Obsidian:** Obsidian is the thinking layer (brain dumps, wiki, connection-making). OpenClaw is where those ideas get turned into shipped product.
- **Runtime model Annabel wants:** Background execution so work continues while she's running, kitesurfing, or otherwise away from the keyboard.
- **Status:** Partially in place. Claude Code + gstack skills already handle most of the "build" work; the "runs while away" piece is not yet solved.

## Why It Matters
The Obsidian ↔ OpenClaw split is the first time Annabel has named a clean boundary between the knowledge graph and the work graph. The [[llm-wiki]] handles capture and processing (Layers 1-2 of the [[autonomous-business-system]]); OpenClaw is meant to handle challenge, build, scan, ship, and distribute (Layers 3-7).

## Security Concern (External Validation — Apr 8, 2026)
[[matei-zaharia]], Databricks co-founder/CTO and 2026 ACM Prize in Computing winner, called OpenClaw "a security nightmare" in a TechCrunch interview:

> "On the one hand, it's awesome. You can do so many things with it. It just does them automatically. But it's also a security nightmare... It's not a little human there."

His argument: the design choice that makes OpenClaw-class agents useful — mimicking a trusted human assistant that inherits your logged-in browser state and password access — is exactly what makes them a vulnerability. A compromised agent could spend unauthorized money from your bank because your browser is already authenticated.

**Why this matters for the wiki:** This is the first external, high-credibility professional validation of the security concern. When a Turing-adjacent researcher uses the exact "security nightmare" framing, it's no longer a vibes-level worry — it's a real design tension that any build on top of OpenClaw needs to address. See [[article-2026-04-08-databricks-co-founder-wins-prestigious-acm-award]].

## Open Questions
- **Identity:** Is "Open Claw" a specific product/tool Annabel plans to download, or a conceptual label for the Claude Code + gstack stack she already uses? The brain dump treats it as something to install ("i think i want to download openclaw"), which suggests she sees it as a distinct tool.
- **Bridge to Obsidian:** How does a note in `wiki/raw/` trigger action in OpenClaw? Shared filesystem is the obvious answer (both already live under `~/Documents/Claude/`), but no explicit handoff exists yet.
- **Autonomy:** Annabel wants the system to run while she's away. Current Claude Code sessions are interactive. What makes execution truly autonomous — scheduled triggers, a daemon, long-running agents?
- **Right tool?** No alternative has been evaluated. This could be a "sounds right" decision that deserves a direct comparison to other agent runtimes before committing.
- **Security model:** Per Zaharia's critique — what is the isolation/permission model if OpenClaw is given access to authenticated browser sessions? This is now a first-order design question, not an afterthought.

## Connections
- [[autonomous-business-system]] — OpenClaw is the proposed implementation of Layers 3-7.
- [[llm-wiki]] — The upstream knowledge layer OpenClaw should read from.
- [[bb-agent-system]] — Lives inside OpenClaw; handles the challenge/strategy layer.
- [[note-2026-04-06-openclaw-freedom-brain-dump]] — Primary source for this framing.
- [[notes-thoughts]] — Earlier articulation of the same split.
- [[matei-zaharia]] / [[article-2026-04-08-databricks-co-founder-wins-prestigious-acm-award]] — External professional validation of the security concern.
