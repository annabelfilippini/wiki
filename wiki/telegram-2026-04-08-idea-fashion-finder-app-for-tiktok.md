---
title: "Fashion Finder — TikTok Hauls Angle"
type: source
created: 2026-04-08
updated: 2026-04-08
author: Annabel Filippini
date: 2026-04-08
url:
sources: []
tags: [telegram, product-idea, fashion, ai-agent, tiktok, lite-ingest]
lite_ingest: true
needs_deep_ingest: false
---

# Fashion Finder — TikTok Hauls Angle

## Key Claims
- Second brain dump of the [[telegram-2026-04-06-fashion-finder-idea|fashion finder agent]] concept — this time with an explicit **TikTok hauls** wedge.
- "Fashion finder app for TikTok hauls" = the narrowest surface area for the earlier photo-to-shopping agent concept: take a TikTok haul video, identify each clothing item, return shopping links.
- Tagged `#idea`, routed to `outputs/business-ideas.md` as `idea-2026-04-08-001`.

## Why This Is Interesting
- TikTok hauls are a *self-contained, high-intent, short-form* input — unlike open-ended "photo of an outfit in the wild" framing, the creator has already shown multiple items and is implicitly inviting questions about where they're from.
- Wedge is crisper than the original fashion-finder idea: specific source format (TikTok video), specific use case (haul attribution), specific user intent (want to buy what the creator showed).
- Affiliate revenue model ([[affiliate-revenue-model]]) applies cleanly if attribution works.

## Open Questions (for deep ingest)
- Does TikTok's API/ToS allow video frame extraction at any scale that isn't a legal risk?
- Is the wedge "identify items in TikTok hauls" *worse* than "search hauls for a specific item you saw" — i.e. is the user query reverse-mapped to videos vs. forward-mapped from videos?
- Why now? What changed between the Apr 6 fashion-finder brain dump and this one — did a specific TikTok trigger it, or is Annabel narrowing scope?

## Update — Iteration 3 landed (Apr 8 afternoon)
A third brain dump ([[telegram-2026-04-08-idea-when-i-take-a-pic]]) proposes **Google Image Search / Lens as the implementation primitive**, collapsing the CV-model question and reopening the broader "photo of anything in the wild" framing. Implication for this TikTok-specific wedge: the primitive question (can the tech identify items?) is now partially answered (Google Lens works on still frames), but the wedge question (is TikTok hauls the right entry point vs. open-ended photos?) is still open. The TikTok wedge may still be the right narrow entry even if the primitive is Lens, not custom CV — because TikTok hauls constrain the search space and the user intent.

## Connections
- [[telegram-2026-04-06-fashion-finder-idea]] — iteration 1 (Apr 6): the want
- [[telegram-2026-04-08-idea-when-i-take-a-pic]] — iteration 3 (Apr 8): the primitive
- [[ai-persona-model]] — agent architecture reference
- [[affiliate-revenue-model]] — how this monetizes
