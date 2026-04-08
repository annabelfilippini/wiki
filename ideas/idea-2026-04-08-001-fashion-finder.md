---
title: Fashion Finder
type: idea
id: idea-2026-04-08-001
created: 2026-04-08
updated: 2026-04-08
source: telegram
raw_source: raw/telegram-2026-04-08-idea-fashion-finder-app-for-tiktok.md
related_ideas: [idea-2026-04-08-004]
related_raw:
  - raw/telegram-2026-04-08-idea-fashion-finder-app-for-tiktok.md
  - raw/telegram-2026-04-08-idea-when-i-take-a-pic.md
stage: office-hours-done
phase: 1
status: hold
tags: [idea, fashion, reverse-image-search, consumer, anti-gatekeeping]
canonical_user: Elsie Ratner
committed_wedge: browser-extension-first
---

# Fashion Finder

> A tool that looks at an outfit — in a TikTok haul, a photo, a screenshot — and tells you where every piece is from.

## Iteration trail

Annabel has dumped this concept three times in 48h with slightly different wedges:

1. **2026-04-08 — idea-001 (this file):** "fashion finder app for tiktok hauls" — the wedge is TikTok haul videos specifically.
2. **2026-04-08 — idea-004:** "when i take a pic of someones outfit google image search can tell me where everything is from" — the wedge is a camera-first, image-search-backed lookup of any outfit you see in real life.
3. (per 13:35 scratchpad) A third variant exists in the wiki from earlier iteration — flagged as a synthesis candidate.

The fact that it keeps surfacing is signal. Office-hours should treat it as one concept with multiple possible wedges, not as separate ideas.

## Phase 0 — Intake (BB Coordinator)

**Date:** 2026-04-08
**Done by:** BB (inline in the main session)

### One-line hook
"Point your camera at an outfit, get a shoppable bill of materials."

### Why this deserves office-hours treatment
- **It's a recurring pattern, not a passing thought.** Three iterations in 48h means Annabel's brain keeps returning to it. That's exactly the kind of signal the wiki was built to surface.
- **The underlying want is real and specific.** "I want to buy this exact thing I just saw" is a known high-intent commerce moment. Pinterest Lens, Google Lens, ASOS's visual search, ShopStyle all exist because of it — none are beloved, none own the category. The gap is real.
- **The wedge is unclear.** TikTok haul video? Instagram post? Live camera? Screenshot pasted in? Which one is the actual first beachhead? This is exactly what /office-hours should force her to commit to.

### Kill-signal pre-screen
Before burning the interactive cycle, cheap sanity checks:

- **Data freshness cost:** Fashion inventory turns over constantly. Any visual-match backend needs fresh product data. This is the VeloVista-shaped risk — what does it cost to keep the product catalog current at scale? Unknown. Office-hours question.
- **Model cost per lookup:** Reverse-image search over a fashion catalog is GPU-expensive or API-expensive. What does a single "point camera → match 4 items" query cost? Office-hours question. If it's >$0.20/lookup, the unit economics are VeloVista-shaped.
- **Platform dependency risk:** If the wedge is "works inside TikTok," it's one platform rug-pull from dead. If the wedge is "camera in your own app," it avoids that but fights harder for install.
- **Existing competitors to be honest about:** Google Lens, Pinterest Lens, ASOS visual search, LIKEtoKNOWit (rewardStyle/ShopStyle). None nail it, but all exist. Office-hours must force the "why you, why now" answer.

### Route recommendation
**Advance to Phase 1 (office-hours) — interactive.** This is not a kill candidate yet, but it is a "force the wedge + pre-screen the unit economics" candidate. The VeloVista pattern says we must do the cost math before advancing past office-hours to CEO review.

### What Phase 1 should produce
- A committed wedge (one of: TikTok hauls / camera-first / static-image paste / creator-side tagging)
- A specific first-100-users answer
- A concrete cost-per-lookup estimate, or a TODO to get one before CEO review
- A kill signal Annabel would accept ("if X, kill it")

