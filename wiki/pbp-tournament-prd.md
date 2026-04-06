---
title: "Tournament Aggregator PRD"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Ace (PM)
date: 2026-02-00
url: ""
tags: [pbp, tournaments, product, scraping]
---

# Tournament Aggregator PRD

## Key Takeaways
- Problem: tournament info is "catastrophically fragmented" — players must check 6+ sites and still miss events
- Market owned by Dundon's pickleballtournaments.com + pickleball.com duopoly
- Vision: "definitive tournament database for the sport" in 12-18 months
- 12-month targets: 5,000+ verified tournaments, 25,000 registered users, 50,000 email list, 500K monthly page views
- 12 scraper sources across P0-P3 priority tiers
- Deduplication: trigram similarity >= 0.85 via pg_trgm, date tolerance +/- 2 days
- Confidence scoring 0.0-1.0 per field (director-confirmed=1.0, single source=0.50-0.70, Facebook-only=0.30)
- Conflict resolution priority: tournament director > USA Pickleball > pickleballtournaments.com > PPA/APP > all others
- Director validation system: magic link email → pre-filled verification form → "Verified by Director" badge
- Director self-submission portal + dashboard with event stats
- User account tiers: Anonymous → Email Subscriber → Full Account → Community
- Progressive profile with gamified completion bar + "Verified Player" badge
- Phase 0-4 over 15 weeks, Phase 5-6 (migration + monetization) weeks 14-18+

## Quotes
> "Pickleball tournament information is catastrophically fragmented."

> "We are building a clearinghouse, not a competing registration platform."

## Conflicts
- Appendix says "Astro (now) → Next.js 15 (Phase 5)" — but main PRD shows Next.js already deployed. Tournament PRD likely written before migration.
