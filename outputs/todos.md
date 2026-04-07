---
title: To-Dos
type: running-list
created: 2026-04-07
updated: 2026-04-07
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

<!-- New entries go here, directly below this line. Oldest at bottom. -->

<!-- Example (delete once first real entry lands):
---
id: todo-2026-04-07-001
added: 2026-04-07
source: manual
status: open
project: personal
priority: low
---
This is an example entry. Delete me when the first real to-do arrives.
-->
