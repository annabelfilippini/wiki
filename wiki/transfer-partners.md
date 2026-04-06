---
title: Transfer Partners
type: concept
created: 2026-04-05
updated: 2026-04-05
sources: [wayloft-master-plan-v3.md, wayloft-build-plan.md, wayloft-ux-handoff.md]
tags: [wayloft, core-concept, travel-rewards]
missing_links: [frequent-miler, doctor-of-credit]
---

# Transfer Partners

Airline and hotel loyalty programs that accept point transfers from credit card currencies. Central to [[wayloft]]'s value proposition — helping users understand which cards transfer to which programs, at what ratios, and when bonuses are active.

## Five Transfer Currencies

| Currency | Issuer | CPP Valuation | Key Partners |
|----------|--------|---------------|-------------|
| Ultimate Rewards (UR) | Chase | 1.8c | United, Hyatt, Southwest, British Airways |
| Membership Rewards (MR) | Amex | 2.0c | Delta, ANA, Hilton, Singapore |
| ThankYou Points (TYP) | Citi | 1.5c | Turkish, JetBlue, Accor |
| Capital One Miles (C1) | Capital One | 1.5c | Air Canada, Turkish, Wyndham |
| Bilt Points | Bilt | 1.8c | Hyatt, American Airlines, United |

## Transfer Bonus Tracker

Wayloft feature that monitors temporary bonus transfer rates (e.g., "30% bonus on UR → United this month"). Built with:
- Scraper pipeline: Node.js + cheerio, sourcing from [[frequent-miler]] + [[doctor-of-credit]]
- Vercel Cron daily at 6 AM ET
- Urgency display: Red <48hrs, amber <7 days, green >7 days

## Strategic Note

Transfer bonuses were originally proposed as Wayloft's wedge, but the [[three-layer-funnel]] analysis concluded the audience is too small and already served by Frequent Miler. The AF decision helper ([[worth-it-tool]]) is the better entry point. Transfer bonuses moved to Layer 2 (newsletter content).

## Related
- [[cpp-optimization]] — how transfer partner value is calculated
- [[wayloft]] — parent product
