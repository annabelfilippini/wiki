---
title: Worth-It Tool
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [wayloft-build-plan.md, wayloft-three-layer-funnel.md, wayloft-eng-review.md, bb-session-2026-04-04-wayloft-landing-page.md]
tags: [wayloft, feature, seo, distribution]
missing_links: []
---

# Worth-It Tool

[[wayloft]]'s public-facing "Is Your Card Worth It?" tool. The Layer 1 googleable wedge in the [[three-layer-funnel]]. No auth required. Shipped as part of the distribution sprint.

## How It Works

- Route: `/credit-cards/[slug]/worth-it`
- User toggles which benefits they actually use
- `computeValueBreakdown()` calculates net value
- Verdict: **KEEP** (net >= $50) | **CALL** (-$50 to +$50) | **DOWNGRADE** (< -$50)
- Shareable OG card image for social distribution
- CTA: create a portfolio (conversion to full app)
- Attribution: "Analysis by [[ellis-church]]"

## Technical Details

- Public SSG page (statically generated)
- Core function: `computeValueBreakdown()` extracted to `lib/cards/worth-it.ts`
- 16 unit tests
- OG images should use @vercel/og on Edge Runtime (~50ms cold starts)

## SEO Strategy

Target queries: "[card name] worth the annual fee", "[card name] review 2026", "is [card] worth it"

High-intent, lower competition. 54 card pages = 54 SEO opportunities.

## Critical Gap (Flagged in Eng Review)

`computeValueBreakdown()` had ZERO tests before the eng review — the core function determining whether strangers see KEEP or DOWNGRADE. Tests were added afterward (159 total tests post-fix).

## Checkpoint Logic

If <50 Reddit uses → pivot to content/SEO. If >50 → evaluate extension build.

## Landing Page Positioning (Apr 4)

Worth-It was demoted from landing page hero to a navigation item. The landing page's job is now to introduce Wayloft as a platform, not funnel to one tool. Worth-It remains the Layer 1 SEO wedge and keeps its own SSG pages.

## Related
- [[three-layer-funnel]] — strategic context
- [[ellis-church]] — the voice behind the analysis
- [[signal-design-system]] — visual presentation
