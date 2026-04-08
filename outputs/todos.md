---
title: To-Dos
type: running-list
created: 2026-04-07
updated: 2026-04-08
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
id: todo-2026-04-08-002
added: 2026-04-08
source: session
status: open
project: wiki
priority: low
---
Wiki hygiene: reconcile two naming schemas for source summaries.

Legacy pages use semantic names (`wiki/ami-labs-funding.md`, `wiki/gates-year-ahead-2026.md`, `wiki/telegram-fashion-finder-idea.md`, `wiki/youtube-2026-04-08-knx2wrilp1m.md`); new schema per wiki/CLAUDE.md uses mirror names (`wiki/<raw-filename>.md`). Stage 2 (`/deep-ingest`) only sees mirror-named coverage, so legacy raw files will appear "unprocessed" forever. Options: rename legacy summaries to mirror convention + update inbound wikilinks (clean), or teach `/deep-ingest` to also check `sources:` frontmatter across all wiki pages (accommodate). Decide and execute.

Affected raw files currently stuck in "unprocessed" limbo: `telegram-2026-04-06-ami-labs-world-models`, `telegram-2026-04-06-fashion-finder-idea`, `telegram-2026-04-06-gates-year-ahead-2026`, `youtube-2026-04-08-marc-andreessen-introspects-on-death-of` (the Andreessen one is partially covered — transcript still pending).

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
