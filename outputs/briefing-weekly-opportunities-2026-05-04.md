---
title: 'Weekly Opportunity Scan — 2026-05-04'
type: synthesis
created: 2026-05-04
updated: 2026-05-04
scan_type: weekly-opportunities
sources: []
tags: [briefing, weekly-opportunities]
---

# Weekly Opportunity Scan — 2026-05-04

## Top 5

1. **Loyalty Devaluation Alerter** — "Alert me the moment my points are worth less." Real event driving this: Aeroplan +20–67% effective June 1, Amex→Cathay cut from 1:1 to 5:4 (March 1), Capital One→Emirates cut to 1,000:750 (January). Desperate user: the miles hoarder sitting on 500K points who found out about the Cathay cut *after* trying to book. PointsYeah does award *space* alerts; nobody does program *ratio change* alerts + portfolio impact calculator. Distribution: SEO on "[program] devaluation 2026" (high search volume right now), Wayloft native, FlyerTalk community links. Unit economics: freemium + $9/month for real-time alerts. Maintenance: cron job watching program terms pages + diff on award chart PDFs. Solo-founder friendly. **This is a Wayloft build — not a side project.** ([Aeroplan June 2026 devaluation](https://onemileatatime.com/news/aeroplan-updating-award-chart-devaluation/), [Amex→Cathay cut](https://www.mileagespot.com/blog/amex-points-transfer-devaluation-2026/))

2. **Cursor SDK Agent Templates for Non-Engineers** — Cursor SDK launched April 29 (TypeScript, sandboxed VMs, token pricing). Rippling, Notion, Faire already using it. The gap: PMs and ops teams read about it on Twitter, want to wire agents into their workflows (auto-spec PRDs from Jira, auto-retrospective from Slack), but can't write TypeScript. No template marketplace exists yet. Desperate user: PM at a Series A startup who has Cursor Pro but has never opened a terminal. 10x better than: manually re-prompting Claude one-off each sprint. Distribution: ProductHunt + Lenny's Newsletter + Show HN. Economics: template marketplace at $29–$79/template pack, or $29/month SaaS wrapper. Kill signals: Cursor itself could ship a template marketplace (watch for 30 days). **Window is ~3 weeks before someone else or Cursor itself closes it.** ([Cursor SDK launch](https://cursor.com/blog/typescript-sdk), [MarkTechPost coverage](https://www.marktechpost.com/2026/04/29/cursor-introduces-a-typescript-sdk-for-building-programmatic-coding-agents-with-sandboxed-cloud-vms-subagents-hooks-and-token-based-pricing/))

3. **New Grad Total Compensation Decoder** *(carry from Apr 27, still uncontested)* — 23% of Gen Z not enrolled in their company 401(k); Gen Z starts saving at median age 20 but the average balance is $13,500 vs. $67K for millennials, pointing to enrollment friction not intent. Desperate user: new grad offer letter in hand, equity/bonus/RSU/ESPP terms all unfamiliar. No product found that decodes *total* comp (salary + equity + benefits + expected tax) in one place for early-career workers. CareerHub launched April 29 — it's a job *matching* tool, not a comp decoder. 10x better than: Googling RSU vesting schedules. Distribution: r/cscareerquestions, LinkedIn new grad content, Okta/tech onboarding communities. Economics: $9/month or one-time $19 report. Low maintenance, high lifetime value if tied to card referrals (e.g., "with this comp, here's the right card"). ([23% not enrolled](https://www.benefitspro.com/2025/03/03/23-of-gen-zers-arent-enrolled-in-the-company-401k-3-ways-to-engage-this-younger-generation/), [CareerHub April 29 launch](https://www.globenewswire.com/news-release/2026/04/29/3283696/0/en/CareerHub-Launches-AI-Powered-Platform-That-Matches-Job-Seekers-to-Roles-Using-Their-Resume-Instead-of-Keywords.html))

4. **Managed LLM Wiki (Second Brain as a Product)** *(carry from Apr 13 + validated this week)* — A Karpathy-style LLM wiki hit the HN week-of-April-25 top 10, confirming community appetite. The existing "solutions" are: (a) Annabel's own setup (requires Claude Code + Obsidian + CLAUDE.md schema), (b) developer DIY on HN. No managed, non-technical version exists. Desperate user: non-technical founder who listened to the Karpathy interview, wants their notes to compound, won't set up an Obsidian vault. 10x better than: Notion AI that forgets everything between sessions. Distribution: HN, Karpathy Twitter followers, PKM communities (Obsidian Discord, Building a Second Brain). Economics: $29/month managed hosting + ingestion. Kill signals: Obsidian itself or Notion could move here, but neither has. **Window is open but narrowing — the HN signal means others are building.** ([BestOfShowHN week of Apr 25](https://bestofshowhn.com/week))

5. **AI Displacement Career Compass** — NOT a resume writer (market saturated). Specific angle: "I am a [job title] — what is my 90-day pivot plan?" Goldman Sachs projects 16K AI-displaced US jobs/month; Meta cutting 8K, Microsoft cutting 12K simultaneously. Gen Z is the hardest hit cohort. The pain is not "help me apply" (AIApply, Sonara, Joblet exist) — it's "what should I *become*?" with a real curriculum, skill gap analysis, and weekly check-in. Desperate user: 28-year-old content writer at a mid-size company reading about mass layoffs, no clear next skill to learn. 10x better than: a LinkedIn Learning course recommendation. Distribution: LinkedIn organic (this content goes viral), r/layoffs, Blind. Economics: $19/one-time plan or $15/month accountability tier. Kill signals: LinkedIn Learning / Coursera could build this — watch for 60 days. ([Goldman AI layoffs](https://www.benefitspro.com/), [AI hiring displacement stats](https://enhancv.com/blog/ai-hiring-statistics/))

---

## Killed This Week

- **Social media scheduling tool** — killed because Buffer is $6/month and 21 competitors exist; pain point is pricing, not capability gap
- **Tariff tracker / import duty calculator** — killed because Flexport, NerdWallet, project44 all offer free calculators; no moat for solo founder
- **GEO / AI visibility for brands** — killed because HubSpot, Profound, Peec AI ($89/month seed-funded), and Semrush are all shipping; market won't be solo-founder territory in 90 days
- **AI agent observability platform** — killed because Galileo, Braintrust, Arize, and Maxim are all funded and in production; enterprise market, wrong tier for solo founder
- **Deterministic browser automation (Libretto pattern)** — killed because Playwright, Browser-use, and Browserbase are entrenched infrastructure; Libretto validates demand but solo founder can't compete at the infra layer
- **Vertical CRM for [niche]** — killed because every list says this, nobody specifies the desperate user, and it requires 6-month sales cycles to validate; graveyard idea

---

## Watch List

- **TracksSuccession pattern for other domains** — TracksSuccession (172 HN points, April 16) scrapes SEC filings to alert on C-suite changes. Same pattern applied to: loyalty program terms pages (→ Wayloft devaluation alerter), regulatory filings (→ compliance SaaS), app store changelog diffs (→ competitor monitoring). The pattern is validated; picking the right domain is the work.
- **Cursor SDK marketplace** — Cursor SDK launched April 29. If Cursor doesn't ship a first-party template marketplace in 30 days, the opportunity window widens. Check back May 29.
- **App Store AI boom** — App Store up 104% YoY in April 2026. Lovable hit $20M ARR in 2 months. The no-code-to-product pipeline is real. Watch for which verticals are undersupplied (not productivity tools — that's crowded).

---

## Kill / Build Signal

**Wayloft — STRONG BUILD.**
Three major loyalty devaluation events in 8 weeks: Amex→Cathay (March 1, 5:4 ratio), Capital One→Emirates (January, 1:0.75 ratio), Aeroplan (June 1, up to +67% on premium cabins with a May 31 booking cliff). This is the most concentrated run of loyalty devaluations in recent memory. Zero dedicated consumer-facing alert tools exist — PointsYeah tracks *award space*, not *program changes*. The Loyalty Devaluation Alerter is a Wayloft native build: it solves the same user problem (optimize points) at a moment of maximum pain (points just lost value). SEO will spike on "[program] devaluation 2026" searches. Build this as the Worth-It tool's companion: "Is your card worth it?" → "Are your points still worth what you think?" The cron job diff approach is solo-founder maintainable.

**Second Brain — STRONG SIGNAL.**
A Karpathy-style LLM wiki made the HN top 10 for the week of April 25–May 2. This is the second consecutive signal (after the Apr 13 scan) that community appetite for the managed second brain pattern is real and growing. The non-technical managed version remains unbuilt. The window is open but narrowing — others are building on HN right now.

**Community Engine — No signal this week.**

---

## Raw Sources

- [Aeroplan June 2026 devaluation — One Mile at a Time](https://onemileatatime.com/news/aeroplan-updating-award-chart-devaluation/) — June 1 award chart changes, up to +67% on premium cabins
- [Aeroplan devaluation full breakdown — LoyaltyLobby](https://loyaltylobby.com/2026/04/26/air-canada-aeroplan-flight-rewards-changes-effective-june-1-2026-miles-required-up-by-max-67/) — max 67% increase detail; why included
- [Amex Membership Rewards devaluation 2026 — MileageSpot](https://www.mileagespot.com/blog/amex-points-transfer-devaluation-2026/) — Amex→Cathay 1:1→5:4 cut March 1 2026
- [Aeroplan devaluation — FrequentMiler](https://frequentmiler.com/aeroplan-devaluing-award-chart-but-it-could-be-worse/) — balanced take; still a devaluation
- [8 award travel trends 2026 — point.me](https://www.point.me/insights/award-travel-trends-2026/) — dynamic pricing + devaluation context
- [Cursor SDK launch — cursor.com](https://cursor.com/blog/typescript-sdk) — April 29 launch; sandboxed VMs, subagents, token pricing
- [Cursor SDK deep dive — MarkTechPost](https://www.marktechpost.com/2026/04/29/cursor-introduces-a-typescript-sdk-for-building-programmatic-coding-agents-with-sandboxed-cloud-vms-subagents-hooks-and-token-based-pricing/) — feature detail; Rippling/Notion/Faire already in production
- [23% of Gen Z not enrolled in 401(k) — BenefitsPro](https://www.benefitspro.com/2025/03/03/23-of-gen-zers-arent-enrolled-in-the-company-401k-3-ways-to-engage-this-younger-generation/) — enrollment friction stat; not intent gap
- [CareerHub April 29 launch — GlobeNewswire](https://www.globenewswire.com/news-release/2026/04/29/3283696/0/en/CareerHub-Launches-AI-Powered-Platform-That-Matches-Job-Seekers-to-76-Roles-Using-Their-Resume-Instead-of-Keywords.html) — job matching, NOT comp decoder; confirms gap
- [BestOfShowHN week of Apr 25 — bestofshowhn.com](https://bestofshowhn.com/week) — Karpathy-style LLM wiki in top 10; second brain signal
- [Show HN: BuilderPulse Apr 16 digest — GitHub](https://github.com/BuilderPulse/BuilderPulse/blob/main/en/2026/2026-04-16.md) — TracksSuccession (172 pts), LangAlpha (144 pts), Libretto (87 pts) launches
- [AI hiring displacement stats 2026 — Enhancv](https://enhancv.com/blog/ai-hiring-statistics/) — half of job seekers rejected without a word; Gen Z hardest hit
- [Travel loyalty scam 2026 — Travel and Tour World](https://www.travelandtourworld.com/news/article/travel-loyalty-scam-2026-airlines-and-hotels-accused-of-turning-rewards-into-a-points-trap/) — loyalty trap framing; user frustration context
- [8 loyalty trends 2026 — Currency Alliance](https://www.currencyalliance.com/insights/8-loyalty-trends-for-2026-ai-hands-power-to-the-consumer) — AI handing power to consumer thesis; devaluation context
- [Freelancer scope creep gap — MicroGaps](https://www.microgaps.com/gaps/2026-02-18-ai-scope-creep-detector-freelancers) — ScopeShield MVP February 2026; confirms market but no new signal this week
- [Agentic PM tool gap — AI PM Tools Directory](https://aipmtools.org/articles/future-of-ai-product-management) — only 25% of PM tools score 4-5 on agentic dimension; validates Cursor SDK opportunity
- [30 micro-SaaS Reddit is begging you to build — Greensighter](https://www.greensighter.com/blog/micro-saas-ideas) — general landscape scan; signal extraction source
