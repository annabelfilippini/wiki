---
title: Business Ideas
type: running-list
created: 2026-04-07
updated: 2026-04-07
tags: [business-ideas, bb-queue]
---

# Business Ideas

Running list of business ideas and hypotheses worth exploring. Append new entries at the TOP (newest first). BB reads this to run ideas through office-hours / CEO review.

Entries come from:
- Telegram messages tagged `#idea`, `#business`, or containing "business idea", "what if", "could we build"
- Brain dumps during sessions where a product concept surfaces
- Annabel dropping ideas manually

## Format

Each entry is a fenced block with frontmatter + body:

```
---
id: idea-YYYY-MM-DD-NNN
added: YYYY-MM-DD
source: telegram | session | manual
status: raw | exploring | validating | hold | parked | killed | merged | shipping | shipped
stage: hypothesis | office-hours-done | ceo-review-done | plan-locked | built
tags: [category, category]
---
## <one-line hook>

### The pain
Who has it, how bad, how often.

### The wedge
Narrowest useful version. What could ship in a weekend.

### Why now
What changed that makes this possible/valuable today.

### Kill signals
What would make you drop it. Be specific (costs, demand, competition).

### Status notes
Running commentary as the idea evolves. Dated entries.
```

## Rules

- **Append to top, not bottom.** Newest first.
- **Never delete killed ideas.** Set status to `killed`, add a kill-reason note. Dead ideas are reference data — they teach you what not to build next.
- **BB routing:** Fresh ideas go through `/office-hours` first, then `/plan-ceo-review` if they survive. Status/stage fields track where each idea is in the pipeline.
- **Cross-link to wiki pages.** If an idea references a source or concept that has a wiki page, add `[[wikilink]]` inline.
- **IDs are sequential per day** (`idea-2026-04-07-001`, `idea-2026-04-07-002`...).

## Graveyard convention

When an idea is killed, keep the entry but add a `killed:` section at the bottom:

```
### killed: 2026-04-07
Reason: [specific reason — "Google API costs $6/session at scale" not "too expensive"]
Lesson: [what this teaches you about future ideas]
```

Past killed ideas worth remembering live at the bottom of this file as reference entries.

## Parked convention

Parking is the "not now, no blocker, revive when ready" state. Distinct from HOLD (which waits on specific field work) and from killed (which is a decision to stop). Parked ideas are invisible to the BB queue — `/bb` won't recommend them, `/begin` shows only a compact count at the bottom of the queue section. They surface only when Annabel explicitly asks.

Frontmatter fields for parked entries:

```
status: parked
parked_date: YYYY-MM-DD
parked_from_status: active | hold     # what state to restore on revive
parked_reason: "optional one-liner"
```

And a `### parked:` sub-block at the bottom of the entry:

```
### parked: 2026-04-08
Reason: [why you paused it — "not ready to engage", "waiting for life context to shift", "exploring other directions first"]
From status: hold (field assignments still apply when revived)
Revive with: `/bb revive <id>`
```

When you're ready to come back, `/bb revive <id>` restores the `parked_from_status` and the idea rejoins the queue at its exact prior phase. No progress lost. Parking as many times as you want is fine — parked ideas are cheap.

---

## Entries

---
id: idea-2026-04-09-002
added: 2026-04-09
source: telegram
status: open
pain: _TBD_
wedge: _TBD_
why_now: _TBD_
---
#idea have wayloft go through bb on yolo mode

[Source: raw/telegram-2026-04-09-idea-have-wayloft-go-through-bb.md]

---
id: idea-2026-04-09-001
added: 2026-04-09
source: telegram
status: open
pain: _TBD_
wedge: _TBD_
why_now: _TBD_
---
#idea post something on LinkedIn that says are you struggling looking for a job. Use this tool to scrape all job availabilities so that you can quickly apply to various jobs

[Source: raw/telegram-2026-04-09-idea-post-something-on-linkedin-that.md]

---
id: idea-2026-04-08-004
added: 2026-04-08
source: telegram
status: merged
merged_into: idea-2026-04-08-001
merged_date: 2026-04-08
---
#idea when i take a pic of someones outfit google image search can tell me where everything is from

[Source: raw/telegram-2026-04-08-idea-when-i-take-a-pic.md]
[Merged into: [[ideas/idea-2026-04-08-001-fashion-finder]]]

