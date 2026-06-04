---
title: Autonomous Business System
type: concept
created: 2026-04-06
updated: 2026-04-07
sources: [notes-thoughts.md, note-2026-04-06-openclaw-freedom-brain-dump.md]
tags: [vision, system-design, entrepreneurship, core, freedom]
missing_links: []
---

# Autonomous Business System

The overarching vision for an end-to-end system that captures knowledge, identifies market opportunities, builds products, and distributes them — with minimal manual intervention. Designed for a solo founder whose stated core value is **freedom**: freedom to do what she wants when she wants. Every design decision is meant to serve that value — the system exists so Annabel can be running, kitesurfing, or otherwise away while it keeps working.

## Two Halves: Thinking ↔ Action

Annabel's sharpened model (Apr 6): the system splits into a thinking half and an action half.

- **Thinking half — Obsidian / [[llm-wiki]].** Where raw knowledge lives because it has context on her entire life. Covers Layers 1-2.
- **Action half — [[open-claw]].** Where execution happens. Wayloft, [[pickleball-portal]], [[bb-agent-system]], and future businesses all run here. Covers Layers 3-7.

The unresolved design question is how these two halves actually connect. Shared filesystem is the obvious answer (both already live under `~/Documents/AI-OS/`), but no explicit handoff trigger exists yet.

## Architecture (7 Layers)

1. **Capture** — Brain dump everything into one place. Currently: Obsidian `raw/` folder via [[llm-wiki]].
2. **Process** — LLM organizes raw input into structured knowledge. Currently: wiki ingest workflow.
3. **Challenge** — BB agents stress-test ideas using business frameworks (YC, first principles). Currently: [[bb-agent-system]] with `/office-hours`, `/plan-ceo-review`.
4. **Build** — Agents + human build the product. Currently: Claude Code + gstack skills.
5. **Scan** — Automated monitoring of news, Reddit, X, YouTube, TikTok, Instagram for niches and demand signals. Currently: `/last30days` skill (early).
6. **Ship** — Deploy, PR, release. Currently: `/ship`, `/land-and-deploy` skills.
7. **Distribute** — Drop products into communities that need them. Currently: not built.

## Current State (Apr 2026)

- Layers 1-2 (Capture + Process): **Working.** Obsidian + wiki ingest pipeline functional.
- Layer 3 (Challenge): **Partially working.** BB agents exist but not yet trained on top business frameworks.
- Layer 4 (Build): **Working.** Claude Code + gstack proven on Wayloft and PBP.
- Layer 5 (Scan): **Early.** /last30days created but not integrated into opportunity pipeline.
- Layer 6 (Ship): **Working.** gstack ship pipeline proven.
- Layer 7 (Distribute): **Not built.** Vision exists but no implementation.

## Key Design Principles

- **Freedom-first.** The stated core value. Optimize for founder freedom, not founder involvement. Every layer earns its place by either increasing output or decreasing required attention.
- **One folder, one system.** Everything lives in one place. No tool sprawl.
- **Runs while you're away.** The system should work autonomously — while running, kitesurfing, sleeping. "Autonomous" is the load-bearing word; interactive-only tools don't count.
- **Self-improving.** Learns from work patterns and online signals. Iterates on itself.
- **Slow down now, compound later.** Annabel's pre-Okta window is explicitly framed as infrastructure time, not sprint time. Foundations before features.

## Open Questions

- How to connect Obsidian (knowledge) to an execution layer (action)? Shared filesystem is implicit but no trigger mechanism exists.
- Is [[open-claw]] actually the right substrate, or is it a "sounds right" pick? No alternative has been evaluated.
- How to make the scan → opportunity → build pipeline (Layers 5→4) actually autonomous? `/last30days` produces briefings but no build handoff.
- How does Layer 7 (Distribute) get built? Dropping tools into Reddit threads is the stated goal, but no implementation exists.
- How does BB get "backed by YC/gstack knowledge" beyond hand-curated context? Is there an ingestion pipeline?
- What's the right order to build the missing layers? Annabel is asking for external research on how others have solved this.

## Related Concepts
- [[llm-wiki]] — Layer 1-2 implementation (thinking half)
- [[open-claw]] — Proposed Layer 3-7 runtime (action half)
- [[bb-agent-system]] — Layer 3 (challenge) implementation
- [[ai-tools-and-frameworks]] — Agent architecture knowledge
- [[clean-before-build]] — Pattern: get foundations right before expanding
