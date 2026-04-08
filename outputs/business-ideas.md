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
status: raw | exploring | validating | killed | shipping | shipped
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

---

## Entries

---
id: idea-2026-04-08-002
added: 2026-04-08
source: telegram
status: open
pain: _TBD_
wedge: _TBD_
why_now: _TBD_
---
#idea https://techcrunch.com/2026/04/08/databricks-matei-zaharia-acm-award/

[Source: raw/article-2026-04-08-httpstechcrunchcom20260408databricks-matei-zaharia-acm-award.md]

---
id: idea-2026-04-08-001
added: 2026-04-08
source: telegram
status: open
pain: _TBD_
wedge: _TBD_
why_now: _TBD_
---
#idea fashion finder app for tiktok hauls

[Source: raw/telegram-2026-04-08-idea-fashion-finder-app-for-tiktok.md]

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
