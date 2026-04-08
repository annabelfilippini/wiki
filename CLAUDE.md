# LLM Wiki Schema

This is Annabel's second brain. A persistent, compounding knowledge base maintained by Claude Code, browsed in Obsidian. The LLM writes and maintains all wiki content. Annabel curates sources, directs analysis, and asks the right questions.

## Architecture

```
wiki/                        # Vault root (Obsidian opens here)
├── raw/                     # Source documents. Immutable. LLM reads, never writes.
│   └── assets/              # Downloaded images referenced by sources
├── wiki/                    # The organized knowledge graph. LLM maintains this entirely.
├── outputs/                 # Answers, reports, analyses, slide decks the LLM generates.
│   ├── todos.md             # Running to-do list. Fed by Telegram + sessions. BB reads this.
│   ├── business-ideas.md    # Running business-ideas list. Fed by Telegram + sessions. BB reads this.
│   └── briefing-*.md        # Scheduled scan reports.
├── CLAUDE.md                # This file. The schema.
├── index.md                 # Content catalog. LLM reads first on every query.
└── log.md                   # Chronological operation record.
```

Three folders. That's it.
- `raw/` is the junk drawer. Annabel dumps articles, notes, screenshots, docs here. LLM never modifies these.
- `wiki/` is the organized version. Entity pages, concept pages, and source summaries all live here. The `type` frontmatter field distinguishes them.
- `outputs/` is where query answers, syntheses, comparisons, slide decks, and the BB work queues (`todos.md`, `business-ideas.md`) go.

## Conventions

### File naming

**Strict format for `raw/`:** `{source}-{YYYY-MM-DD}-{slug}.md`

Allowed `source` prefixes:
- `telegram` — brain dumps via Telegram (see Section 1b)
- `article` — web articles fetched manually or via link drop
- `youtube` — YouTube videos (transcripts, summaries)
- `tweet` — X/Twitter content
- `note` — Annabel's direct notes/brain dumps
- `bb-session` — BB working session artifacts
- `<project-name>` — project-specific dumps (`wayloft-`, `pbp-`, etc.) — date optional for non-dated project docs

**Slugs:** lowercase-kebab-case, 3-6 words, describe the content. No spaces, no capitals, no special characters except hyphens.

Examples:
- ✅ `telegram-2026-04-06-fashion-finder-idea.md`
- ✅ `article-2026-04-07-china-brain-chip-paralysis.md`
- ✅ `youtube-2026-04-07-openclaw-lenny-podcast.md`
- ✅ `note-2026-04-07-second-brain-thoughts.md`
- ✅ `wayloft-build-plan.md` (non-dated project doc, project prefix)
- ❌ `China approves brain chip.md` (spaces, no prefix, no date)
- ❌ `Notes thoughts.md` (spaces, no prefix)

**For `wiki/` and `outputs/`:**
- All files are markdown (`.md`), except slide deck exports (`.html`)
- Lowercase kebab-case filenames: `transfer-partners.md`, `chase-sapphire-preferred.md`
- Source summaries mirror the raw filename: if raw is `amex-gold-review.md`, summary is `wiki/amex-gold-review.md`
- No spaces in filenames. Use hyphens.

**Enforcement:** When creating any file in `raw/`, validate against the format above BEFORE writing. If the name doesn't conform, fix it first. When Annabel drops a file with a non-conforming name, rename it as the first step of ingest and log the rename in `log.md`.

### Cross-references
- Use Obsidian wikilinks: `[[page-name]]` or `[[page-name|Display Text]]`
- Link generously. Every mention of a concept or entity that has its own page should be linked.
- If you mention something that *should* have a page but doesn't, note it in the page's frontmatter under `missing_links` so lint can catch it.

### Frontmatter
Every wiki page and output has YAML frontmatter:

```yaml
---
title: Page Title
type: entity | concept | source | synthesis | comparison
created: 2026-04-05
updated: 2026-04-05
sources: []          # List of source filenames this page draws from
tags: []             # Freeform tags for Dataview queries
missing_links: []    # Concepts mentioned but lacking their own page
---
```

