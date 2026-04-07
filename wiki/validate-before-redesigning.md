---
title: Validate Before Redesigning
type: concept
created: 2026-04-07
updated: 2026-04-07
sources: []
tags: [pattern, bb, decision-making]
missing_links: []
---

**Validate Before Redesigning** is a BB decision pattern: before redesigning anything (a page, a feature, a system), validate that the current version is actually the problem. Most "redesigns" are avoidance — it feels like progress to rebuild, but the real issue is usually distribution, positioning, or a specific bug that doesn't need a full rewrite.

## The rule

Before starting any redesign, answer:
1. **What is the evidence the current version is broken?** User complaints, analytics, specific bugs — not vibes.
2. **What's the smallest fix that would address the evidence?** Can this be a patch instead of a rewrite?
3. **If we redesign, what is the hypothesis?** "It'll look nicer" is not a hypothesis. "Users can't find X" is.
4. **Who benefits from the redesign, and how do we know they exist?**

If any of those answers are soft, the redesign is probably avoidance. Ship a smaller fix and measure.

## Why it matters

Annabel's growth edge is mistaking restlessness for progress. Redesigns feel productive because they produce visible output, but they often don't move the business. Related: "am I doing this because it's the highest-leverage thing, or because the current thing is boring?"

## When to actually redesign

- Existing code is blocking new features (technical debt with a concrete next feature at stake)
- Data shows a clear drop-off that a specific UX change would address
- The current version makes a fundamentally wrong assumption about the user
- The design system itself changed and consistency matters (e.g., [[signal-design-system]] migration)

## Related

- [[clean-before-build]] — the related "get the foundation right" pattern
- [[bb-agent-system]] — where this pattern lives in the decision loop
