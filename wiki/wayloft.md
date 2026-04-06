---
title: Wayloft
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [wayloft-master-plan-v3.md, wayloft-build-plan.md, wayloft-eng-review.md, wayloft-ux-handoff.md, wayloft-three-layer-funnel.md, wayloft-signal-design.md, wayloft-ellis-church.md, bb-session-2026-04-04-wayloft-landing-page.md]
tags: [wayloft, business, hub]
missing_links: [nerdwallet, the-points-guy, card-pointers, awardwallet, maxrewards, cpp-optimization, retention-offers, statement-credits]
---

# Wayloft

Travel rewards optimization platform. "Think 'Mint for credit card points.'" Helps users maximize credit card portfolio value through portfolio management, transfer bonus tracking, flight search, and spending optimization. Fully built, zero users. Pre-launch — Reddit launch imminent.

**Target user:** 22-35, has 2-5 travel credit cards, wants to maximize value without becoming a spreadsheet person.

## Current Strategy

[[three-layer-funnel]] — distribution, not features. No new backend for 4 weeks. Everything is content, distribution, or extracting existing features into public-facing tools. [[ellis-church]] is the public voice. [[worth-it-tool]] is the googleable wedge.

## Core Features (ALL COMPLETE)
- **Portfolio Management** — card picker, detail pages, 13 spending categories, [[cpp-optimization|CPP-weighted]] optimization
- **Annual Fee Decision Helper** — [[retention-offers|retention offer]] logging, downgrade comparisons
- **[[worth-it-tool]]** — public SSG, no auth, keep/call/downgrade verdict, 16 tests
- **Statement Credit Tracker** — auto-generated rows, period tracking, effective annual fee
- **Perks & Benefits Reference** — interactive checklist, 50+ non-monetary benefits
- **Card Recommendation Engine** — 5-step quiz, scoring, comparison, 54 SSG card pages, 9 best-for articles
- **[[transfer-partners|Transfer Bonus Tracker]]** �� scraper pipeline, daily cron
- **Flight Search** — Duffel sandbox working, live access blocked on business registration
- **Experience Level System** — beginner/intermediate/advanced with conditional visibility

## Design
- [[signal-design-system]] — "Like a Bloomberg terminal designed by Linear." Rated 9/10.
- [[ellis-church]] — AI persona/voice. "Not a chatbot. Not a feature. The author."
- **Landing page (Apr 4):** Full platform introduction, not Worth-It funnel. Premium/aspirational aesthetic. "Your points, properly spent." headline. Steel credit card hero image. Playfair Display serif explored then reverted — typography direction unresolved. Landing page may intentionally diverge from Signal's Geist-only rule.

## Tech Stack
- **Frontend:** Next.js 15, Tailwind CSS v4, shadcn/ui, Zustand, TanStack Query
- **Backend:** Next.js API Routes + Hono (edge), Trigger.dev, Node.js + cheerio scrapers
- **Data:** Supabase (PostgreSQL + RLS), Upstash Redis, Meilisearch, Cloudflare R2
- **Deploy:** Vercel, Cloudflare Workers, GitHub Actions CI
- **Quality:** 159 tests passing, ActionResult<T> pattern, soft delete, scraper confidence scores

## Data Assets
- 52 cards across 9 issuers with rich metadata
- 5 transfer currencies (UR, MR, TYP, C1, Bilt) with partner mappings
- 7 issuer rules implemented (Chase 5/24, Amex lifetime, etc.)
- 13 canonical spending categories

## Revenue Model
- [[affiliate-revenue-model|Affiliates]] primary (55-65%), subscriptions secondary (25-30%)
- Free ($0) and Pro ($9.99/mo or $79/yr)
- No budget for paid acquisition — organic only

## Competitive Landscape
- [[maxrewards]] — 800K+ users, broadest adoption
- [[card-pointers]] — closest competitor, portfolio optimization focus
- [[the-points-guy]] — content-heavy, affiliate-driven, no portfolio tools (Brian Kelly)
- [[nerdwallet]] — broad personal finance, faceless corporate content
- [[awardwallet]] — balance tracking (conflict of interest: co-founder also co-founded Point.me)

## Known Gaps (from Eng Review)
- CI: tests NOT in GitHub Actions (only lint/type-check/build)
- Zero E2E tests. Only 17% code coverage.
- chrome.storage.sync: 100KB limit, no error handling
- 600MB stale duplicate directory (wayloft-main/)

## Open Questions
- Demand validation — only 1 named user
- Chrome extension vs content focus (checkpoint-dependent)
- Duffel live access (blocked on business registration)
- Seller of Travel registration (CA, FL, HI, WA)

## Related
- [[pickleball-portal]] — sister project, shared [[ai-persona-model]], shared [[affiliate-revenue-model]]
- [[beehiiv]] — newsletter platform (Layer 2)
