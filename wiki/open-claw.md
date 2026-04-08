---
title: Open Claw
type: entity
created: 2026-04-07
updated: 2026-04-07
sources: [note-2026-04-06-openclaw-freedom-brain-dump.md, notes-thoughts.md]
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

## Open Questions
- **Identity:** Is "Open Claw" a specific product/tool Annabel plans to download, or a conceptual label for the Claude Code + gstack stack she already uses? The brain dump treats it as something to install ("i think i want to download openclaw"), which suggests she sees it as a distinct tool.
- **Bridge to Obsidian:** How does a note in `wiki/raw/` trigger action in OpenClaw? Shared filesystem is the obvious answer (both already live under `~/Documents/Claude/`), but no explicit handoff exists yet.
- **Autonomy:** Annabel wants the system to run while she's away. Current Claude Code sessions are interactive. What makes execution truly autonomous — scheduled triggers, a daemon, long-running agents?
- **Right tool?** No alternative has been evaluated. This could be a "sounds right" decision that deserves a direct comparison to other agent runtimes before committing.

## Connections
- [[autonomous-business-system]] — OpenClaw is the proposed implementation of Layers 3-7.
- [[llm-wiki]] — The upstream knowledge layer OpenClaw should read from.
- [[bb-agent-system]] — Lives inside OpenClaw; handles the challenge/strategy layer.
- [[note-2026-04-06-openclaw-freedom-brain-dump]] — Primary source for this framing.
- [[notes-thoughts]] — Earlier articulation of the same split.
