---
title: Design Library — Website Audit References
type: synthesis
created: 2026-04-16
updated: 2026-04-16
sources:
  - "50+ Examples of Top D2C Brand Websites (2026).md"
  - "Examples of Luxury, Brand-Led eCommerce Websites – Premium eCommerce UX + Technology.md"
  - "Most Engaging & Best-Designed DTC eCommerce Brand Sites.md"
  - "Framer Gallery The best Personal website designs & inspiration.md"
  - "Portfolio websites - 31+ Best Portfolio Web Design Ideas 2026.md"
  - "pbp-brand.md"
  - "wayloft-signal-design.md"
tags: [design, reference, website-audit]
missing_links: []
---

# Design Library

Curated design references for the website-audit pipeline. Indexed by vertical. Read this first when `/audit-redesign` or `/audit-dashboard` needs execution cues — it replaces the former vague "check Obsidian raw/" instruction.

## How This File Is Used

Skills in Phase 1:
1. Identify the prospect's vertical from `/audit-scrape` scope (restaurant / DTC / luxury / portfolio / editorial / dashboard / other).
2. Read that vertical's entry below.
3. Open the **Primary refs** files or URLs listed.
4. Extract 3-5 concrete execution cues into `redesign-spec.md` under `## Design Library References`.
5. If the vertical has no entry here (status: GAP), flag it explicitly — DO NOT default to generic SaaS layouts.

Each vertical entry has: **Primary refs**, **What good looks like** (concrete execution patterns), **Anti-patterns** (what to avoid).

---

## Restaurant / Hospitality

**Primary refs:** URLs below, grouped by sub-category. Start with the sub-category that matches the prospect's positioning (fine dining ≠ premium casual ≠ street food).

**Fine dining (Michelin-tier, editorial restraint):**
- https://noma.dk
- https://www.atomixnyc.com
- https://www.ateliercrenn.com
- https://canlis.com

**Premium / approachable luxury:**
- https://beefbar.com
- https://gucciosteria.com
- https://fatcow.sg

**Mexican — fine dining:**
- https://quintonil.com
- https://www.cosmenyc.com
- https://pujol.com.mx

**Mexican — vibrant / street-food:**
- https://tacombi.com
- https://chinapoblano.com

**Gallery resources:**
- https://www.sitebuilderreport.com/inspiration/restaurant-websites
- https://www.framer.com/gallery/restaurant-website-examples
- https://www.touchbistro.com/blog/best-restaurant-websites
- https://www.webbyawards.com/winners/?category=restaurant

**Hop Alley redesign mapping (Apr 2026):** Fat Cow primary (dark moody palette, close-up signature dishes) / Atomix secondary (nav discipline, Chef's Counter IA) / Cosme tertiary (chef storytelling, sister-concept integration via CASAMATA). Quintonil palette lesson: regional identity via restrained clay/terracotta, NOT red-lantern clichés.

**What good looks like:**
- Hero is one food or space photo, full-bleed, warm color grade. Not a grid, not a carousel.
- Typography pair: one distinctive serif (editorial) + one clean sans (UI). Never all-sans Montserrat.
- Menu is on-site, readable HTML — never a PDF link behind a button.
- Hours + reservation CTA above the fold. Location + hours repeat in footer with `tel:` and maps links.
- Reservation CTA (OpenTable/Resy/Tock) appears in nav AND hero AND footer — never buried.
- Photography carries identity. Real food, real space. No stock Unsplash.
- Press/reviews: real publication logos with clickable links — not unsourced star ratings.

**Anti-patterns:**
- "Experience our cuisine" generic hero copy (replace with named dishes, location, or a critic quote).
- Menu items rendered as e-commerce product cards with prices and "Add" buttons.
- Emojis (knife-and-fork, sparkles, chef hat).
- PDF-only menu behind a button.
- Stock food photography (the same 10 Unsplash plates every restaurant uses).
- "Book a Table" buried in a footer dropdown.

---

## DTC / Athletic Goods / Consumer Products

**Primary refs:**
- `raw/50+ Examples of Top D2C Brand Websites (2026).md` — 50+ brands with screenshots
- `raw/Most Engaging & Best-Designed DTC eCommerce Brand Sites.md`
- **Specific brands to open:** Allbirds (product-first hero, minimal chrome), ESNTLS (bold photography + whitespace), Oura (sensor + benefits narrative), Supernatural (vibrant color, energy), Dropps (sustainability story), Jones Bar-B-Q (small-biz D2C done right — worth noting for athletic-brand crossover)

**Additional URLs:**
- https://ridge.com
- https://www.glossier.com
- https://www.dossier.co
- https://www.allbirds.com
- https://teklafabrics.com
- https://ghia.com

**What good looks like:**
- Hero is the PRODUCT, clearly visible, often oversized or angled. Not a lifestyle action shot where the product is a prop.
- One strong headline stating what the product is + a one-line benefit. Not a tagline.
- Social proof pattern: press-logo bar (real publications) + UGC video strip (autoplay muted loop).
- "Where to use it" / use-case grid beats a feature-bullet list.
- Shop CTA is consistent color, appears in nav AND hero AND product section AND sticky footer on mobile.
- Typography: one heavy sans for display, one clean sans for body (Inter / DM Sans / Aeonik family).
- Palette is 2-3 colors max, one accent reserved for CTA.

**Anti-patterns:**
- Stock lifestyle photography (diverse group laughing at a table).
- "Innovate. Inspire. Deliver." three-word abstract hero.
- Feature grids with icon + one-word label + lorem ipsum.
- Testimonial carousels with unsourced quotes.
- "As seen in" logo bar where logos aren't clickable (or aren't real placements).

