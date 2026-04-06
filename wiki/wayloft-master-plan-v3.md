---
title: "Wayloft Master Plan v3.5"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Tom Filippini
date: 2026-02-27
url: ""
tags: [wayloft, strategy, architecture]
---

# Wayloft Master Plan v3.5

## Key Takeaways
- Strategic pivot in v3.0: no single external API dependency. Seats.aero and AwardWallet moved from "required for MVP" to "nice-to-have acceleration"
- AwardWallet conflict of interest: co-founder also co-founded Point.me (direct competitor)
- Revenue model: affiliates primary (55-65%), subscriptions secondary (25-30%). Research shows affiliates yield 2-3x subscription revenue
- Subscription tiers: Free ($0) and Pro ($9.99/mo or $79/yr)
- 5-layer self-reliant data architecture: manual entry → Chrome extension → email parsing → Duffel flights → third-party APIs from strength
- Build priority: Credit Cards → Flights → Semi-Private
- 52 cards across 9 issuers in catalog. 5 transfer currencies (UR, MR, TYP, C1, Bilt)
- 13 canonical spending categories for [[cpp-optimization]]
- Automation framework: 13 skills, 12 agents, 30 sub-agents. "Solo founder leverage"
- DO NOT scrape airline websites — active litigation risk
- Phase 3 targets: 1K users (Month 5), 10K users (Month 9), $100K ARR (Month 9)
- Budget (Phase 0-2): $5,000-$8,000
- Seller of Travel registration required in CA, FL, HI, WA before accepting bookings
- Plaid integration planned Month 7-8 ($500/mo base) for "Wrong Card" alerts

## Notable Claims
- CPP valuations: Amex MR=2.0c, Chase UR=1.8c, Capital One=1.5c, Citi TYP=1.5c, Bilt=1.8c
- Issuer rules: [[chase-5-24]], Amex once-per-lifetime, Citi 8/48, Barclays 6/24
- 27 notification types with frequency caps (max 2 push/day, max 3 emails/week)
- Duffel search-to-book ratio: 1500:1 — needs aggressive Redis caching (4hr TTL)
- No Southwest in Duffel — workaround: "Check Southwest" link

## Quotes
> "Wayloft will not depend on any single external API for its core functionality."

> "Solo founder leverage: one person operates with the throughput of a 5-person team."

## Conflicts
- Scraper language: says Python (Playwright + BeautifulSoup). [[wayloft-build-plan]] says Node.js + cheerio (what was actually built)
- Scraper frequency: says 3x/day. Build Plan says daily at 6 AM ET (actual Vercel cron)
