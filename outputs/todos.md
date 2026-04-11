---
title: To-Dos
type: running-list
created: 2026-04-07
updated: 2026-04-11
tags: [todos, bb-queue]
---

# To-Dos

Running list of action items. Append new entries at the TOP (newest first). BB reads this to find things to work through.

Entries come from:
- Telegram messages tagged `#todo` (or containing "todo:", "remind me to", "don't forget")
- Session work where something was punted to "do this later"
- Annabel dropping items manually

## Format

Each entry is a fenced block with frontmatter + body:

```
---
id: todo-YYYY-MM-DD-NNN
added: YYYY-MM-DD
source: telegram | session | manual
status: open | in-progress | done | dropped
project: wayloft | pbp | wiki | personal | other
priority: high | med | low
due: YYYY-MM-DD  # optional
---
Short description of the action. One line ideally. Two max.

Why it matters (optional — only if not self-evident).
```

## Rules

- **Append to top, not bottom.** Newest first so BB sees fresh items without scrolling.
- **Never delete entries.** Mark as `done` or `dropped` in status. History compounds.
- **BB can promote high-priority todos** to project scratchpads or project-specific plan files, but the entry here stays.
- **One line descriptions when possible.** This is a list, not a journal.
- **IDs are sequential per day** (`todo-2026-04-07-001`, `todo-2026-04-07-002`...).

---

## Entries

---
id: todo-2026-04-11-001
added: 2026-04-11
source: session
status: open
project: wayloft
priority: med
---
Build a Wayloft article scraper — a second OpenClaw job, separate from `wayloft-qa-sweep`.

**What:** Weekly Claude Code skill running on the Hetzner VPS that reads credit card + flight award sources, extracts structured candidate updates (signup bonus changes, transfer partner additions/removals, program devaluations, new routes), and writes findings to `wiki/wayloft/data-updates/YYYY-MM-DD-weekly-digest.md`. Annabel reviews, promotes manually to Wayloft's data layer.

**Why:** Wayloft's credit card and flight program data needs to stay fresh. Manual curation doesn't scale. Automation-assisted curation (agent proposes, human approves) is the right middle ground — captures most of the value without risking bad extractions corrupting prod data.

**Design decisions already made (2026-04-11 session with Claude):**
- **Separate skill from `wayloft-qa-sweep`.** Different class of work entirely: content ingest vs health check. Different runtime profile, different output folder, different schedule.
- **Needs Claude in the loop.** Unlike the QA sweep (pure bash + curl), extraction requires reading comprehension — can't be a bash script.
- **Output model: findings → human review → manual propagation (option 1 of 3 considered).** Rejected: direct Supabase writes (too risky until extractions trusted), data file + auto-PR (medium risk, premature automation).
- **Schedule: weekly, not daily.** CC offers and flight program changes don't move fast enough for nightly runs.
- **Matches existing OpenClaw morning-briefing pattern** — scrape articles, synthesize, write markdown, commit wiki repo. Proven pattern, just Wayloft-scoped instead of general-AI-news-scoped.

**Blocked on:** finishing step 5 of `wayloft-qa-sweep` deployment first (get it running on OpenClaw cron, watch it for at least a few clean nightly sweeps). Don't start this until the QA sweep is stable.

**Sources to consider (refine before building):** The Points Guy, Doctor of Credit, View from the Wing, NerdWallet card roundups, One Mile at a Time, seats.aero blog, AwardWallet blog, God Save the Points, airline mileage program pages, Chase/Amex press pages for primary source material.

**Extraction targets:**
- **Credit cards:** signup bonus changes, transfer partner additions/removals, benefit changes, reviewer ranking shifts
- **Flights:** program devaluations, award chart changes, new routes on points, partner additions/removals, dynamic-pricing baseline shifts

---
id: todo-2026-04-08-002
added: 2026-04-08
source: session
status: done
closed: 2026-04-08
project: wiki
priority: low
---
Wiki hygiene: reconcile two naming schemas for source summaries.

Legacy pages used semantic names; new schema per wiki/CLAUDE.md uses mirror names (`wiki/<raw-filename>.md`). Chose the clean option: renamed 4 legacy summaries to mirror convention via `git mv`, updated 7 inbound wikilinks across 4 files, updated 4 `sources:` frontmatter lines across 3 entity/concept pages, deleted the FarzaTV tweet stub pair + trivial `/start` file. See log.md entry "Legacy naming reconciliation" for the full breakdown.

---
id: todo-2026-04-08-001
added: 2026-04-08
source: telegram
status: open
project: personal
priority: med
---
#todo call dentist tomorrow

[Source: raw/telegram-2026-04-08-todo-call-dentist-tomorrow.md]

<!-- New entries go here, directly below this line. Oldest at bottom. -->
 
- Investigate raw/apple-notes-archive deletion in wiki working tree                                                                                                               
  - Send Cooldown AI consulting pitch (or kill the idea)                                                                                                                            
  - nail appointment                       
  - book hair appointment for graduation                                                                                                                                            
  - google reviews from telegram                                                                                                                                                    
  - do music assignment              
  - finish individual assignment                                                                                                                                                    
  - practice guitar
