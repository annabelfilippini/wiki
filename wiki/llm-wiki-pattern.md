---
title: "LLM Wiki: A Pattern for Building Personal Knowledge Bases"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Andrej Karpathy (attributed)
date: 2026-04-05
url: ""
tags: [meta, methodology, knowledge-management, llm-patterns]
---

# LLM Wiki: A Pattern for Building Personal Knowledge Bases

## Key Takeaways
- LLMs should incrementally build and maintain a persistent wiki rather than re-derive knowledge via RAG on every query
- The wiki is a compounding artifact — cross-references, contradictions, and synthesis accumulate over time
- Human role: curate sources, direct analysis, ask good questions. LLM role: all bookkeeping — summarizing, cross-referencing, filing, consistency
- Three-layer architecture: raw sources (immutable) → wiki pages (LLM-owned) → schema (co-evolved rules)
- Four core operations: ingest, query, lint, maintain

## Notable Claims
- Most knowledge tools (NotebookLM, ChatGPT uploads, RAG systems) rediscover knowledge from scratch on every question — no accumulation
- A single source ingest might touch 10-15 wiki pages
- Wikis die because humans won't do maintenance. LLMs make maintenance cost near-zero, so the wiki survives.
- Index-based navigation works well at moderate scale (~100 sources, ~hundreds of pages) without embedding infrastructure

## Quotes
> "Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase."

> "The human's job is to curate sources, direct the analysis, ask good questions, and think about what it all means. The LLM's job is everything else."

## New Information
This is the founding document of this wiki. It establishes the methodology that all subsequent operations follow.

## Conflicts
None — this is the first source.
