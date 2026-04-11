# Wayloft Operational Brain

Project-scoped brain for Wayloft. Holds findings from autonomous agents (QA sweeps, voice drift audits, etc.) and project-specific state. **This is not part of the knowledge graph** — see `../CLAUDE.md` for the operational-artifact boundary.

## What lives here

```
wayloft/
├── CLAUDE.md         # This file. Per-project schema.
├── findings/         # Agent-generated findings. Append-only. Never deleted.
│   └── YYYY-MM-DD-HHMM-<type>.md
└── state/            # Baselines, diffs, counters the agent compares against.
    └── last-sweep.json
```

## What does NOT live here

- Knowledge-graph content (entities, concepts, source summaries) — those go in `../wiki/`
- Source documents — those go in `../raw/`
- Cross-project syntheses — those go in `../outputs/`
- PBP findings, career-launch findings — each project has its own isolated brain

## Findings naming

`YYYY-MM-DD-HHMM-<type>.md` where `<type>` describes the sweep:
- `qa-sweep` — runtime QA (Supabase errors, Vercel deploys, live site smoke)
- `voice-drift` — Ellis Church voice audit (once clone mode enabled)
- `deploy-report` — post-deploy health check
- `manual-<slug>` — ad-hoc one-off findings Annabel requests

## Finding frontmatter

```yaml
---
type: qa-sweep | voice-drift | deploy-report | manual-<slug>
ran_at: YYYY-MM-DDTHH:MM:SSZ
runner: wayloft-qa-sweep | manual | <skill-name>
severity: info | warning | urgent
alerted: true | false     # Did this trigger a Telegram alert?
---
```

## Severity rubric

- **info** — baseline signal, everything nominal. Silent. Browse in Obsidian if curious.
- **warning** — something worth knowing but not bleeding. Silent. Surfaces in `/begin` if from the last 24h.
- **urgent** — live site broken, Supabase error rate spiked, last deploy failed. Fires a Telegram alert via Annie bot, reuses the `checkin-alert.py` pattern.

## State files

`state/last-sweep.json` — baseline the next sweep compares against. Schema grows as checks are added. Initial shape:

```json
{
  "last_ran_at": "2026-04-11T03:00:00Z",
  "supabase_error_count_24h": 0,
  "vercel_last_deploy_status": "READY",
  "live_site_smoke": "ok",
  "findings_count_since_baseline": 0
}
```

## Rules

1. **Append-only.** Findings are never deleted. The graveyard teaches future decisions.
2. **Silent by default.** Only `severity: urgent` fires a Telegram alert. Everything else lives in Obsidian until Annabel looks.
3. **Isolated from the knowledge graph.** Nothing in this folder gets wikilinked from `../wiki/` pages. Nothing gets indexed in `../index.md`.
4. **Isolated from other projects.** PBP findings never land here. If a cross-project pattern emerges, promote it to `../outputs/` as a synthesis — don't mingle per-project brains.
5. **Runner identifies itself.** Every finding names which skill/agent produced it in the `runner` frontmatter field.