### Writing style
- Concise, factual, no filler. Wikipedia tone, not blog tone.
- Lead with the most important information.
- Use headers (##, ###) to structure content. Keep sections short.
- Bullet points over prose where appropriate.
- Flag uncertainty explicitly: "As of [date]..." or "Source X claims... but source Y contradicts..."
- When sources conflict, present both positions and note the conflict. Don't silently pick one.

## Operations

### 1. Ingest

**Auto-ingest is the default.** A SessionStart hook (`~/.claude/hooks/wiki-auto-ingest.sh`) detects unprocessed files in `raw/` and triggers ingest automatically. Manual ingest ("ingest this", "process this") is also supported.

**Workflow:**
1. **Read** the source in `raw/` completely.
2. **Create source summary** in `wiki/`. One page per source. Include:
   - Title, author, date, URL (if applicable)
   - Key claims and takeaways (bulleted)
   - Notable quotes (if any)
   - What's new or surprising relative to existing wiki knowledge
   - Conflicts with existing pages (if any)
3. **Update existing pages** in `wiki/`. For every entity or concept mentioned in the source that already has a page, update that page with new information. Add the source to the page's `sources` frontmatter list.
4. **Create new pages** in `wiki/` for significant entities or concepts that appear in the source but don't have pages yet. Use judgment -- not every proper noun needs a page. Create pages for things that are likely to be referenced again or that connect to existing knowledge.
5. **Update index.md** -- add entries for all new pages created.
6. **Log the ingest** -- append an entry to `log.md`.
7. **Report what was added.** After processing, give Annabel a brief summary: what was ingested, what's new, what contradicts existing knowledge, what pages were created/updated. This is where she steers -- she can say "emphasize X" or "that's wrong, fix it" after seeing the report.

**Batch by default for auto-ingest.** Process all unprocessed files, then report. For manual ingest, single source at a time with discussion.

### 1b. Telegram Ingest

**RULE: All content received via Telegram MUST be saved to `raw/` and ingested using the workflow below. No exceptions. Do not just reply conversationally — save first, reply second.**

When a Telegram message arrives, classify it and process:

| Content Type | Action |
|-------------|--------|
| **Link/URL** | WebFetch the URL. Save fetched content to `raw/` as markdown. If fetch fails, save the URL + any message text as a stub. |
| **Text (idea, thought, note)** | Save directly to `raw/` as markdown. |
| **Screenshot/Image** | Save image to `raw/assets/`. Create a wrapper .md in `raw/` that references it. |
| **Voice note/audio** | Save audio file to `raw/assets/`. Create a stub .md in `raw/` noting "voice note — transcription pending". Reply that voice transcription isn't supported yet. |
| **Conversational (greeting, question about wiki, "what do we know about X")** | Do NOT save. Handle as a query or conversation. |

**Raw file template for Telegram brain dumps:**

```markdown
---
title: "Descriptive title based on content"
source: "telegram"
telegram_chat_id: "<chat_id from message>"
telegram_message_id: "<message_id from message>"
received: YYYY-MM-DD
url: "https://..."  # only if a link was sent
description: "One-line summary of content"
tags:
  - "telegram"
---

[Content goes here — fetched article text, user's thought, or image reference]
```

**File naming:** `telegram-YYYY-MM-DD-kebab-slug.md` (e.g., `telegram-2026-04-06-china-brain-chip.md`). The slug should be 3-5 words describing the content. If multiple brain dumps arrive the same day, each gets its own file.

**After saving to raw/ — LITE MODE (default for all Telegram ingests):**

Lite mode is the default to keep token usage low. Brain dumps land cleanly without burning context on cross-referencing. Deep ingest happens later in batches.

1. Save the raw file in `raw/` using the template above.
2. Create a SINGLE source summary in `wiki/` mirroring the raw filename (e.g., `wiki/telegram-2026-04-06-china-brain-chip.md`). Include:
   - Title, date, URL (if any)
   - Key claims (3-5 bullets)
   - Add `lite_ingest: true` and `needs_deep_ingest: true` to the frontmatter
3. Append one line to `log.md`: `YYYY-MM-DD: Lite ingest — telegram-...md`
4. **DO NOT** read other wiki pages. **DO NOT** update existing pages. **DO NOT** create new entity/concept pages. **DO NOT** update index.md. All of that happens during deep ingest.
5. Reply via Telegram with a short confirmation: what was saved + "filed for deep ingest later". Keep it under 2 sentences.

**Deep ingest (manual, batched):**

Triggered when Annabel says "deep ingest", "process my dumps", "update the wiki from raw", or similar. Runs the full Section 1 workflow on every wiki/ file with `needs_deep_ingest: true` in its frontmatter. Cross-references, updates pages, creates entity pages, updates index.md, then sets `needs_deep_ingest: false`.

**Override — full ingest on save:**

Annabel can request full ingest at save time by including "deep ingest" or "ingest deeply" in the Telegram message. Otherwise, always default to lite.

**Tag-based routing to outputs (runs IN ADDITION to raw/ save):**

Certain Telegram messages route to `outputs/todos.md` or `outputs/business-ideas.md` on top of the standard raw/ save. Classification rules:

| Trigger | Action |
|---|---|
| Message contains `#todo`, `#task`, "todo:", "remind me to", "don't forget", "need to" | Append a new entry to `outputs/todos.md` at the TOP of the `## Entries` section (see that file's format). ID: `todo-YYYY-MM-DD-NNN`. Still save to raw/ as `telegram-YYYY-MM-DD-slug.md` for the full record. |
| Message contains `#idea`, `#business`, "business idea", "what if we", "could we build", "idea for" | Append a new entry to `outputs/business-ideas.md` at the TOP of the `## Entries` section. ID: `idea-YYYY-MM-DD-NNN`. Fill in as many fields as you can from the message (pain, wedge, why-now). Unknown fields get `_TBD_`. Still save to raw/ for the full record. |
| Neither | Standard lite ingest only. No outputs/ routing. |

**Why both raw/ AND outputs/:** raw/ is the permanent record. outputs/ is the BB work queue. An idea sent via Telegram needs to exist in BOTH places — raw/ so it's never lost, outputs/ so BB can find and work through it.

**Reply pattern:** Telegram confirmation should name the destination. "Saved to todos (todo-2026-04-07-003) and raw." or "Saved as business idea (idea-2026-04-07-001) for BB review."

**What NOT to do:**
- Don't reply with just "got it" without saving.
- Don't summarize the content in chat instead of saving it.
- Don't skip the frontmatter template.
- Don't put Telegram content anywhere other than `raw/` (and the source summary in `wiki/`).
- Don't run deep ingest on Telegram messages by default — it burns tokens unnecessarily.

### 2. Query

Triggered when Annabel asks a question about the wiki's domain (or says "query", "search", "what do we know about...").

**Workflow:**
1. **Read index.md** to find relevant pages.
2. **Read relevant pages** -- follow wikilinks if needed to gather full context.
3. **Synthesize an answer** with inline citations: `([[source-name]])`.
4. **File the answer by default.** Every non-trivial query result gets saved in `outputs/`. The whole point of the wiki is compounding -- answers that disappear into chat history don't compound. File it unless the answer is genuinely trivial (a single fact lookup). Good candidates:
   - Comparisons (e.g., "Chase vs Amex transfer partners")
   - Analyses that connect multiple sources
   - Strategic questions and decisions
   - Anything she's likely to revisit or build on
   - Ask Annabel only if it's borderline -- default is to file.
5. **Update index.md** and **log the query**.
6. **Optionally generate a slide deck.** If the synthesis would make a good presentation (strategy overview, comparison, pitch), offer to generate a Marp deck in `outputs/`. See Marp template below.

### 3. Lint

Triggered when Annabel says "lint", "health check", "check the wiki", or periodically suggested by the LLM.

**Checks:**
- **Contradictions:** Pages that make conflicting claims. Flag with specific quotes.
- **Stale content:** Claims that newer sources have superseded.
- **Orphan pages:** Pages with no inbound links from other pages.
- **Missing pages:** Concepts referenced in `missing_links` frontmatter that still lack pages.
- **Broken links:** Wikilinks that point to nonexistent pages.
- **Missing cross-references:** Pages that discuss the same entity but don't link to each other.
- **Index gaps:** Pages that exist but aren't in index.md.
- **Source gaps:** Topics where the wiki is thin and could benefit from new sources.

**Output:** A lint report with findings and suggested actions. Ask before making changes.

### 4. Maintain

Ongoing maintenance during any operation:
- When updating a page, always update the `updated` date in frontmatter.
- When adding a source reference, add it to the page's `sources` list.
- Keep index.md current -- it's the primary navigation tool.
- Wikilinks should resolve. If you create a link, make sure the target exists or add it to `missing_links`.

A Stop hook (`~/.claude/hooks/wiki-session-report.sh`) fires at the end of each response. If wiki pages were modified during the session, it reminds to update index.md and log.md before ending.

## Page Templates

### Entity page (`wiki/`)
```markdown
---
title: Entity Name
type: entity
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []
tags: []
missing_links: []
---

# Entity Name

One-paragraph overview.

## Key Facts
- Fact 1
- Fact 2

## Details
Longer discussion organized by subtopic.

## Connections
- Related to [[other-entity]] because...
- See also [[concept-page]]
```

### Concept page (`wiki/`)
```markdown
---
title: Concept Name
type: concept
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []
tags: []
missing_links: []
---

# Concept Name

Definition and overview.

## How It Works
Explanation.

## Examples
Concrete instances.

## Related Concepts
- [[related-concept-1]]
- [[related-concept-2]]
```

### Source summary (`wiki/`)
```markdown
---
title: Source Title
type: source
created: YYYY-MM-DD
updated: YYYY-MM-DD
author: Author Name
date: YYYY-MM-DD
url: https://...
tags: []
---

# Source Title

## Key Takeaways
- Takeaway 1
- Takeaway 2

## Notable Claims
- Claim with context

## Quotes
> Notable quote -- Author

## New Information
What this source adds that wasn't in the wiki before.

## Conflicts
Any contradictions with existing wiki content.
```

### Synthesis / Output (`outputs/`)
```markdown
---
title: Analysis Title
type: synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []
tags: []
---

# Analysis Title

## Question
What question or comparison this analysis addresses.

## Findings
The analysis, with citations to wiki pages and sources.

## Conclusion
Summary judgment or recommendation.
```

### Scheduled Briefing (`outputs/`)

Standard format for all scheduled scan reports. Designed for a 5-minute morning read.

```markdown
---
title: "Brief Title — YYYY-MM-DD"
type: synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
scan_type: daily-ai | weekly-opportunities | weekly-competitors | weekly-communities
sources: []
tags: [briefing, <scan_type>]
---

# Brief Title — YYYY-MM-DD

## AI Tools, Tech & Advancements

1. **[Tool/Project Name]** — What it is and why people are talking about it. ([Source](url))
2. ...
(3-5 items. Real buzz from YouTube, X, Reddit, HN. Skip vaporware.)

## AI Industry News & Shifts

1. **[Headline]** — What happened and what it means. ([Source](url))
2. ...
(3-5 items. Company moves + bigger-picture realizations about AI.)

## World News

1. **[Headline]** — What happened. ([Source](url))
2. ...
(3-5 items. Unbiased. Multiple perspectives where relevant.)

## Raw Sources
- [Title](url) — one-line note on why it was included
```

**Briefing rules:**
- **Max 5 items in Top 5.** If nothing important happened, say so. Don't pad.
- **Opinionated, not neutral.** "This matters because X" not "This happened."
- **Connect to Annabel's projects.** Every item should answer: "so what?"
- **File naming:** `briefing-<scan_type>-YYYY-MM-DD.md` (e.g., `briefing-daily-ai-2026-04-06.md`)
- **No duplicates across scans.** If the daily caught it, the weekly skips it.

### Marp slide deck (`outputs/`)
```markdown
---
title: Deck Title
type: synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []
tags: [deck]
marp: true
theme: default
paginate: true
---

# Deck Title
Subtitle or context line

---

## Slide Title

- Bullet point with key insight
- Another point with [[wikilink]] citation
- Keep to 3-5 bullets per slide

---

## Comparison Slide

| Dimension | Option A | Option B |
|-----------|----------|----------|
| Row 1     | Value    | Value    |

---

## Conclusion

The one takeaway that matters.
```

**Marp notes:**
- The `marp: true` frontmatter activates the Marp plugin in Obsidian (preview as slides).
- Use `---` between slides. Keep slides sparse -- max 5 bullets or one table.
- Tag all decks with `[deck]` so Dataview can list them.
- Marp supports images: `![bg right](raw/assets/image.jpg)` for background images.
- Export to PDF/PPTX from Obsidian's command palette: "Marp: Export slide deck".

### Dataview queries

Dataview lets you query frontmatter across all wiki pages. Add these as code blocks (type `dataview`) in any page. Useful examples:

**All pages with missing links (instant lint):**
````
```dataview
TABLE missing_links AS "Missing Links"
FROM "wiki"
WHERE length(missing_links) > 0
```
````

**Recently updated pages:**
````
```dataview
TABLE updated, type
FROM "wiki" OR "outputs"
SORT updated DESC
LIMIT 10
```
````

**All synthesis decks:**
````
```dataview
LIST
FROM "outputs"
WHERE contains(tags, "deck")
SORT created DESC
```
````

**Sources by project tag:**
````
```dataview
TABLE author, date, tags
FROM "wiki"
WHERE type = "source"
SORT date DESC
```
````

## Rules

1. **Never modify files in `raw/`.** That directory is Annabel's. Read-only for the LLM.
2. **Every operation updates index.md and log.md.** No exceptions.
3. **Link generously.** The value of the wiki is in the connections.
4. **Flag conflicts, don't hide them.** When sources disagree, show both sides.
5. **Ask before large changes.** If an ingest would update more than 10 existing pages, confirm first.
6. **Keep pages focused.** One entity or concept per page. Split if a page grows beyond ~200 lines.
7. **Frontmatter is mandatory.** Every wiki and output page has it. Raw sources don't need it.
8. **Dates are absolute.** Never use relative dates in wiki content.
9. **Sources are cited.** Every factual claim should trace back to a source via the `sources` frontmatter or inline citations.
10. **The index is the truth.** If it's not in index.md, it doesn't exist to the query workflow.
11. **Telegram content follows the Section 1b template exactly.** Every Telegram brain dump uses the `telegram-YYYY-MM-DD-slug.md` naming, the frontmatter template with `source: "telegram"`, and gets a full ingest. No shortcuts.
12. **Running lists are append-top, never-delete.** `outputs/todos.md` and `outputs/business-ideas.md` grow forever. Mark items `done`, `dropped`, or `killed` — don't remove them. History compounds; the graveyard teaches future decisions.
13. **Outputs routing for Telegram is in addition to raw/, not instead of.** Every Telegram message still gets saved to `raw/` even if it also gets routed to `todos.md` or `business-ideas.md`. Raw/ is the permanent record; outputs/ is the work queue.

## Interaction Model

Every conversation in this vault follows one of the operations above. When Annabel opens a session:
- If she drops a file in `raw/` -> **Ingest**
- If a Telegram message arrives with content -> **Telegram Ingest** (Section 1b)
- If she asks a question -> **Query**
- If she says "lint" or "health check" -> **Lint**
- If she says "update X" or "fix Y" -> **Maintain**

The LLM should also proactively suggest:
- Linting every ~10 ingests
- Filing query answers as output pages (this is now the default, not optional)
- Generating a Marp deck when a synthesis would present well as slides
- New sources to look for when gaps are obvious
- Page splits when pages get too long
