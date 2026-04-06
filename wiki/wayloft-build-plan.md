---
title: "Wayloft Build Plan"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Annabel Filippini
date: 2026-02-27
url: ""
tags: [wayloft, engineering, build]
---

# Wayloft Build Plan

## Key Takeaways
- All core features COMPLETE: Auth, Card Portfolio, Statement Credit Tracker, Perks & Benefits, AF Decision Helper, Payment Tracker, Experience Level, Spending Optimizer, Card Recommendation Engine (5-step quiz), Transfer Bonus Tracker, Flight Search (Duffel sandbox)
- 7 issuer rules implemented: One Sapphire, Chase 5/24, Barclays 6/24, Citi 8/48, Amex lifetime, Marriott cross-issuer, Capital One triple pull
- 54 SSG card review pages + 9 best-for articles + affiliate infrastructure
- Scraper pipeline: Node.js + cheerio (NOT Python). 2 sources: Frequent Miler + Doctor of Credit. Vercel Cron daily 6 AM ET
- Database backup: automated pg_dump to Cloudflare R2 via GitHub Actions
- Duffel sandbox working — live access blocked on business registration. Zero code changes needed, just swap API key
- [[worth-it-tool]] shipped: public SSG at `/credit-cards/[slug]/worth-it`, 16 unit tests, no auth required
- 159 total tests passing across 10 test files
- Signal design system at 9/10
- Checkpoint logic: if Worth-It <50 Reddit uses → pivot to content/SEO

## Notable Claims
- Credit tracker details: Amex Platinum has 7 credits, CSR has 4, Amex Gold has 4
- Card reviews completed for 15 cards with quality ratings (3/5 to 5/5)
- ActionResult<T> pattern on all server actions, eliminated SELECT *, soft delete migration

## Conflicts
- Best-for articles: says 9 categories. [[wayloft-ux-handoff]] says 5 (this doc is newer/authoritative)
- Card count varies: 52 in some places, 54 in others
