---
title: Retrieval-Augmented Generation (RAG)
type: concept
created: 2026-04-07
updated: 2026-04-07
sources: []
tags: [ai, llm, architecture]
missing_links: []
---

**Retrieval-Augmented Generation (RAG)** is an architecture pattern for grounding LLM responses in external knowledge. Instead of relying only on the model's trained weights, the system retrieves relevant documents at query time and feeds them into the prompt as context.

## The basic flow

1. **Ingest:** Chunk and embed source documents into a vector store.
2. **Retrieve:** At query time, embed the question and find the nearest chunks.
3. **Generate:** Feed the retrieved chunks + the question to the LLM as context.
4. **Cite:** Return the answer with references back to the source chunks.

## Why it matters

- Lets a small model act like it "knows" a large private corpus.
- Grounds answers in real documents, reducing hallucination.
- Updates with new knowledge by re-indexing, not retraining.
- Cheaper and faster than fine-tuning for most use cases.

## Where RAG shows up in Annabel's stack

- [[llm-wiki]] is RAG without a vector database — the LLM reads [[index.md]] and wikilinks on demand instead of embedding chunks. Simpler, more interpretable, works because the corpus is small.
- Any future Wayloft "ask the wiki" tool would use RAG over the travel rewards knowledge base.
- Second Brain Final's [[autonomous-business-system]] would use RAG if it ever surfaces wiki knowledge to the scan/challenge loop.

## Tradeoffs

- **Chunk size matters.** Too small and you lose context; too big and retrieval gets fuzzy.
- **Embeddings are imperfect.** Semantic search can miss exact-match cases where keyword search would win. Hybrid retrieval (vector + keyword) usually wins.
- **Freshness problem.** If the source updates, the index has to be rebuilt.
- **Citation hygiene.** Bad RAG systems hallucinate citations too.

## Related

- [[llm-wiki]] — the pattern Annabel's second brain is built on
- [[obsidian]] — the surface for browsing the knowledge graph
