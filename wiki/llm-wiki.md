---
title: LLM Wiki
type: concept
created: 2026-04-05
updated: 2026-04-06
sources: [llm-wiki-pattern.md, notes-thoughts.md]
tags: [methodology, knowledge-management, core]
missing_links: [rag, dataview, marp]
---

# LLM Wiki

A pattern for building personal knowledge bases where an LLM incrementally builds and maintains a persistent, interlinked wiki from raw source documents. The human curates sources and asks questions; the LLM handles all bookkeeping.

## How It Works

Three-layer architecture:
1. **Raw sources** — immutable collection of source documents (articles, papers, notes). The human's domain.
2. **Wiki pages** — LLM-generated markdown: entity pages, concept pages, source summaries, synthesis. The LLM's domain.
3. **Schema** — rules governing structure, conventions, and workflows. Co-evolved by human and LLM.

Four operations:
- **Ingest** — process a new source into the wiki, updating all relevant pages
- **Query** — answer questions by reading the wiki (not raw sources), with citations
- **Lint** — health-check for contradictions, orphans, missing pages, stale claims
- **Maintain** — ongoing upkeep of cross-references, frontmatter, and index

## Why It Works

Traditional wikis die because maintenance burden grows faster than value. LLMs eliminate that burden — they don't get bored, don't forget cross-references, and can touch dozens of files in one pass. The wiki survives because upkeep costs near-zero.

## Key Distinction from RAG

[[rag|RAG]] re-derives knowledge on every query. LLM Wiki compiles knowledge once and keeps it current. The synthesis is pre-built, not reconstructed each time.

## Tooling

- **[[obsidian]]** — the browsing layer. Graph view, wikilinks, real-time preview.
- **Git** — version history for free. The wiki is just a repo of markdown files.
- **Obsidian Web Clipper** — browser extension for converting articles to markdown sources.
- **qmd** — local markdown search engine (BM25 + vector) for when the wiki outgrows index-based navigation.

## Role in Autonomous Business System

The LLM Wiki serves as Layers 1-2 (Capture + Process) of the [[autonomous-business-system]]. Raw brain dumps flow into `raw/`, get processed into structured wiki knowledge, and feed downstream layers: idea challenge (BB agents), market scanning, building, and distribution.

## Intellectual Lineage

Traces to [[vannevar-bush-memex]] (1945) — a personal, curated knowledge store with associative trails. Bush's vision was closer to this than to what the web became. The part he couldn't solve was maintenance. The LLM handles that.