## Phase 1 — Office Hours

**Date:** 2026-04-08
**Method:** `/office-hours` skill (YC forcing questions) with `bb-strategy` persona layered on top
**Status:** COMPLETE — held for field data before advancing to Phase 2

### Canonical user: Elsie Ratner

Movement science major at U Mich, sorority sister of Annabel's. **Specific verified incident:** this past weekend at the bars, Elsie saw her friend Mika wearing a top she wanted. Mika is socially unwilling to share where it's from (gatekeeping). Elsie snuck a photo, tried to search for it, and failed. The emotional stake is identity-level: *"she would feel so much more trendy if she could find the cute top Mika was wearing."*

This is the canonical user — named, real, recent, verified, emotionally-grounded. All product decisions trace back to Elsie.

### Demand evidence (Q1)

**Real:**
- Customer-zero (Annabel): ~20 ID attempts in 30 days.
- Current workaround: screenshot → reverse-search → fail → piece together from existing wardrobe.
- Elsie incident: specific, dated, failed attempt this past weekend.
- ~1 hour/day spent in fashion lookup/want loops (full loop: scroll → want → attempt to ID → shop → settle).

**Soft (converted to assignments):**
- Sister's frequency data is projected, not observed. → Assignment 1
- Sorority friends' demand is projected, not verified. → Assignment 2
- $10/month stated WTP is unreliable — discount to $3–5/month for college-age.

**Key insight:** The recurrence (3 iterations in 48h) is founder instinct, not restlessness. The problem won't let Annabel go, and she has direct unfair-advantage access to Elsie (sorority, can sit with her this week).

### Current workaround (Q2)

- **Annabel:** screenshot → reverse-image-search → fail → approximate with clothes she owns.
- **Sister:** asks in person → socially awkward → sometimes gatekept → gives up.
- **Elsie:** sneak-pic → search → fail → ??? (end of loop unknown — Assignment 3 will find out).

### Positioning reshape (from Q3)

The Elsie answer reshaped the product:

- **Original framing:** "Fashion finder for TikTok hauls."
- **Revised framing:** *An anti-gatekeeping visual search tool for college-aged women who want to close the trend gap with the "it girls" in their social orbit without having to ask.*
- **Job-to-be-done:** NOT saving money. NOT finding exact matches. It's *not being at the mercy of someone else's willingness to share.*

### Committed wedge (Q4)

**SHIP FIRST: Browser extension for TikTok/Instagram. Phone camera app as v2.**

| Option | Verdict |
|---|---|
| A) Phone camera → exact match | ❌ 3-month build. Hardest technical problem (low-quality real-world images). Learn unit economics too late. |
| B) Phone camera → 3 dupes at 3 price points | ❌ Right positioning, wrong first vehicle. Same build-time problems as A. |
| C) Community crowd-source ID | ❌ Requires critical mass from day 1. Cold-start problem unsolved. |
| **D) Browser extension, TikTok/Instagram only** | ✅ **CHOSEN.** Ships in a weekend. Clean source images → higher hit rate. Viral distribution. Tests core visual-search problem cheaply BEFORE committing to app build. |

**Commitment rationale:** Extension serves the 80% frequency version of Elsie's pain (scrolling TikTok wanting things) vs the 20% emotional version (bar photos). The extension is a *throwaway test vehicle* to prove the core visual-search problem is tractable at all, not the forever product. If hit rate + unit economics work → build the phone camera app as v2 to serve the bar-photo moment.

**Annabel's first instinct was "could it be both?"** This is the over-exploration pattern explicitly flagged in her global CLAUDE.md. Pattern fired. Named. Committed after one round of pushback.

### Premises (Phase 3 — all agreed)