### merged: 2026-04-08
Same concept as idea-001 (fashion finder) — the camera-first wedge of the same underlying "point at an outfit, get the source" product. Already captured in idea-001's iteration trail (variant #2) and `related_raw` frontmatter during the Phase 0 intake. Merged via `/bb` duplicate-concept path — no separate working file created. All future Phase work proceeds on idea-001. This variant (phone camera → any outfit in real life) is held as the v2 wedge per the Phase 1 office-hours decision (browser extension first, camera app second).

---
id: idea-2026-04-08-003
added: 2026-04-08
source: telegram
status: killed
stage: killed-at-intake
phase: 0
---
#idea https://techcrunch.com/2026/04/08/this-is-a-fake-article-that-does-not-exist/

[Source: raw/article-2026-04-08-techcrunch-this-is-a-fake-article.md] (orphaned — file deleted)

### killed: 2026-04-08
Reason: Orphaned raw pointer. Raw file was stub test residue from yesterday's slug-fix testing, cleaned up during the 13:35 wiki hygiene pass. No actual business idea content — the URL is a fake TechCrunch URL used to exercise the Stage 1 slug generator.
Lesson: Auto-kill orphaned raw pointers at Phase 0 intake. Cleanup of `raw/` files should probably also sweep `business-ideas.md` for entries pointing at the deleted files, but that's Stage 2 polish, not a blocker.

---
id: idea-2026-04-08-002
added: 2026-04-08
source: telegram
status: killed
stage: killed-at-intake
phase: 0
---
#idea https://techcrunch.com/2026/04/08/databricks-matei-zaharia-acm-award/

[Source: raw/article-2026-04-08-httpstechcrunchcom20260408databricks-matei-zaharia-acm-award.md] (orphaned — file deleted)

### killed: 2026-04-08
Reason: Orphaned raw pointer. Raw file was a Stage 1 smoke-test artifact with the ugly pre-16:25-slug-fix filename, cleaned up during the 13:35 wiki hygiene pass. The underlying URL is a real TechCrunch article about Databricks CEO Matei Zaharia winning an ACM award, but that's a news read, not a business idea — the `#idea` tag was used during testing, not as a genuine idea capture.
Lesson: Same as idea-003 — orphaned entries auto-kill at Phase 0. Separately, pure news articles tagged `#idea` during testing shouldn't have created business-ideas.md entries in the first place; that's a Stage 1 router refinement (distinguish genuine idea tags from test data) for a later session.

---
id: idea-2026-04-08-001
added: 2026-04-08
source: telegram
status: parked
parked_date: 2026-04-08
parked_from_status: hold
parked_reason: Not ready to engage — field assignments (Elsie watch etc.) are real but Annabel wants to let this sit and focus elsewhere first
stage: office-hours-done
phase: 1
tags: [fashion, reverse-image-search, consumer, anti-gatekeeping]
bb_file: ideas/idea-2026-04-08-001-fashion-finder.md
related_ideas: [idea-2026-04-08-004]
canonical_user: Elsie Ratner
committed_wedge: browser-extension-first
---
## Fashion Finder — anti-gatekeeping visual search for college-aged women

Phase 1 (office-hours) complete. Canonical user: Elsie Ratner (U Mich, sorority). Committed wedge: browser extension first, phone camera app as v2. Originally HELD on field assignments, then parked 2026-04-08 — Annabel wants to let the idea sit rather than chase the Elsie observation right now.

[Source: raw/telegram-2026-04-08-idea-fashion-finder-app-for-tiktok.md]
[BB working file: [[ideas/idea-2026-04-08-001-fashion-finder]]]

### parked: 2026-04-08
Reason: Not ready to engage. The three Phase 1 field assignments (Elsie watch, sister text, sorority ask) are real and still apply — the idea isn't stuck on a missing resource, Annabel just isn't feeling ready to sit with Elsie and run the observation session. Parking honestly is cleaner than leaving it in infinite HOLD pretending the assignments are coming tomorrow.
From status: hold (field assignments still apply when revived)
Revive with: `/bb revive idea-2026-04-08-001`
First use of the parking mechanism — this idea is the test case for the feature.

<!-- New entries go here, directly below this line. Oldest at bottom. -->

<!-- Example (delete once first real entry lands):
---
id: idea-2026-04-07-001
added: 2026-04-07
source: manual
status: raw
stage: hypothesis
tags: [example]
---
## Example idea

### The pain
Delete this entry when the first real idea arrives.
-->

---

## Graveyard

<!-- Killed ideas live here as reference. Don't delete. -->
