---
title: Pickleball Portal
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [pbp-prd.md, pbp-architecture.md, pbp-brand.md, pbp-pikolai-notes.md, pbp-affiliate-tracker.md, pbp-tournament-prd.md, bb-session-2026-04-04-pbp-identity.md, bb-session-2026-04-04-pbp-triage.md]
tags: [pbp, business, hub]
missing_links: [the-dink, pickleball-kitchen, paddle-finder, price-tracker, selkirk, joola, ppa-tour, app-tour, mlp]
---

# Pickleball Portal

"The ESPN of pickleball." Independent authority and e-commerce hub. Founded November 2017 by Tom Filippini — one of the first pickleball content sites ever built. 100K+ monthly visitors, DR 43, 800+ indexed URLs.

**Tagline:** "Your Window Into the World of Pickleball"

**Identity (decided Apr 4):** Data-powered media company. Content SEO drives 100K visitors (distribution); data layer monetizes them (differentiation). Dropping content velocity would decay traffic in 6 months. Both engines matter.

**Strategic positioning:** Consumer = "The Athletic meets Wirecutter"; Brands portal = "Bloomberg Terminal"

**Lead product:** Consumer data product — price alerts, premium comparisons. Already has the infrastructure (428 paddles, 19 retailers, Portal Scores). Tournament marketplace is Phase 2 (requires B2B sales motion).

## Current State
- Next.js 15 on Vercel behind Cloudflare
- 409 articles (Markdown in git repo), 428 paddles (Supabase), 154 tournaments
- [[pikolai-starostin]] — AI CEO persona
- 2,219 newsletter subscribers (45% open rate) via [[beehiiv]]
- 188 Playwright tests — ALL PASSING
- Domain Rating 43, 2,600+ backlinks, 566 linking domains

## Core Features
- **[[paddle-finder]]** — AI-powered quiz, 500+ paddles
- **[[portal-score]]** — proprietary 0-100 paddle rating (algorithm is SECRET)
- **[[tournament-aggregator]]** — multi-source tournament database (currently BROKEN, Spider.cloud blocked)
- **[[price-tracker]]** — 19 retailers, 6-hour updates (BROKEN — same Spider issue)
- **Pro Player Rankings** — PPA API dead, DUPR returns 403
- **News Aggregation** — fetch-news cron daily 6 AM
- **Newsletter** — Pikolai writes, Beehiiv delivers

## Revenue
- [[affiliate-revenue-model|Affiliate commissions]] — current ~$80/mo (Amazon only)
- **Potential with all tiers: ~$1,000+/mo**
- Applied Apr 3: [[selkirk]] (15%), [[joola]] (10-12%), CRBN (10-15%)
- Skimlinks deployed (48K+ merchants, 25% cut)
- Exit plays: (A) sell to Dundon/UPA as intelligence arm; (B) operate profitably $20-35K/mo

## Brand Identity
- Portal Green #22c55e, Dark Green #104E29, Charcoal #1a1a2e
- Lucide React ONLY for icons. No emojis anywhere.
- Real photos only — no AI-generated images
- "100% independent — no brand owns us, no publisher controls us"
- "We test and rate FIRST, monetize SECOND."

## Competitive Landscape
- [[pickleball-com]] — Dundon/UPA, $800M valuation. "Will never be trusted as unbiased. That gap is our moat."
- [[the-dink]] — newsletter + news, but no tools or data
- [[pickleball-kitchen]] — beginner guides, PBP covers all levels deeper
- [[paddle-finder|JustPaddles]] — retailer (dead affiliate, links removed)
- Moat: "Founded 2017 + DA 43 + AI tools + multi-retailer data + independence. Nobody else has all five."

## Known Issues
- GA4 ID wrong in .env.local (has old ID, correct is G-J7Y27KM430)
- IndexNow broken (Next.js catch-all intercepts)
- ~111 articles need SEO rewrites
- Beehiiv API key exposed in Discord 2/16 — needs rotation
- 26 paddles missing images
- 17 JustPaddles text mentions remain in content
- GEO citability: 34/100 average (only 1 article GEO-ready)

## Current Approach (Apr 4)

Ship, Learn, Redesign — phased. [[clean-before-build]] pattern applied.

- **Phase 1 (days):** Fix affiliate CTAs, price alert CTAs, broken pipelines. Largely done.
- **Phase 2 (weeks):** Targeted redesign informed by Clarity recordings + email data.
- **Phase 3 (when metrics justify):** Full data-powered rebrand.

**External blockers:** Tom (Amazon Creators creds), Selkirk/JOOLA/CRBN (affiliate approval, applied Apr 3).

## Roadmap (original, partially superseded by phased approach above)
- **Tier 1 (30 days):** Fix 404s, Pikolai operational, public presence
- **Tier 2 (90 days):** Decision log, beginner path, tournament aggregator rebuild, merch
- **Tier 3 (6-12 months):** Premium membership, community layer, multi-agent org, Padel expansion
- **Long game:** "AI-native sports authority media" — governance model is the IP

## Related
- [[wayloft]] — sister project, shared [[ai-persona-model]], shared [[affiliate-revenue-model]]
- [[beehiiv]] — newsletter platform