1. ✅ Off-the-shelf visual search (CLIP / fashion embeddings) can hit 40%+ close-match rate on static TikTok/Instagram frames. **Single biggest technical risk. Prove first.**
2. ✅ Browser extension is viable as a WEDGE channel (not forever) for college-aged women. The extension is a test vehicle; phone app is the forever home.
3. ✅ Elsie would pay $3–5/month if hit rate is 60%+. Unverified. Requires Assignment 3.
4. ✅ This is a "find/buy the specific thing" product, not a "style what I already own" product. Styling version flagged but deferred.
5. ✅ A weekend MVP extension is realistic alongside Wayloft in SCOPE EXPANSION mode. **Iron constraint: if this becomes a multi-weekend build, Wayloft suffers — kill or park.**

### Kill signals

If any of these fire, kill or pivot:

- **Hit rate < 30%** on Elsie's top 5 "what is this" photos when tested with off-the-shelf visual search. Tech isn't ready. Wait 6 months.
- **Unit cost > $0.50/lookup** at scale. VeloVista-shaped. Find cheaper models or kill.
- **Elsie gives up in <2 minutes** during the workaround observation and doesn't care. Pain isn't acute enough.
- **No sorority friend outside Annabel's family** can articulate the pain in their own words within 2 weeks. Filippini-household ceiling.
- **3+ weekends spent and no shippable extension.** Scope creep ate it. Wayloft suffering. Kill or park.

### Assignments before Phase 2 (BLOCKING)

These must be complete before running `/plan-ceo-review`. No CEO review on speculation.

1. **Text your sister tonight.** Ask: *"In the last 30 days, how many times have you actually wanted to know where someone's outfit was from, and what did you do?"* Real number. Don't contaminate.
2. **Ask ONE sorority friend (not Elsie).** Don't pitch. Just ask: *"Have you ever seen someone's outfit and wanted to buy it? What did you do?"* Watch her face.
3. **🔑 Sit with Elsie this week.** *"Hey, can I watch you try to find Mika's top again?"* Do not help. Do not explain. Watch every site, every tool, every give-up moment. 15 minutes of observation > 50 user interviews. Unique unfair-advantage access — use it.

### What I noticed about how you think

- You said: *"I think there's a big market behind gatekeeping things and keeping things a secret from each other."* That's not a feature observation — that's cultural-tension positioning, and it's the sharpest thing you said all session. Consumer products that ride cultural tensions (Depop democratized thrift, Poshmark democratized resale) outperform products that just solve tasks. **This is the marketing story even if the product itself looks like Google Lens underneath. File it.**
- You jumped to *"could it be both?"* the moment I forced a commit. You even prefaced it with *"I know you said I can't combine."* The over-exploration pattern is self-aware now; next time it fires, name it sooner.
- You picked Option 1 cleanly after one round of pushback. That's the "commits fast with enough signal" pattern in your founder profile. Good. That's the version of you we want at decision points.

### Decision

**HOLD — do not advance to Phase 2 (CEO review) yet.**

Assignment 3 (the Elsie watch) is the single most valuable data you can get, and CEO review without it is premature. Running scope-expansion on fashion-finder before observing a real user fail at the current workaround inverts the value order.

**Revisit:** Next BB session on this idea, after the three assignments are complete.


## Phase 2 — CEO Review

_Not yet run. Requires Phase 1 survival + Annabel go-ahead._

## Phase 3 — Design

_Autonomous phase. Requires Phase 2 completion + Annabel go-ahead._

## Phase 4 — Engineering Plan

_Autonomous phase. Requires Phase 3 completion + Annabel go-ahead._

## Decisions

_Logged to `~/.claude/bb/knowledge/decisions.jsonl` with tag `idea-2026-04-08-001`. Pointers here after each phase._

## Log

- **2026-04-08 14:30 — Phase 0 intake complete (BB).** Route recommendation: advance to office-hours. Iteration trail noted. VeloVista-shaped cost risk flagged for office-hours pre-screen.
