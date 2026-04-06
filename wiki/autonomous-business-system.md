---
title: Autonomous Business System
type: concept
created: 2026-04-06
updated: 2026-04-06
sources: [notes-thoughts.md]
tags: [vision, system-design, entrepreneurship, core]
missing_links: [open-claw]
---

# Autonomous Business System

The overarching vision for an end-to-end system that captures knowledge, identifies market opportunities, builds products, and distributes them — with minimal manual intervention. Designed for a solo founder who values freedom over control.

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

- **One folder, one system.** Everything lives in one place. No tool sprawl.
- **Runs while you're away.** The system should work autonomously — while running, kitesurfing, sleeping.
- **Self-improving.** Learns from work patterns and online signals. Iterates on itself.
- **Freedom-first.** Optimize for founder freedom, not founder involvement.

## Open Questions

- How to connect Obsidian (knowledge) to an execution layer (action)?
- Is "Open Claw" the right tool for autonomous background execution?
- How to make scanning → opportunity → build pipeline actually autonomous?
- What's the right order to build the missing layers?

## Related Concepts
- [[llm-wiki]] — Layer 1-2 implementation
- [[ai-tools-and-frameworks]] — Agent architecture knowledge
- [[clean-before-build]] — Pattern: get foundations right before expanding
