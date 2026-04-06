---
title: Beehiiv
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [pbp-architecture.md, wayloft-three-layer-funnel.md, pbp-prd.md]
tags: [wayloft, pbp, tooling, newsletter, cross-cutting]
missing_links: []
---

# Beehiiv

Newsletter platform used by both [[wayloft]] (planned) and [[pickleball-portal]] (active).

## PBP Usage
- Pub ID: `pub_15b56ff7-0d22-4ea5-bcf7-31beb0db5623`
- 2,219 active subscribers as of March 2026
- 45% open rate
- [[pikolai-starostin]] "writes" the newsletter
- Login: `dan@pickleballportal.com`
- API key was exposed in Discord 2/16 — needs rotation

## Wayloft Usage (Planned)
- Chosen over Resend for Layer 2 of [[three-layer-funnel]]
- Custom fields per bank (has_chase, has_amex, etc.) for personalization
- Welcome sequence: immediate, Day 3, Day 7
- Weekly content: transfer bonuses, expiring credits, AF reminders
- Sender: "From [[ellis-church]] at Wayloft"

## Why Beehiiv
Chosen for newsletter-specific features (segmentation, custom fields, analytics) vs Resend which is better for transactional email. PBP already proven on the platform.
