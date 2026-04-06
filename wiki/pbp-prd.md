---
title: "Pickleball Portal Master PRD"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Tom Filippini
date: 2026-02-18
url: ""
tags: [pbp, product, strategy, architecture]
---

# Pickleball Portal Master PRD

## Key Takeaways
- Vision: "Pickleball Portal is the ESPN of pickleball"
- Strategic positioning: Consumer = "The Athletic meets Wirecutter"; Brands portal = "Bloomberg Terminal"
- Founded November 2017. One of the first pickleball content sites ever built.
- Domain Rating 43 (Ahrefs), 2,600+ backlinks, 566 linking domains
- [[pickleball-com]] (Dundon/UPA) valued at $800M — will never be trusted as unbiased. That gap is the moat.
- Exit plays: (A) sell to Dundon/UPA as intelligence arm; (B) operate profitably at $20-35K/mo
- [[portal-score]]: proprietary 0-100 composite rating, range 66-97 (avg 85.5), algorithm is SECRET
- 188 Playwright tests across 12 files — ALL PASSING
- Infrastructure costs: Cloudinary $249/mo; Vercel, Supabase, Beehiiv, GitHub all free tier
- BROKEN: paddle price crawler (Spider.cloud blocked), tournament scraper (Spider timeout), rankings scraper (PPA API dead, DUPR 403)
- Beehiiv API key exposed in Discord 2/16 — needs rotation
- GEO average citability: 34/100; only 1 article GEO-ready (buyer's guide at 88/100)
- Content pipeline: AI-scouted topics, contributor claims, target 4-8 articles/week
- Contributor pay: Standard $75, Expert $125, Premium $200, HARO $50
- "My Portal" personalized feed + Universal Follow Button on every entity
- Meme section with AI generator (Nano Banana Pro / Gemini 3 Pro Image)
- 817 legacy WordPress comments migrated to Supabase
- Padel expansion opportunity: top US padel site is DA 8 vs PBP's DR 43

## Quotes
> "Pickleball Portal is the ESPN of pickleball."

> "pickleball.com will never be trusted as unbiased. That gap is our moat."

## Conflicts
- Paddle count: says 502 in places, 428 in others. 428 appears to be actual DB count.
- Article count: 303 here vs 409 in architecture doc (different dates)
- JustPaddles listed as ACTIVE #1 priority — now dead per affiliate tracker
- 3 different GA4 IDs across docs — only G-J7Y27KM430 is correct