---

## Luxury / Premium Ecom

**Primary refs:**
- `raw/Examples of Luxury, Brand-Led eCommerce Websites – Premium eCommerce UX + Technology.md`
- **Specific brands:** Sandqvist (minimal, product-first), Rapha (editorial + community content), Filippa K (Scandinavian restraint), Balenciaga (anti-UX rebellion — use sparingly, for brands that earn it)

**Additional URLs:**
- https://www.byredo.com
- https://www.aesop.com

**What good looks like:**
- Generous whitespace — product and typography breathe.
- Serif display font for identity; sans for UI.
- Photography is cinematic — single hero image, not a collage.
- Muted palette: ivory, bone, off-black. Saturated color used as punctuation, not dominance.
- Product names and prices are quiet. No "SALE!!!" badges.
- Content sections are magazine-style editorial — "The Journal," "Field Notes," "Dispatches."

**Anti-patterns:**
- Discount badges, urgency timers, "only 3 left!" nudges.
- Hero carousels with 6+ slides auto-rotating.
- Generic "Shop All" CTA language.
- Multiple colors competing for attention.

---

## Portfolio / Personal Work

**Primary refs:**
- `raw/Framer Gallery The best Personal website designs & inspiration.md`
- `raw/Portfolio websites - 31+ Best Portfolio Web Design Ideas 2026.md`

**What good looks like:**
- Hero is a name + one descriptive sentence. Not "Hi, I'm X" with a typewriter animation.
- Work grid with big images, small captions. Image-first, text secondary.
- ONE signature motion (cursor parallax, hover scale, marquee). Not five competing.
- Contact is one line + one link, not a form.

**Anti-patterns:**
- Three-column feature grids borrowed from SaaS templates.
- "I'm a passionate designer who loves coffee" generic copy.
- Skill bars, percentage fills, tag clouds.
- Every section animated on scroll-into-view.

**Gallery resources:**
- https://www.awwwards.com/websites/portfolio/
- https://www.framer.com/gallery/personal/
- https://www.framer.com/gallery/portfolio/
- https://99designs.com/inspiration/websites/portfolio

---

## Personal Brand / Creator

For monetized creator sites — newsletters, courses, coaching, speaking. Distinct from Portfolio (which showcases work for hire).

**Primary refs:**
- https://www.justinwelsh.me
- https://jennakutcher.com
- https://www.sahilbloom.com
- https://www.marieforleo.com
- https://www.nicolascole.com
- https://www.amyporterfield.com
- https://jamardiggs.com
- https://aliabdaal.com

**Gallery resources:**
- https://www.sitebuilderreport.com/inspiration/personal-websites
- https://colorlib.com/wp/personal-brand-websites/
- https://copyfol.io/personal-brand-websites
- https://www.figma.com/resource-library/portfolio-website-examples/
- https://www.squarespace.com/blog/personal-website-examples
- https://elementor.com/blog/personal-website-examples/
- https://speckyboy.com/creative-portfolio-websites/
- https://thebrandarchitect.co/inspiring-personal-websites/
- https://dorik.com/blog/personal-website-examples

