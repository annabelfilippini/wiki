---
title: Clean Before Build
type: concept
created: 2026-04-05
updated: 2026-04-05
sources: [bb-session-2026-04-04-pbp-triage.md, bb-session-2026-04-04-pbp-identity.md]
tags: [pattern, decision-making, cross-cutting]
missing_links: []
---

# Clean Before Build

Recurring decision pattern across Annabel's projects. When infrastructure is messy or broken, fix it before optimizing or building new features. Extends beyond visual cleanup to system health: broken pipelines, stale docs, dead code.

## Evidence (4 confirmations, confidence 8/10)

1. **Signal cleanup (Apr 2)** — Anti-pattern cleanup on [[signal-design-system]] before [[worth-it-tool]] launch
2. **PBP triage over revenue (Apr 4)** — "Not worried about revenue right now, let's make everything work" despite $25/mo on 100K visitors
3. **PBP fix-all over revenue-only (Apr 4)** — Expanded scope to fix everything broken, not just revenue-critical items
4. **PBP parallel execution (Apr 4)** — "Run on everything that's unblocked" while waiting for external blockers

## The Pattern

When faced with "optimize what exists" vs "fix the foundation first," Annabel consistently chooses foundation. She'd rather build on solid ground than optimize on a shaky base.

**Important nuance:** Triage, not reorganize. She wants clean, not perfect. Full reorganization was explicitly rejected as avoidance behavior.

## When to Apply

- Before launching a new feature on top of broken infrastructure
- Before optimizing revenue on a site with broken pipelines
- Before redesigning when existing systems don't work
- NOT as an excuse to endlessly refactor without shipping

## Related Patterns
- [[validate-before-redesigning]] — Ship, Learn, Redesign phased approach (related but different — that's about sequencing new work; this is about fixing existing work)

## Related Concepts
- [[pickleball-portal]] — strongest evidence, applied twice in one session
- [[signal-design-system]] — first instance
