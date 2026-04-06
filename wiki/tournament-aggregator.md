---
title: Tournament Aggregator
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [pbp-tournament-prd.md, pbp-prd.md]
tags: [pbp, feature, tournaments, scraping]
missing_links: [pickleballtournaments-com, usa-pickleball, ppa-tour, app-tour]
---

# Tournament Aggregator

[[pickleball-portal]]'s initiative to build the "definitive tournament database for the sport." Currently broken (Spider.cloud blocked by retailers). Approved for rebuild with custom scraper architecture.

## The Problem

Tournament info is "catastrophically fragmented." A 4.0 player in Denver must check pickleballtournaments.com, USA Pickleball, Facebook groups, club emails, 3+ other sites, and will still miss events. Market owned by Dundon's duopoly (pickleballtournaments.com + [[pickleball-com]]).

## Architecture

- **12 scraper sources** across P0-P3 priority tiers
- **Deduplication:** trigram similarity >= 0.85 (pg_trgm), date tolerance +/- 2 days, city normalization
- **Confidence scoring:** 0.0-1.0 per field. Director-confirmed=1.0, 3+ sources=0.95, single source=0.50-0.70, Facebook-only=0.30
- **Conflict resolution:** Tournament director > USA Pickleball > pickleballtournaments.com > PPA/APP > all others
- **Custom user-agent:** `PickleballPortalBot/1.0`

## Director Validation System

- Outreach on: date/fee inconsistency, low confidence (<0.60), single source, new director found
- Magic link email → pre-filled verification form → "Verified by Director" badge
- Director self-submission portal + dashboard with event stats
- "Every director we email is a relationship."

## Phased Build (15 weeks)

| Phase | Weeks | Goal |
|-------|-------|------|
| 0 | 1-2 | Scraper infra, 1,000+ canonical tournaments |
| 1 | 3-5 | Public directory, 50 state landing pages, 2,500+ pages indexed |
| 2 | 5-7 | Director outreach, 50 verified tournaments |
| 3 | 7-10 | User accounts, 5,000 emails, 1,000 accounts |
| 4 | 11-15 | Community (check-ins, reviews, partner requests) |

## 12-Month Targets
5,000+ verified tournaments, 25,000 registered users, 50,000 email list, 500K monthly tournament page views

## Strategic Position
"We are building a clearinghouse, not a competing registration platform." Synergistic with Dundon — PBP sends them registration traffic.

## Current Status
BROKEN — Spider.cloud blocked by anti-bot. Needs rebuild with Playwright/Puppeteer for JS-heavy pages + Cheerio for static HTML.
