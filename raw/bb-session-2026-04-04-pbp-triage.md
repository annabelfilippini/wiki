# BB Session: PBP Triage & Pipeline Rebuild

**Date:** 2026-04-04
**Agent:** bb-strategy, bb-engineering
**Project:** pickleball-portal
**Skill:** direct

## Context

PBP triage session. Annabel chose to fix everything that's broken over revenue optimization. Wanted a persistent written plan for cross-session continuity. Engineering then executed on unblocked items.

## Key Decisions

- **Triage scope:** Fix everything that's broken, not just revenue-critical items. Annabel explicitly said "not worried about revenue right now, let's make everything work." Clean Before Build pattern confirmed for third time.
- **Triage framing:** Triage over full reorganization. Challenged three premises: organize-everything-first as avoidance, Phase 1 already done, broken pipelines as existential threat to data thesis.
- **Execution approach:** Run everything unblocked in parallel while waiting for external blockers (Tom for Amazon creds, brand approvals for affiliates). Docs, verification, and code fixes all unblocked.
- **Genius Links:** Declared dead based on zero code integration. Account exists at daniellangston10@gmail.com but no references in codebase — not worth investigating further.

## New Frameworks / Patterns

- **Clean Before Build** at confidence 8/10 now — fourth confirmation. Extends beyond visual cleanup to system health: broken pipelines, stale docs, dead code.

## Killed / Deferred

- **Genius Links** — declared dead. Zero integration = zero functionality regardless of account status.
- **Full reorganization approach** — rejected as avoidance. Triage is faster and produces the same result.
- **Revenue optimization** — explicitly deferred. Fix first, optimize later.

## Open Questions

- Phase 2a/2b blocked on Tom — when will he provide Amazon Creators credentials?
- Selkirk/JOOLA/CRBN affiliate approvals — applied Apr 3, awaiting response.

## Connected Concepts

[[pickleball-portal]], [[affiliate-revenue-model]]