---

## Editorial / Magazine / Content-Forward

**Status:** GAP — design rules referenced across skills, no captured Obsidian file yet. Second priority to fill.

**Primary refs (to capture):**
- **Aesop** — editorial product pages, long-form ingredient stories, typography-first
- **Everlane** — transparency as a design language, pricing breakdowns, factory stories
- **CDLP** — editorial men's-essentials, muted palette with rare saturated accent
- **The Gentlewoman** / **Apartamento** — print-native magazines with strong web presence
- **TODO:** capture to `wiki/raw/editorial-design-references.md`.

**What good looks like:**
- No card boxes. Sections separated by horizontal lines or whitespace only.
- Generous line-height (1.6+), narrow measure (55-75 characters), long paragraphs OK.
- Black-on-cream, not black-on-white.
- One signature color used sparingly (one CTA, one accent, one highlight per page).
- Section headers at weight 600 not 700, 20-28px not 32px+.
- Left-aligned text blocks, not center.

**Anti-patterns:**
- White card boxes with drop shadows — the #1 AI-generated dead giveaway.
- Gradient backgrounds.
- Geometric sans at heavy weights (Montserrat 800+).
- Stat cards with giant numbers and "↑ 23%" delta indicators.

---

## Dashboard / Analytics / Data UI

**Status:** PARTIAL — principles captured in `projects/website-audit/.claude/commands/audit-dashboard.md`, external refs not yet in Obsidian.

**Primary refs:** Principles below (validated on Pepper Pong) are the load-bearing guidance. URLs are supplemental landing-page pattern references, not full-UI captures yet.

**Principles (validated on Pepper Pong walkthrough):**
- NO white card boxes. Transparent sections, thin horizontal line separators, clean white bg.
- Inter 400-700. Never Montserrat or geometric heavy.
- Product photos, not action photos — hero gets a large product shot, not a stock lifestyle.
- Keyword presentation: compact pills for owned keywords, vertical list with colored left-border accents for invisible keywords.
- Every metric has a plain-English "why" — evidence lines, not just numbers.
- Collapsible details via `<details>` — avoid word-vomit on first glance.
- Don't fake progress. Pending = pending, not "in progress."
- Chart annotations in white boxes positioned OFF the trend line (overlap = unreadable).
- Growth channels as collapsible dropdown cards: icon + name + one-line status + big metric. Details hidden behind "Why this matters" toggle.

**Reference apps to open (when capturing):**
- **Linear** — issue tracking UI, keyboard-first
- **Stripe** — payments dashboard, data density balance
- **Posthog** — analytics dashboard, explorable charts
- **Vercel** — deploy UI, status density
- **TODO:** capture to `wiki/raw/dashboard-ui-references.md`.

**SaaS / Dev Tool marketing site URLs (design-adjacent, useful for landing-page pattern):**
- https://linear.app
- https://www.raycast.com
- https://vercel.com
- https://betterstack.com
- https://www.notion.com
- https://pitch.com
- https://www.framer.com

---

## Annabel's Own Brand Language

**Primary refs:**
- `raw/pbp-brand.md` — Pickleball Portal identity
- `raw/wayloft-signal-design.md` — Wayloft Signal design system (Geist / Geist Mono, editorial)

**Use for:** Reference of Annabel's taste when a prospect's brand is undefined or weak. NOT as a default — every prospect gets their own identity. These show "what Annabel considers good" in neutral cases only.

---

## Gaps — Fill Priority Order

1. **Editorial / magazine** — referenced across dashboard + redesign skill rules, not captured. Next priority.
2. **Athletic / sporting goods** — Pepper Pong shipped, no library entry. Nike/Tracksmith/Bandit Running would fit.
3. **Local service / trade** — future prospects likely (contractors, dentists, law firms). No current coverage.

Restaurant and dashboard gaps now seeded with URL lists (Apr 16). Deep-scrape captures to `raw/` can follow as needed.

**How to fill gaps:** drop design-reference URLs in Telegram tagged `#design` → routes to `raw/` via Annie → curate into a vertical-specific `raw/<vertical>-design-references.md` here → update this index.
