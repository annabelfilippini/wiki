---
title: Signal Design System
type: entity
created: 2026-04-05
updated: 2026-04-05
sources: [wayloft-signal-design.md, wayloft-ux-handoff.md, bb-session-2026-04-04-wayloft-landing-page.md]
tags: [wayloft, design, visual-identity]
missing_links: []
---

# Signal Design System

[[wayloft]]'s visual identity. "The Signal" — data IS the interface. No decoration except what communicates. "Competent, precise, utilitarian. Like a Bloomberg terminal designed by Linear."

## Dual-Track System

| Track | Surface | Background | Density | Use Case |
|-------|---------|------------|---------|----------|
| App | Dark | Carbon #0F0F0F | Tight, monospace data | Authenticated dashboard, portfolio |
| Content | Light | Warm White #FAFAF6 | Comfortable reading, line-height 1.7 | SEO pages, card reviews, marketing |

Both tracks share: Geist/Geist Mono typography, Amber accent, component patterns.

## Typography
- **Display:** Geist 700, -0.03em tracking
- **Body:** Geist 400, 15px default
- **Labels:** Geist Mono 500, 0.05em, uppercase, 10-11px
- **Data/Tables:** Geist Mono 400, tabular-nums
- **Wordmark:** WAYLOFT in Geist Mono 700, -0.04em, Amber (#D4A020)

## Color

Amber #D4A020 is the **only** brand color. Connects to credit card premium positioning (Amex Gold, etc.) without being literal.

- Dark mode: Carbon #0F0F0F bg, Graphite #1A1A1A cards, Ink #E8E4DD text
- Light mode: Warm White #FAFAF6 bg, #FFFFFF cards, Charcoal #1C1C1C text
- Default: Light. User toggle. System preference disabled.

## Principles
- Sharp edges are the identity (0px border-radius default, max 2px)
- No entrance animations, no scroll effects, no decorative motion
- Empty states: "data-shaped void" — ghost placeholders in data containers
- Progressive activation: sections appear as data fills them
- "The number IS the greeting" — portfolio value is the dashboard hero

## Anti-Patterns (Never Use)
Purple/violet gradients, 3-column feature grids with colored circles, bubbly border-radius, blobs/waves/floating SVGs, emoji as design elements, Inter/Roboto/Poppins/Montserrat

## Competitive Edge
Every competitor (Point.me, CardPointers, Seats.aero) uses purple/blue SaaS aesthetics. Signal is intentionally different.

## Landing Page Exception (Apr 4 — unresolved)

The landing page may intentionally diverge from Signal's Geist-only typography. Playfair Display serif was tried for an editorial/old-money feel (headings + body), then reverted in code. The design decision (premium, aspirational, platform intro) is locked; the typographic execution is not. Open question: what font bridges premium landing aesthetic to the Signal app?

Data/labels stay Geist Mono, buttons stay Geist sans regardless of landing page headline font.

## Migration History
Migrated April 1-2, 2026 from Instrument Serif + DM Sans + Material Design 3 tokens. Single PR. Rated 9/10 post-migration.
