---
title: "Wayloft Engineering Review"
type: source
created: 2026-04-05
updated: 2026-04-05
author: BB Engineering
date: 2026-04-01
url: ""
tags: [wayloft, engineering, review, quality]
---

# Wayloft Engineering Review

## Key Takeaways
- Reviewed 4-week distribution sprint ([[three-layer-funnel]]). CEO plan accepted 6 scope expansions.
- CRITICAL GAP: computeValueBreakdown() had ZERO tests — the core function behind the public [[worth-it-tool]]
- 148 test cases across 9 files at review time (later grew to 159 after Worth-It tests added)
- CI gap: tests NOT in GitHub Actions — only lint/type-check/build
- Zero E2E tests exist. Only 1/6 modules tested (engine.ts) — 17% coverage
- Extension build tooling: Vite + CRXJS plugin for Manifest V3
- OG images should use @vercel/og on Edge Runtime (~50ms cold starts)
- chrome.storage.sync has 100KB limit — no test, no error handling, silent failure risk
- cards.ts is 696 lines — largest server action file
- Stale files: wayloft-main/ (600MB duplicate), pnpm-lock 2.yaml

## Outside Voice Findings
- Building 4 channels in 4 weeks risks 4 half-baked surfaces
- Extension is hardest surface (MV3 constraints, 30s service worker timeout)
- Worth-It tool has no plan for how strangers find it
- Newsletter has no subscriber source
- Missing analytics and legal/compliance

## Quotes
> "CRITICAL GAP: computeValueBreakdown() has ZERO tests. This is the function you're extracting into a public-facing, SEO-critical tool."

> "Strategic focus — Building 4 channels in 4 weeks risks 4 half-baked surfaces. Single founder starting full-time job."

## Conflicts
- Test count: 148 here vs 159 in build plan (resolved: Worth-It tests added after this review)
