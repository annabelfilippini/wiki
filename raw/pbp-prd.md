# Pickleball Portal — Master PRD & Architecture

> **Owner:** Tom Filippini | **Founded:** November 2017  
> **Domain:** pickleballportal.com  
> **Repo:** `twflipper/pickleball-portal-next` (private)  
> **Stack:** Next.js 15 + shadcn/ui + Tailwind + Supabase + Vercel  
> **Last Updated:** 2026-02-18  
> **Status:** Pre-launch (deployed at pickleball-portal-next.vercel.app)

---

## 1. Vision

**Pickleball Portal is the ESPN of pickleball** — the independent, data-driven platform where players find gear intelligence, tournament info, rankings, and community tools that no corporate-owned entity can credibly provide.

### Why Us

- **Founded November 2017** — one of the first pickleball content sites ever built
- **Domain Rating 43** — 2,600+ backlinks, 566 linking domains, years of organic authority
- **502-paddle structured database** — no competitor has this depth
- **Independent** — pickleball.com (Dundon/UPA, $800M valuation) will never be trusted as unbiased. That gap is our moat.

### Strategic Positioning

```
Consumer site  = "The Athletic meets Wirecutter" (editorial, green-forward)
Brands portal  = "Bloomberg Terminal" (dark mode, dashboards, data)
```

### Exit Plays

- **Play A:** Sell to Dundon/UPA as their independent intelligence arm
- **Play B:** Operate as profitable multi-revenue business ($20-35K/mo target)

---

## 2. What's Built (as of Feb 18, 2026)

### Core Platform

| Feature | Route | Status | Details |
|---------|-------|--------|---------|
| Content Engine | `/blog/`, `/*` | LIVE | 303 articles, 12 writers, GEO-optimized |
| Paddle Catalog | `/paddles/` | LIVE | 428 paddles, 22+ brands, search/filter/sort |
| Paddle Detail Pages | `/paddles/[slug]` | LIVE | Full specs, ratings, multi-retailer price comparison |
| Brand Pages | `/paddles/[brand]` | LIVE | Per-brand catalog pages with brand info |
| Portal Score | on every paddle | LIVE | Proprietary 0-100 composite rating (secret algorithm) |
| Paddle Compare | sitewide | LIVE | Best Buy-style side-by-side (up to 4 paddles) |
| Paddle Finder Quiz | `/paddle-finder/` | LIVE | Interactive quiz → personalized recommendation |
| Deals Page | `/deals/` | LIVE | Supabase-driven, deal-of-day, Portal Score weighted |
| Tournament Finder | `/tournaments/` | LIVE | 154 tournaments, filters (tier/format/skill/state/date) |
| Tournament Detail | `/tournaments/[slug]` | LIVE | Full event pages with check-in, favorites, related |
| Price Comparison | on paddle detail | LIVE | Multi-retailer price table (JustPaddles featured first) |
| Price Alerts | on paddle detail | LIVE | "Notify me when price drops" — saves email + paddle to Supabase, syncs Beehiiv |
| Favorites | paddles + tournaments | LIVE | Heart toggle, saved to Supabase `user_favorites` (requires auth) |
| Auth | sitewide | LIVE | Email + Google OAuth, progressive gating |
| User Dashboard | `/dashboard/` | LIVE | Favorites, saved searches, profile |
| About | `/about/` | LIVE | Tom as founder, 12 contributors with photos |
| Brands Portal | `/brands/` | LIVE | Separate dark layout, Bronze/Silver/Gold packages, verified SEO metrics |
| Newsletter | footer + popups | LIVE | Beehiiv integration, Supabase as subscriber DB |
| FAQ Schema | all articles | LIVE | Auto-extracted FAQs → JSON-LD for GEO |
| Article Interstitials | all articles | LIVE | Related content cards every 3 sections |

### Design System

| Element | Implementation |
|---------|---------------|
| **Navbar** | Dark glassmorphism, mega menus (20+ brands in Paddles), scroll-shrink, mobile Sheet |
| **Logo** | Professional hexagonal badge with paddle icon, recolored to green (#22c55e) |
| **Footer** | 4-column dark charcoal, "since 2017" |
| **Icons** | Lucide everywhere — NO emojis. ShieldCheck/ShieldX/ShieldQuestion for approval badges |
| **Colors** | Green (#22c55e) primary, dark backgrounds for nav/footer/brands |
| **Affiliate buttons** | Green text on light green background (not solid green blocks) |
| **Link styling** | Internal = green, external = gray, affiliate = shopping cart icon + green on light green |
| **Pros/Cons** | Green checkmarks for Pros, red X for Cons (auto-detected from headings) |
| **Images** | All from Cloudinary (zero WP CDN dependency). Real photos over AI-generated. |

### Data Pipeline & Automation

| System | Schedule | Status |
|--------|----------|--------|
| Paddle price crawler | Every 6h | BROKEN — Spider.cloud getting blocked by retailer anti-bot |
| Tournament scraper | Every 6h | BROKEN — same Spider timeout issue |
| Price alert checker | Daily 9am | Works but 0 subscribers so far |
| Cloudinary image sync | Daily 3am | Erroring |
| GA4 Analytics | Always-on | LIVE — measurement ID `G-C2HGFX4VXC` |

### Content Quality

| Metric | Value |
|--------|-------|
| Total articles | 303 |
| Broken internal links fixed | 968 |
| Dead affiliate links replaced | 400+ |
| wp-content images migrated to Cloudinary | 883 |
| HTML entities decoded | 35 files |
| WP script/style blobs stripped | site-wide |
| Dan Langston references removed | all (seo_description, body text, images) |
| Author bios removed | 65 |
| Headings reformatted | 201 |
| Duplicate paragraphs removed | 17 |

### E2E Testing

- **188 Playwright tests** across 12 files — ALL PASSING
- Covers: navigation, paddle catalog, search, filters, quiz, deals, tournaments, auth flows

---

## 3. Tech Stack

### Application

```
Next.js 15 (App Router)
  ├── shadcn/ui components (button, card, badge, tabs, dropdown, sheet, separator,
  │   input, dialog, navigation-menu, accordion, table, select, checkbox)
  ├── Tailwind CSS
  ├── TypeScript
  └── React Server Components + Client Components
```

### Infrastructure

| Service | Purpose | Cost | Details |
|---------|---------|------|---------|
| Vercel | Hosting + CDN | Free tier | Team: tfilippini-7889s-projects |
| Supabase | DB + Auth | Free tier | Project: cztfwumwvtiwsabdilxd |
| Cloudinary | Images | $249/mo | Account: dfizq1up6 |
| Beehiiv | Newsletter | Free | Pub: pub_15b56ff7-0d22-4ea5-bcf7-31beb0db5623 |
| GitHub | Source | Free | twflipper/pickleball-portal-next (private) |
| Spider.cloud | Web scraping | Usage-based | For price/tournament crawling |
| GA4 | Analytics | Free | G-C2HGFX4VXC |

### Database Schema (Supabase)

**Core Tables:**

| Table | Rows | Purpose |
|-------|------|---------|
| `paddles` | 428 | Paddle catalog with specs, ratings, Portal Score, images |
| `paddle_prices` | 407 | Multi-retailer price comparison data |
| `tournaments` | 154 | Tournament listings with full metadata |
| `email_subscribers` | — | Newsletter + price alert signups |
| `profiles` | — | User profiles (auth) |
| `user_favorites` | — | Saved paddles + tournaments |
| `user_paddles` | — | User's owned paddles |
| `saved_searches` | — | Saved search filters |
| `user_courts` | — | User's home courts |
| `tournament_checkins` | — | "I'm going" RSVPs |
| `paddle_reviews` | — | User-submitted paddle reviews |

**New Tables (building overnight):**

| Table | Purpose |
|-------|---------|
| `news_items` | RSS aggregated news (title, url, source, summary, image, category, published_at) |
| `player_rankings` | Pro player data (name, slug, ranks, DUPR, MLP team, earnings, paddle, bio) |

**Paddle fields include:** name, brand, slug, category, shape, weight, length, width, thickness, grip_size, grip_circumference, core_material, face_material, edge_guard, msrp, current_price, image_url, approval_status, rating_performance, rating_power, rating_control, rating_spin, rating_sweet_spot, portal_score, skill_levels, and more.

**Tournament fields include:** name, slug, dates, venue, city/state, lat/lng, sanctioned_by, tier, format, skill_levels, DUPR/UTR rated, entry fees, director info, registration/website URLs, sponsorship data, source tracking, confidence_score.

### Affiliate Network

| Partner | Type | ID/Tag | Status | Priority |
|---------|------|--------|--------|----------|
| JustPaddles / Refersion | Direct | 516601, rfsn=6471927.deebc4 | ACTIVE | #1 (best commission, always shown first) |
| Amazon Associates | Network | pickleball07a-20 | ACTIVE | #2 |
| AvantLink | Network | Account active | ACTIVE | #3 |
| ShareASale / Awin | Network | Account active | ACTIVE | #4 |
| Pickleball Central | — | — | DEAD | Removed, all links replaced with JustPaddles |

### Email Architecture

```
Newsletter delivery  →  Beehiiv (pub_15b56ff7...)
Agent-to-human       →  AgentMail
Subscriber DB        →  Supabase (email_subscribers)
Price alert emails   →  TBD (Resend recommended — $0.80/1000)
```

---

## 4. Portal Score — Proprietary Rating System

**What it is:** A proprietary 0-100 composite rating for every paddle in our database. The algorithm is secret.

**What we say publicly:**
- Weighs multiple factors: player reviews, expert analysis, build quality, value for money, brand reputation, performance metrics
- Updated as new data comes in
- Independent and unbiased — no brand can pay for a higher score

**Actual formula (INTERNAL ONLY — never share):**
- Composite of: performance ratings (power/control/spin/sweet spot), price-to-value ratio, brand reliability, approval status, review sentiment
- Range: 66-97 (avg 85.5) across 428 paddles
- Column: `portal_score` in `paddles` table
- Default sort: "Most Popular" = Portal Score descending

**Why it matters:**
- Differentiator — no competitor has a composite rating
- Drives engagement (people want to see how their paddle ranks)
- Creates content opportunities (Top 10 lists by Portal Score)
- B2B value (brands care about their scores)

---

## 5. User Personas

| Persona | Needs | Entry Points | Monetization |
|---------|-------|-------------|--------------|
| **Casual Player** | Gear recs, beginner how-to, "what paddle?" | Google, Quiz, social | Affiliate, email capture |
| **Competitive (4.0+)** | Specs, tournament schedules, legality, comparisons | Direct, catalog, tournament finder | Affiliate (higher AOV), premium |
| **Gear Shopper** | Price comparison, deals, price history | Google Shopping, /deals/, alerts | Affiliate conversion |
| **Brand/Manufacturer** | Market intel, share of voice, pricing data | Direct outreach, /brands/ | Intelligence subscriptions |
| **Tournament Director** | Sponsorship, event visibility, player reach | /tournaments/, sponsorship hub | Commission (15%) |
| **Retailer** | Trust badge, merchandising intel | PP Verified outreach | Badge subscription |

---

## 6. Revenue Model

### Current Revenue

| Stream | Monthly | Status |
|--------|---------|--------|
| Affiliate (JustPaddles + Amazon + others) | ~$1K | Active but underoptimized |

### Target Revenue (12-month)

| Stream | Monthly | Effort | Timeline |
|--------|---------|--------|----------|
| Affiliate (optimized) | $2-5K | Low | Now |
| Sponsored content | $2-8K | Medium | 30 days |
| Premium price alerts | $500-2K | Low | 30 days |
| PP Verified badges | $1-5K | Medium | 60 days |
| Brand intelligence | $1-10K | High | 90 days |
| Sponsorship marketplace | $2-10K | High | 120 days |
| **Total** | **$9.5-35K/mo** | | |

### B2B Brand Intelligence (/intelligence/)

| Tier | Price | Features |
|------|-------|----------|
| Starter | $299/mo | Share of voice, basic competitive positioning |
| Pro | $599/mo | + Price elasticity, demand signals, monthly reports |
| Enterprise | $1,499/mo | + Custom reports, API access, dedicated support |

---

## 7. Roadmap

### Phase 1: Launch Ready (NOW — next 2 weeks)

| Priority | Task | Status |
|----------|------|--------|
| CRITICAL | DNS cutover: pickleballportal.com → pickleball-portal-next Vercel project | Blocked (Namecheap EPP code) |
| CRITICAL | **Rebuild price pipeline** — multi-strategy (Shopify JSON, Amazon PA-API, Playwright fallback) | OVERNIGHT BUILD |
| CRITICAL | **Rebuild tournament pipeline** — pickleballtournaments.com API, cheerio, Playwright fallback | OVERNIGHT BUILD |
| CRITICAL | **Fix deals page** — honest timestamps, real multi-retailer data, 5% min discount | OVERNIGHT BUILD |
| CRITICAL | Rotate Beehiiv API key (exposed in Discord 2/16) | Not done |
| DONE | Portal Score explainer page (`/portal-score`) | ✅ BUILT |
| DONE | DR tooltip on brands page | ✅ BUILT |
| DONE | Tournament Google Map (Leaflet/OpenStreetMap, no API key) | ✅ BUILT |
| DONE | Tournament org badges (PPA blue/MLP orange/APP green/USAP red/Local gray) | ✅ BUILT |
| DONE | Tournament calendar month view | ✅ BUILT |
| DONE | Tournament detail page enrichment (color-coded hero, mini-map, skill viz, director card) | ✅ BUILT |
| DONE | Hyper-granular tournament filters (search, state, city, league, tier, skill, format, venue type, DUPR, Golden Ticket) | ✅ BUILT |
| DONE | Contributors moved above founder on about page | ✅ BUILT |
| DONE | "Meet the experts" link on homepage hero | ✅ BUILT |
| DONE | Professional logo recolored to green, integrated site-wide | ✅ BUILT |
| HIGH | **News Hub** (`/news/`) — RSS aggregator page | OVERNIGHT BUILD |
| HIGH | **Rankings** (`/rankings/`) — pro player table | OVERNIGHT BUILD |
| HIGH | **Player Profiles** (`/players/[slug]`) — baseball card style | OVERNIGHT BUILD |
| HIGH | **News RSS cron** — fetch from 6+ sources every 2h | OVERNIGHT BUILD |
| HIGH | Connect Google Search Console | Not started |
| MEDIUM | Source 26 remaining paddle images (Babolat 10, HEAD 8, Wilson 4, Franklin 1) | Not started |
| MEDIUM | Set up transactional email for price alerts (Resend — $0.80/1000) | Not started |
| MEDIUM | Send drafted reply to John Palmer (JustPaddles) | In dan@ Gmail drafts |

### Phase 2: Content & SEO (weeks 3-6)

| Task | Details |
|------|---------|
| GEO optimize top 29 articles | Tools built at `skills/geo/`, targets scoring 50-79 |
| Expand 71 thin pages (<500 words) | Content pipeline |
| Refresh 6 priority articles for 2026 | Identified but not started |
| Add `llms.txt` | AI crawler optimization (pre-deploy) |
| Social buzz scanner v1 | Reddit r/pickleball, X, The Dink → sentiment scoring |
| Paddle legality tracking | 408 approved / 9 banned per USA Pickleball list |
| Paddle variants | Parent model + variants (thickness, grip, color) with per-variant pricing |

### Phase 3: ESPN Features (weeks 4-10)

| Feature | Route | Description | Status |
|---------|-------|-------------|--------|
| **News Hub** | `/news/` | RSS aggregator: The Dink, USAP, Reddit, YouTube, PPA, APP | OVERNIGHT BUILD |
| **Rankings** | `/rankings/` | Pro player rankings with DUPR, earnings, MLP team | OVERNIGHT BUILD |
| **Player Profiles** | `/players/[slug]` | Baseball card — stats, paddle, team, bio | OVERNIGHT BUILD |
| **MLP Hub** | `/mlp/` | 20 teams, rosters, schedules, standings | Roadmap |
| **Court Finder** | `/courts/` | Google Maps + user submissions | Roadmap |
| **Live Match Tracker** | `/live/` | Real-time scores during MLP/PPA events | Roadmap |
| **Social Buzz Dashboard** | `/buzz/` | Trending paddles/topics from Reddit/X/Dink | Roadmap |
| **Paddle Comparison Tool** | enhanced `/paddles/compare/` | Deep side-by-side with radar charts | Roadmap |
| **Community Forums** | `/community/` | Threaded discussions, gear talk | Roadmap (long-term) |

### Phase 4: Monetization (weeks 8-16)

| Feature | Description | Revenue Est. |
|---------|-------------|-------------|
| Brand Intelligence Dashboard | `/intelligence/` — B2B subscription ($299-1499/mo) | $1-10K/mo |
| PP Verified Retailer Badges | Trust badge program, monthly subscription | $1-5K/mo |
| Premium Newsletter Tier | $5-10/mo for instant alerts, exclusive deals | $500-2K/mo |
| Sponsorship Marketplace | Brand ↔ tournament director matching (15% commission) | $2-10K/mo |
| Sponsored Content Program | $500-5K per post, media kit | $2-8K/mo |
| PP Reps | "Uber for brand ambassadors" (20-25% platform fee) | $1-5K/mo |
| Premium API | Paddle data API for third-party apps ($99-499/mo) | $500-2K/mo |

### Phase 5: Platform (months 4-6)

| Feature | Description |
|---------|-------------|
| Padel Expansion | Top US padel site is DA 8 vs our DR 43 — massive gap |
| YouTube Auto-Shorts | Generated from Supabase data (paddle reviews, deal alerts) |
| Paddle Masterclass | $49 one-time video course |
| Marketplace / Drop-ship | Start with Pepper Pong, expand to paddle brands |
| Mobile App | React Native wrapper for core features (push notifications for price drops) |
| Podcast | "The Portal" — weekly pickleball industry pod |

---

## 8. Data Flows

### NON-NEGOTIABLE: Data Freshness Requirements

| Data Type | Max Staleness | Cron Frequency | Redundancy |
|-----------|--------------|----------------|------------|
| Paddle prices | 6 hours | Every 4h | 3 strategies (Shopify JSON → Amazon PA-API → Playwright) |
| Tournament listings | 12 hours | Every 12h | 2 strategies (API → cheerio scrape) |
| News/RSS | 2 hours | Every 2h | Direct RSS parse (no third-party dependency) |
| Player rankings | 24 hours | Daily 6am | Multiple sources (PPA, DUPR, pickleballbrackets) |
| Paddle images | 24 hours | Daily 3am | Cloudinary sync |

**Rule: If data is stale, show honest timestamps. Never claim "updated hourly" if it's not.**

### Price Tracking Pipeline (v2 — Multi-Strategy)

```
Strategy A: Shopify JSON (primary — free, reliable, no scraping)
  selkirk.com/products.json, joolausa.com/products.json,
  crbnpickleball.com, gearboxsports.com, etc.
        │
Strategy B: Amazon PA-API (tag: pickleball07a-20)
  Real-time Amazon prices for all matched ASINs
        │
Strategy C: Playwright headless browser (fallback)
  JustPaddles, Dick's Sporting Goods, etc.
        │
        ▼
  Fuzzy-match to paddles table (428 rows)
        │
        ├──→ paddle_prices UPSERT (retailer, price, url, scraped_at)
        ├──→ paddles.current_best_price = MIN(all retailer prices)
        ├──→ paddles.all_time_low = MIN(historical)
        ├──→ Check price_alerts → trigger email (Resend)
        └──→ price_history INSERT (for trend charts)
```

### Tournament Pipeline (v2 — Multi-Strategy)

```
Strategy A: pickleballtournaments.com API
  Direct API call if available
        │
Strategy B: Cheerio HTML parsing
  PPA Tour, APP Tour, USA Pickleball event pages
        │
Strategy C: Playwright (fallback for JS-heavy sites)
        │
        ▼
  Extract: name, dates, location, tier, skill levels, registration URL
        │
        ├──→ tournaments UPSERT (dedup by name + date_start)
        ├──→ Geocode new locations (Nominatim API)
        └──→ Detect org from source/name (PPA/MLP/APP/USAP/local)
```

### News Pipeline (NEW)

```
RSS/Atom Feeds (every 2h):
  The Dink, USA Pickleball, Pickleball Magazine,
  Reddit r/Pickleball, YouTube channels, PPA/APP blogs
        │
        ▼
  Parse: title, url, summary, image, published_at
        │
        ├──→ news_items UPSERT (dedup by url)
        └──→ Categorize: pro_tours, community, gear, reddit, youtube
```

### Rankings Pipeline (NEW)

```
Sources (daily):
  PPA Tour player pages, DUPR API (if public),
  pickleballbrackets.com, MLP team rosters
        │
        ▼
  Extract: name, rank, DUPR, team, earnings, paddle
        │
        └──→ player_rankings UPSERT (dedup by slug)
```

### Affiliate Flow

```
User reads content → clicks affiliate link → retailer site → conversion
        │
        ├──→ JustPaddles (Refersion tracking: rfsn=6471927.deebc4)
        ├──→ Amazon (tag: pickleball07a-20)
        ├──→ AvantLink
        └──→ ShareASale / Awin
```

---

## 9. Key Files & Directories

### Application

```
src/
├── app/
│   ├── page.tsx                    # Homepage (dark hero, MLP aerial)
│   ├── [...slug]/page.tsx          # All content pages (303 articles)
│   ├── paddles/
│   │   ├── page.tsx                # Paddle catalog
│   │   ├── [slug]/page.tsx         # Paddle detail + brand pages
│   │   └── PaddleCatalog.tsx       # Client-side catalog with filters
│   ├── tournaments/
│   │   ├── page.tsx                # Tournament listing
│   │   ├── [slug]/page.tsx         # Tournament detail
│   │   └── TournamentListClient.tsx
│   ├── deals/page.tsx              # Deals page
│   ├── paddle-finder/              # Quiz
│   ├── about/page.tsx              # About (Tom as founder)
│   ├── dashboard/                  # User dashboard
│   ├── (brands)/brands/page.tsx    # B2B brands portal (dark layout)
│   ├── blog/[slug]/page.tsx        # Blog post wrapper
│   └── api/
│       ├── subscribe/route.ts      # Newsletter + price alert signup
│       └── auth/                   # Auth callbacks
├── components/
│   ├── consumer-nav.tsx            # Main navbar (glassmorphism, mega menus)
│   ├── consumer-footer.tsx         # Footer
│   ├── MarkdownContent.tsx         # Article renderer (spec tables, pros/cons, links)
│   ├── TableOfContents.tsx         # Sidebar TOC with progress bar
│   ├── ArticleInterstitials.tsx    # In-article related content cards
│   ├── PriceAlert.tsx              # Price drop notification signup
│   ├── PriceComparison.tsx         # Multi-retailer price table
│   ├── CompareBar.tsx / CompareModal.tsx  # Paddle comparison feature
│   ├── safe-img.tsx                # Graceful broken image fallback
│   ├── favorites/favorite-button.tsx
│   └── tournaments/tournament-card.tsx
├── lib/
│   ├── supabase/                   # Supabase clients (server + client + anon)
│   └── geo.ts                      # GEO optimization (FAQ extraction, schema)
└── types/
    └── tournament.ts               # Tournament TypeScript interface
```

### Scripts

```
scripts/
├── crawl-paddle-prices.cjs         # Spider-powered price crawler
├── scrape-all-sources.js           # Tournament source scraper
├── extract-tournaments.js          # Tournament data extraction
├── dedup-tournaments.js            # Tournament deduplication
├── check-price-alerts.cjs          # Price alert trigger checker
├── sync-paddle-images.cjs          # Cloudinary image sync
├── migrate-wp-images.js            # WordPress → Cloudinary migration
├── rewrite-wp-urls.js              # URL rewriting
├── fix-formatting.js               # Content formatting fixes
├── fix-prose-quality.js            # Prose quality improvements
├── fix-affiliate-links-pass2.js    # Affiliate link replacement
├── wp-to-cloudinary-map.json       # Image URL mapping
├── geo-audit-report.json           # GEO citability scores
└── qa-report.md                    # Full QA audit results
```

### Content

```
content/
├── blog/                           # 303 markdown articles
├── paddles/                        # Paddle data (if any static)
public/
├── images/
│   ├── logo-navbar.png             # Green icon + white text (transparent bg)
│   ├── logo-primary-green.png      # Stacked logo (green accents)
│   ├── logo-icon-green.png         # Icon only (for favicon)
│   ├── hero-aerial.jpg             # Real MLP tournament aerial photo
│   └── writers/*.png               # Contributor photos (green ring)
├── favicon.ico                     # Hexagonal badge icon
└── apple-touch-icon.png
```

---

## 10. Competitive Landscape

```
              Independent ←──────────────────→ Corporate
                   │                                │
         ┌─────────┼─────────┐                      │
         │         │         │                      │
    Pickleball  The Dink  PB Kitchen          pickleball.com
     Portal    (newsletter)                    (Dundon/UPA)
      DR 43                                        │
         │                                   Selkirk/JOOLA
    502 paddles                             (brand-owned)
    Portal Score
    Price tracking
    Tournament finder
```

### Defensible Moat

1. **502-paddle structured database** with proprietary Portal Score
2. **DR 43 / 566 linking domains** — years of organic authority
3. **Independent positioning** — corporate sites can never replicate trust
4. **Price history data** — compounding asset
5. **Founded 2017** — pre-dates the sport going mainstream
6. **GEO optimization** — positioned for AI citation era

---

## 11. Known Issues & Blockers

| Issue | Severity | Details |
|-------|----------|---------|
| Price crawler broken | HIGH | Spider.cloud blocked. **Migrating to Dell tower PC** — Playwright-based scraping will run on dedicated hardware to avoid cloud anti-bot detection. Shopify JSON + Amazon PA-API as primary, Playwright headless as fallback. |
| Tournament scraper broken | HIGH | Spider timeout. **Migrating to Dell tower PC** — dedicated Playwright instance with residential IP. API + cheerio + Playwright fallback pipeline. |
| DNS not cut over | HIGH | Namecheap not sending EPP/auth code |
| Beehiiv API key exposed | MEDIUM | Exposed in Discord 2/16. Needs rotation + Vercel env update |
| 26 paddles missing images | MEDIUM | Babolat (10), HEAD (8), Wilson (4), Franklin (1) |
| No transactional email | MEDIUM | Price alerts collect emails but can't send notifications yet |
| pickleball.com API denied | MEDIUM | Doug Weiss said "partners only." LinkedIn outreach to Safet Pojskić planned |
| GEO avg citability 34/100 | MEDIUM | Only 1 article GEO-ready (buyer's guide at 88/100) |
| Google Search Console not connected | MEDIUM | No baseline traffic data |
| 57 tournaments have no valid external links | LOW | Showing placeholders |

---

## 12. Credentials & Access (INTERNAL)

| Service | Key Location / Details |
|---------|----------------------|
| Supabase | `~/.secrets/supabase-pickleball-portal.json` — ref: cztfwumwvtiwsabdilxd |
| Supabase mgmt | Token: `sbp_b47139e39187bb9314995f2676a5f94b60e47770` |
| Cloudinary | `~/.secrets/cloudinary-pickleballportal.json` — account: dfizq1up6 |
| Beehiiv | `~/.secrets/beehiiv-pickleballportal.json` — NEEDS ROTATION |
| Spider.cloud | `~/.secrets/spider-cloud.json` |
| dan@ Gmail | `GOG_KEYRING_BACKEND=file GOG_KEYRING_PASSWORD=pbp gog gmail COMMAND --account dan@pickleballportal.com` |
| Amazon Associates | Tag: pickleball07a-20 |
| JustPaddles/Refersion | ID: 516601, link: rfsn=6471927.deebc4 |
| GA4 (NEW) | Measurement ID: G-J7Y27KM430 (account: tom@pickleballportal.com) |
| GA4 (OLD) | Measurement ID: G-0SFR446CDC (historical reference only, tfilippini@gmail.com) |
| Google OAuth | `~/.secrets/google-oauth-pickleballportal.json` — Client ID: 790647886980-2gsd36m0en1da002jjl1kccquupb90qs.apps.googleusercontent.com |
| Google Cloud | Project: pickleball-portal-488017 (tom@pickleballportal.com) |
| Vercel env vars | Set for production + preview |
| Git config | user.email = tfilippini@gmail.com |

---

## 13. Design Principles

1. **Real over fake** — real tournament photos, real data, real reviews. No AI-generated court images.
2. **Independence is the brand** — frame affiliate disclosure as trust-building, not apologetic
3. **Data is the moat** — every feature should generate or leverage proprietary data
4. **Green is the color** — site palette anchored on #22c55e, dark accents
5. **Lucide over emoji** — consistent iconography across all surfaces
6. **Mobile-first** — hamburger menu, responsive grids, touch-friendly
7. **Speed** — static generation where possible, edge caching, optimized images
8. **Founded 2017** — always lead with heritage. Pre-dates the mainstream boom.

---

## 14. Content Strategy

### GEO Optimization (Generative Engine Optimization)

Every article targets AI citation (ChatGPT, Perplexity, Google AI Overviews):
- Comparison tables with structured data
- FAQ schema (auto-extracted → JSON-LD)
- Quotable snippets (concise, authoritative)
- Freshness signals (dates, "updated for 2026")
- Internal links to paddle catalog

**GEO Audit Results:**
- Average citability: 34/100
- 1 GEO-ready article (buyer's guide: 88/100)
- 29 articles scoring 50-79 = highest-ROI optimization targets
- Biggest gaps: lists/tables (552 missing), Q&A format (510), freshness (490)

### Topical Authority Clusters

```
Pickleball Portal
    ├── Paddles (reviews, vs posts, best-of, brand guides)
    ├── Rules (scoring, kitchen, singles, doubles)
    ├── Strategy (drills, techniques, competitive play)
    ├── Gear (shoes, bags, balls, accessories)
    ├── Courts (indoor, outdoor, near-me)
    └── Tournaments (schedules, results, travel)
```

---

## 15. Legacy & Migration History

| Date | Event |
|------|-------|
| Nov 2017 | Pickleball Portal founded (WordPress) |
| 2017-2025 | Content growth to 300+ articles, DR 43 |
| Feb 14, 2026 | Migrated WordPress → Astro |
| Feb 14, 2026 | Immediately migrated Astro → Next.js 15 |
| Feb 15-18, 2026 | Massive feature buildout (see "What's Built" section) |
| Feb 18, 2026 | Professional logo integrated, recolored to green |
| Feb 18, 2026 | Portal Score page, DR tooltip, tournament map/badges/calendar/filters |
| Feb 18-19, 2026 | Overnight: scrapers rebuilt, news hub, rankings, deals fix |

**Legacy Astro site:** `~/Repos/pickleball-portal/` → `pickleball-portal.vercel.app` (fallback, untouched)

---

## 16. Complete Feature & Idea Registry

Every idea discussed, whether built, in progress, or on the backlog. Nothing gets lost.

### Data & Automation (THE BACKBONE)

| Idea | Status | Details |
|------|--------|---------|
| Multi-strategy price crawler | OVERNIGHT BUILD | Shopify JSON → Amazon PA-API → Playwright. Every 4h. |
| Multi-strategy tournament scraper | OVERNIGHT BUILD | API → cheerio → Playwright. Every 12h. |
| News RSS aggregator | OVERNIGHT BUILD | The Dink, USAP, Reddit, YouTube, PPA, APP. Every 2h. |
| Rankings data collector | OVERNIGHT BUILD | PPA, DUPR, pickleballbrackets. Daily. |
| Price alert email sender | NOT STARTED | Resend integration. Triggers when price < alert target. |
| Cloudinary image sync | BROKEN | Daily 3am. Needs fix. |
| Redundant cron architecture | BUILDING | Every pipeline has 2-3 fallback strategies. Auto-failover. |
| Data freshness monitoring | IDEA | Dashboard showing last-updated for each data type. Alert if stale. |
| Affiliate data feeds | IDEA | Ask JustPaddles/Refersion for product CSV/XML feed. |
| Amazon PA-API integration | OVERNIGHT BUILD | Real-time pricing via Product Advertising API 5.0. |

### Content & Editorial

| Idea | Status | Details |
|------|--------|---------|
| GEO optimization (29 articles) | TOOLS BUILT | `skills/geo/` toolkit ready. Targets scoring 50-79. |
| Expand 71 thin pages | NOT STARTED | Pages <500 words need expansion. |
| Refresh 6 priority articles | NOT STARTED | Identified, awaiting content work. |
| `llms.txt` for AI crawlers | NOT STARTED | Pre-deploy SEO. |
| Social buzz scanner | IDEA | Reddit/X/Dink sentiment → content opportunities. |
| Auto-generated paddle comparisons | IDEA | "X vs Y" articles from structured data. |
| Weekly "Best Deals" newsletter | IDEA | Beehiiv automated from Supabase deal data. |
| Video content from Twelve Labs | IDEA | Pepper Pong has 4K+ indexed videos. Cross-pollinate? |

### Pages & Features

| Feature | Route | Status | Details |
|---------|-------|--------|---------|
| News Hub | `/news/` | OVERNIGHT BUILD | RSS aggregator, source badges, category filters |
| Rankings | `/rankings/` | OVERNIGHT BUILD | Singles/Doubles/Mixed tabs, player table |
| Player Profiles | `/players/[slug]` | OVERNIGHT BUILD | Baseball card style |
| Portal Score Explainer | `/portal-score` | ✅ BUILT | Visual breakdown, trust section, secret algo pitch |
| Tournament Map | `/tournaments/` (map tab) | ✅ BUILT | Leaflet/OpenStreetMap, pins with popups |
| Tournament Calendar | `/tournaments/` (calendar tab) | ✅ BUILT | Month grid, day dots, click-to-filter |
| Tournament Org Badges | `/tournaments/` | ✅ BUILT | PPA/MLP/APP/USAP/Local color-coded |
| Tournament Hyper-Filters | `/tournaments/` | ✅ BUILT | 12 filter dimensions, instant client-side |
| Tournament Detail Hero | `/tournaments/[slug]` | ✅ BUILT | Color-coded hero, mini-map, skill bar, director card |
| Deals Page (honest) | `/deals/` | OVERNIGHT BUILD | Real multi-retailer data, honest timestamps, 5% threshold |
| MLP Hub | `/mlp/` | ROADMAP | 20 teams, rosters, schedules, standings |
| Court Finder | `/courts/` | ROADMAP | Google Maps + user submissions + geocoding |
| Live Match Tracker | `/live/` | ROADMAP | Real-time scores during MLP/PPA events |
| Social Buzz Dashboard | `/buzz/` | ROADMAP | Trending paddles/topics from social sources |
| Paddle Comparison Tool | `/paddles/compare/` | ROADMAP | Deep side-by-side with radar charts |
| Brand Intelligence | `/intelligence/` | ROADMAP | B2B dashboard ($299-1499/mo subscription) |
| Sponsorship Marketplace | `/sponsors/` | ROADMAP | Brand ↔ tournament matching (15% commission) |
| Community Forums | `/community/` | ROADMAP (long-term) | Threaded discussions |
| Paddle Legality Tracker | `/legality/` | ROADMAP | USA Pickleball approved/banned list with search |
| Stock Alerts | on paddle detail | ROADMAP | Variant-level back-in-stock notifications |
| Paddle Variants | on paddle detail | ROADMAP | Parent model + thickness/grip/color variants |

### Monetization Ideas

| Idea | Est. Revenue | Timeline | Details |
|------|-------------|----------|---------|
| Affiliate optimization | $2-5K/mo | Now | Better link placement, quiz optimization |
| Sponsored content | $2-8K/mo | 30 days | Media kit needed, $500-5K per post |
| Premium price alerts | $500-2K/mo | 30 days | Stripe, $5-10/mo tier |
| PP Verified badges | $1-5K/mo | 60 days | Retailer trust badge subscription |
| Brand intelligence subs | $1-10K/mo | 90 days | Dashboard build needed |
| Sponsorship marketplace | $2-10K/mo | 120 days | Two-sided, Stripe Connect |
| PP Reps | $1-5K/mo | 180 days | Brand ambassador staffing platform |
| Premium API | $500-2K/mo | 90 days | Paddle data for third-party apps |
| Padel expansion | Content + catalog | 120 days | DA 8 competitor = easy win |
| YouTube auto-shorts | Ad revenue | 60 days | From Supabase data |
| Paddle Masterclass | $49 one-time | 90 days | Video course |
| Mobile app | Push notifications | 180 days | React Native wrapper |
| Podcast "The Portal" | Sponsorship | 120 days | Weekly industry pod |

### Infrastructure & Operations

| Task | Status | Details |
|------|--------|---------|
| DNS cutover | BLOCKED | Namecheap EPP code not arriving |
| Beehiiv API key rotation | NOT DONE | Exposed in Discord 2/16 |
| Google Search Console | NOT DONE | Need baseline traffic data |
| Ahrefs subscription ($29/mo) | NOT DONE | For DR/backlink monitoring |
| Resend integration | NOT DONE | Transactional email for price alerts |
| Sentry error tracking | ROADMAP | Post-launch |
| Supabase backup schedule | ROADMAP | Automated daily backups |
| AuthProvider in root layout | ✅ DONE | Fixed FavoriteButton crash |
| E2E test suite | ✅ DONE | 188 Playwright tests passing |

---

*This is the single source of truth for Pickleball Portal product, architecture, and roadmap. Keep it updated.*

## 17. Overnight Build Log (Feb 18-19, 2026)

| Time | Agent | What | Status |
|------|-------|------|--------|
| 11:10pm | pbp-scrapers | Multi-strategy price/tournament/news/rankings scripts | DONE |
| 11:10pm | pbp-news-rankings | /news/, /rankings/, /players/[slug] pages + Supabase tables | DONE |
| 11:10pm | pbp-deals-fix | Deals page: honest data, multi-retailer, 5% threshold, filters | DONE |
| 11:23pm | pbp-insider-guide | /insider-guide/ — TV, YouTube, podcasts, newsletters, Reddit, X | DONE |
| 11:35pm | pbp-travel | /travel/ — resorts, camps, towns, international, destination map | BUILDING |
| 11:35pm | pbp-geo-optimize | AI snippet optimization: FAQ schema, llms.txt, structured data | BUILDING |

---

## 18. Content Pipeline Engine (NEW — Priority Build)

### Vision
A self-sustaining content machine: AI scouts topics → contributors claim articles → AI assists writing → auto-publishes everywhere. The goal is 4-8 new articles per week with minimal Tom involvement.

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    TOPIC SCOUTING (always-on)                │
│                                                              │
│  Local LLM (cron, every 4h) scours:                         │
│  ├── New paddle releases (Shopify /products.json changes)    │
│  ├── Reddit r/Pickleball hot threads & trending topics       │
│  ├── X/Twitter pickleball trending                           │
│  ├── Google Trends for pickleball queries                    │
│  ├── HARO / Connectively / Qwoted (journalist queries)      │
│  ├── Competitor content gaps (The Dink, PB Kitchen, etc.)    │
│  ├── Tournament results → recap opportunities                │
│  ├── Pro player news / transfers / controversies             │
│  ├── New rule changes (USA Pickleball)                       │
│  └── Our own data: trending paddles, price drops, search     │
│                                                              │
│  Output → topic_queue table in Supabase                      │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│                    TOPIC QUEUE / PICK LIST                    │
│                                                              │
│  Supabase table: content_topics                              │
│  ├── id, title, slug, category                               │
│  ├── source (reddit, haro, new-paddle, trending, manual)     │
│  ├── priority (1-5), estimated_value ($)                     │
│  ├── brief (AI-generated 200-word article brief)             │
│  ├── target_keywords[], target_word_count                    │
│  ├── status: open → claimed → drafting → review → published  │
│  ├── claimed_by (contributor_id), claimed_at                 │
│  ├── deadline                                                │
│  └── payout_amount (see pay scale below)                     │
│                                                              │
│  Pick list visible to contributors in their portal           │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│              CONTRIBUTOR PORTAL (backend UI)                  │
│              /contributor/ (auth-gated)                       │
│                                                              │
│  Dashboard:                                                  │
│  ├── Available topics (pick list with $ amounts)             │
│  ├── My claimed articles (status, deadline, payout)          │
│  ├── Article editor:                                         │
│  │   ├── Paste text (plain text or markdown)                 │
│  │   ├── Upload images (→ Cloudinary auto-upload)            │
│  │   ├── AI assist: "Expand this section", "Add FAQ",        │
│  │   │   "Optimize for GEO", "Check facts"                  │
│  │   └── Preview (renders as it will appear on site)         │
│  ├── My earnings (lifetime, pending, paid)                   │
│  └── Profile settings                                        │
│                                                              │
│  On submit → status = "review"                               │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│              AI BUILD & QA PIPELINE                           │
│                                                              │
│  When article submitted:                                     │
│  1. AI formats markdown (headings, links, images)            │
│  2. Auto-generates FAQ section                               │
│  3. Auto-generates meta description + OG tags                │
│  4. Internal link injection (to paddles, tournaments, etc.)  │
│  5. Affiliate link placement (natural, GEO-compliant)        │
│  6. Portal Score references where relevant                   │
│  7. Spell/grammar check                                      │
│  8. GEO citability score check (must be >60 to publish)      │
│  9. Ranch Hand QA review (automated)                         │
│  10. Status → "ready" (or kicked back with notes)            │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│              PUBLISH & DISTRIBUTE                             │
│                                                              │
│  On publish:                                                 │
│  1. Markdown → content/blog/[slug].md                        │
│  2. Git commit + push → Vercel auto-deploy                   │
│  3. Beehiiv newsletter queue (next digest)                   │
│  4. Social distribution:                                     │
│  │   ├── X/Twitter (auto-post with excerpt + link)           │
│  │   ├── Reddit r/Pickleball (if appropriate)                │
│  │   ├── Facebook pickleball groups                          │
│  │   └── Instagram (if image-heavy)                          │
│  5. Update sitemap                                           │
│  6. Ping Google for re-index                                 │
│  7. Track in content_articles table                          │
└─────────────────────────────────────────────────────────────┘
```

### Pay Scale (per article)

| Tier | Rate | Criteria |
|------|------|----------|
| Standard | $75 | Any contributor, 800+ words, passes QA |
| Expert | $125 | Pro player or certified coach author |
| Premium | $200 | 2000+ words, original research/data |
| HARO/PR | $50 | Response to journalist query (shorter) |
| Declining bonus | +$25 | First 48h after topic posted (urgency incentive) |

**Payment:** Monthly via PayPal or Venmo. Track in Supabase `contributor_payouts` table.

### Topic Scouting Cron

```
Every 4 hours:
  1. Check Shopify JSON feeds for new/changed products → "New Paddle: [Brand] [Model]"
  2. Reddit r/Pickleball top 10 hot posts → extract trending topics
  3. Google Trends pickleball queries → identify rising searches
  4. Check HARO/Connectively for pickleball journalist requests
  5. Scan competitor RSS (The Dink, PB Kitchen) for gaps we haven't covered
  6. Check our own DB: paddles with 0 review articles → "Needs Review: [Paddle]"
  7. Tournament results from past week → "Recap: [Tournament Name]"

Output: Insert into content_topics with AI-generated brief
```

### New Supabase Tables

```sql
-- Content pipeline
CREATE TABLE content_topics (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title text NOT NULL,
  slug text UNIQUE,
  category text, -- gear, strategy, news, review, opinion, recap
  source text, -- reddit, haro, new-paddle, trending, manual, competitor-gap
  source_url text,
  priority int DEFAULT 3, -- 1=urgent, 5=backlog
  brief text, -- AI-generated article brief
  target_keywords text[],
  target_word_count int DEFAULT 1200,
  payout_amount numeric(6,2) DEFAULT 75.00,
  status text DEFAULT 'open', -- open, claimed, drafting, review, ready, published, killed
  claimed_by uuid REFERENCES profiles(id),
  claimed_at timestamptz,
  deadline timestamptz,
  published_at timestamptz,
  article_slug text, -- link to published article
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE contributor_profiles (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES profiles(id),
  display_name text NOT NULL,
  bio text,
  photo_url text,
  tier text DEFAULT 'standard', -- standard, expert, premium
  expertise text[], -- gear, strategy, coaching, news
  articles_published int DEFAULT 0,
  total_earned numeric(8,2) DEFAULT 0,
  payment_method text, -- paypal, venmo
  payment_handle text,
  active boolean DEFAULT true,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE content_articles (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  topic_id uuid REFERENCES content_topics(id),
  contributor_id uuid REFERENCES contributor_profiles(id),
  title text NOT NULL,
  slug text UNIQUE NOT NULL,
  body_markdown text,
  images text[], -- Cloudinary URLs
  meta_description text,
  faq_items jsonb, -- [{q, a}, ...]
  geo_score int, -- citability score
  status text DEFAULT 'draft', -- draft, review, approved, published, rejected
  reviewer_notes text,
  published_at timestamptz,
  social_posted jsonb, -- {twitter: true, reddit: false, ...}
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE contributor_payouts (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  contributor_id uuid REFERENCES contributor_profiles(id),
  article_id uuid REFERENCES content_articles(id),
  amount numeric(6,2) NOT NULL,
  status text DEFAULT 'pending', -- pending, paid
  paid_at timestamptz,
  payment_ref text,
  created_at timestamptz DEFAULT now()
);
```

### Uncovered Paddles (immediate content opportunities)

Topic scouting should identify paddles in our DB with no associated review article. Cross-reference `paddles` table slugs against `content/blog/*.md` filenames. Any paddle without a review = instant topic for the queue.

### HARO / Connectively / Qwoted Integration

- Cron checks HARO emails (sent to dan@pickleballportal.com or dedicated email)
- AI identifies pickleball-relevant queries
- Auto-generates draft response citing our data
- Posts to topic queue for contributor polish
- Fast turnaround = backlinks from major publications

### Content Calendar

| Day | Content Type | Notes |
|-----|-------------|-------|
| Monday | Paddle review | New release or trending paddle |
| Tuesday | Strategy/technique | Coaching content |
| Wednesday | News recap | Weekly roundup from /news/ data |
| Thursday | Deals roundup | Best deals of the week from /deals/ data |
| Friday | Opinion/hot take | Controversial topic from Reddit/X scouting |
| Weekend | Tournament recap | Results + analysis from weekend events |

### Metrics

| Metric | Target |
|--------|--------|
| Articles per week | 4-8 |
| Avg GEO citability score | >70 |
| Time from topic → publish | <72h for standard, <24h for news |
| Contributor pool | 14 current → 20+ |
| HARO response rate | >50% of relevant queries |
| Social engagement per post | Track clicks, shares |

---

## 19. Personalized Pickleball Feed — "My Portal" (HUGE)

### Vision
**Build your own custom pickleball news feed.** Every player gets a feed tailored to their interests — their local tournaments, their favorite paddles, their preferred brands, their skill level, their pro players, their tours. Delivered by email (weekly digest) AND available as a live feed on the site.

Nobody in pickleball does this. The Dink sends the same newsletter to everyone. We send YOU yours.

### How It Works

```
┌─────────────────────────────────────────────────────────────┐
│                    ONBOARDING (2 minutes)                     │
│                                                              │
│  "Build Your Feed" wizard:                                   │
│  1. Where do you play? (state/city/zip)                      │
│  2. What's your skill level? (2.0-5.0+ slider)              │
│  3. Pick your brands (logo grid: Selkirk, JOOLA, etc.)      │
│  4. Pick your tours (PPA, MLP, APP, local)                  │
│  5. Follow pro players (top 20 suggested, search for more)  │
│  6. What do you care about? (gear reviews, strategy,         │
│     deals, tournaments, news, drama)                         │
│  7. Email frequency: daily / weekly / just the big stuff     │
│                                                              │
│  → Creates user profile with preferences                     │
│  → Immediately shows personalized feed                       │
└─────────────────────────────────────────────────────────────┘
```

### Feed Sources (all already built or building)

| Source | Personalization |
|--------|----------------|
| Tournament finder | Tournaments within X miles of your zip, matching your skill level |
| News RSS | Filtered by your followed brands, players, tours |
| Price alerts | Deals on brands you follow, paddles you've favorited |
| New paddle releases | From brands you follow |
| Paddle reviews | For your skill level, from brands you care about |
| Pro player news | Players you follow — results, transfers, drama |
| Reddit/X buzz | Filtered by your interests |
| Strategy content | Matched to your skill level |
| Local scene | Courts, clubs, leagues near your zip |

### Delivery

**On-site (`/my-feed/` or `/dashboard/`):**
- Real-time personalized feed (like a Twitter timeline but pickleball)
- Card-based layout — each item is a card (tournament, deal, article, news)
- "For You" algorithm based on preferences + engagement
- Infinite scroll

**Email (Beehiiv):**
- **Daily digest** — top 5 items from your feed
- **Weekly roundup** — comprehensive, beautifully formatted
- **Breaking only** — price drops on favorites, tournament registration opens nearby, big news
- Beehiiv segments based on user preferences stored in Supabase
- Each email links back to the site (drives traffic)

**Push notifications (future mobile app):**
- Tournament near you just opened registration
- Paddle you're watching just dropped in price
- Player you follow just won

### Database

```sql
CREATE TABLE user_feed_preferences (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES profiles(id) UNIQUE,
  -- Location
  zip_code text,
  city text,
  state text,
  lat numeric,
  lng numeric,
  radius_miles int DEFAULT 50,
  -- Skill
  skill_level numeric(3,1), -- 2.0, 3.5, 4.5, etc.
  -- Follows
  followed_brands text[], -- ['selkirk', 'joola', 'crbn']
  followed_players text[], -- player slugs
  followed_tours text[], -- ['ppa', 'mlp', 'app']
  -- Interests
  interests text[], -- ['gear', 'strategy', 'deals', 'tournaments', 'news', 'drama']
  -- Email prefs
  email_frequency text DEFAULT 'weekly', -- daily, weekly, breaking
  email_enabled boolean DEFAULT true,
  -- Meta
  onboarding_completed boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Feed items (pre-computed for each user)
CREATE TABLE user_feed_items (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES profiles(id),
  item_type text, -- tournament, deal, article, news, paddle_release, player_update
  item_id text, -- reference to source item
  title text,
  summary text,
  url text,
  image_url text,
  relevance_score numeric(5,2), -- how relevant to this user
  seen boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);
CREATE INDEX idx_feed_user_created ON user_feed_items(user_id, created_at DESC);
```

### Feed Generation Cron

```
Every 2 hours:
  For each user with feed preferences:
    1. Query tournaments within radius_miles of their zip
    2. Query news_items matching their followed brands/players/tours
    3. Query paddle_prices for deals on followed brands
    4. Query new content matching their interests + skill level
    5. Score each item by relevance (location match, interest match, recency)
    6. Insert into user_feed_items (skip duplicates)
    7. If email_frequency = 'daily' and items > 3: queue daily digest
    8. If item is "breaking" (big price drop, nearby registration): instant email
```

### Email Templates (Beehiiv)

**Weekly digest structure:**
```
🏓 Your Weekly Pickleball Portal
   Personalized for [Name] in [City, ST]

📍 NEAR YOU
   3 tournaments within 50 miles this month
   [Tournament cards with dates + register links]

🏷️ DEALS ON YOUR BRANDS  
   Selkirk Power Air dropped 15% ($169 → $143)
   [Deal card with buy link]

📰 NEWS YOU CARE ABOUT
   [3-5 filtered news items]

🎯 FOR YOUR GAME (4.0 level)
   "5 Third Shot Drop Drills for Advanced Players"
   [Article card]

⭐ PLAYER WATCH
   Ben Johns wins PPA Houston — [recap link]
```

### Growth Mechanics

- **Viral onboarding:** "Build your feed" is shareable — "I just built my custom pickleball feed"
- **Progressive profiling:** Start with zip + skill, unlock more as they engage
- **Social proof:** "12,000 players have built their feed"
- **FOMO:** "Your weekly report is ready" email subject lines
- **Network effects:** "3 players in your area also follow Selkirk"

### Monetization Angle

- **Free tier:** Weekly digest, basic feed
- **Premium ($5-10/mo):** Daily digest, breaking alerts, exclusive deals, no ads
- **Brands pay for placement:** "Sponsored" items in relevant feeds ($CPM model)
- **Affiliate amplification:** Deals shown to people who ACTUALLY follow that brand = higher conversion

---

## 20. Universal Follow Button + Memes & GIFs Section

### Vision
**Every entity on the site is followable.** One click adds it to your Personal Portal feed. Brands, cities, tournaments, players, topics, memes — all followable. The site becomes a living, personalized pickleball universe.

### Universal Follow Button ("+ Follow" / "Following ✓")

Appears on EVERY entity across the site:

| Entity | Where button appears | Feed impact |
|--------|---------------------|-------------|
| Brand (Selkirk, JOOLA...) | Brand page header, paddle cards, mega menu | New releases, deals, reviews for that brand |
| City/Location | Tournament map, travel page cards | Tournaments near that city, local news, new courts |
| Tournament | Tournament detail page, calendar cards | Registration updates, results, recaps |
| Player | Player profile, rankings table rows | Match results, transfers, news mentions |
| Topic (strategy, rules...) | Blog category pages, article tags | New articles on that topic |
| Paddle | Paddle detail page, catalog cards | Price drops, new reviews (extends existing favorite) |
| Tour (PPA, MLP, APP) | Rankings page, tournament badges | Tour news, schedule, results |
| Meme/GIF tag | Meme section category tags | New memes in that category |

**UX:**
```
┌──────────────────────────────────────────┐
│  SELKIRK                    [+ Follow]   │
│  Premium Performance Paddles             │
│  47 paddles · Avg Portal Score: 88       │
└──────────────────────────────────────────┘

After click:

┌──────────────────────────────────────────┐
│  SELKIRK                  [Following ✓]  │
│  Premium Performance Paddles             │
│  47 paddles · Avg Portal Score: 88       │
│  ┌─ Configure alerts ──────────────┐     │
│  │ ☑ Price drops                   │     │
│  │ ☑ New paddle releases           │     │
│  │ ☑ Reviews & articles            │     │
│  │ ☐ Social media mentions         │     │
│  │ Notify: Weekly digest / Instant │     │
│  └─────────────────────────────────┘     │
└──────────────────────────────────────────┘
```

- Green outline button → solid green when following
- Click following → dropdown with alert preferences
- Works without account (stores in localStorage) but prompts signup to sync across devices + get email
- Existing "favorite" heart on paddles merges into this system

### Database

```sql
-- Replaces/extends user_favorites
CREATE TABLE user_follows (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES profiles(id),
  entity_type text NOT NULL, -- brand, city, tournament, player, topic, paddle, tour, meme_tag
  entity_id text NOT NULL, -- slug or id of the entity
  entity_name text, -- display name for quick rendering
  alert_prefs jsonb DEFAULT '{"price_drops":true,"new_content":true,"news":true}',
  notify_frequency text DEFAULT 'weekly', -- instant, daily, weekly
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, entity_type, entity_id)
);
CREATE INDEX idx_follows_user ON user_follows(user_id);
CREATE INDEX idx_follows_entity ON user_follows(entity_type, entity_id);
```

### Memes & GIFs Section (`/memes/`)

**Why:** Pickleball culture is HUGE on memes. Reddit r/Pickleball, Facebook groups, Instagram — memes drive engagement. Nobody has a curated pickleball meme hub.

**Features:**
- `/memes/` — Masonry grid of pickleball memes and GIFs
- Upload your own (moderated queue)
- Categories: Kitchen violations, Bangers vs Dinkers, Partner drama, Rec vs tournament, Pro player memes, Rule arguments, "One more game", Beginner fails
- Voting: upvote/downvote (like Reddit)
- Share buttons (copy link, share to X/Instagram/WhatsApp)
- "Meme of the Week" in newsletter
- GIF search integration (Tenor/Giphy API for pickleball GIFs)
- Follow specific meme categories → shows in your feed

```sql
CREATE TABLE memes (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title text,
  slug text UNIQUE NOT NULL,
  image_url text NOT NULL, -- Cloudinary
  category text, -- kitchen, bangers, partner, rec-vs-tourney, pro, rules, one-more-game, beginner
  tags text[],
  submitted_by uuid REFERENCES profiles(id),
  status text DEFAULT 'pending', -- pending, approved, rejected
  upvotes int DEFAULT 0,
  downvotes int DEFAULT 0,
  views int DEFAULT 0,
  featured boolean DEFAULT false, -- meme of the week
  created_at timestamptz DEFAULT now()
);

CREATE TABLE meme_votes (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  meme_id uuid REFERENCES memes(id),
  user_id uuid REFERENCES profiles(id),
  vote int NOT NULL, -- 1 or -1
  created_at timestamptz DEFAULT now(),
  UNIQUE(meme_id, user_id)
);
```

### Personal Portal Newsletter Enhancement

The follow system feeds directly into Section 19 (My Portal):

```
🏓 Your Personal Portal — Week of Feb 24

📍 DENVER (you follow this city)
   2 new tournaments within 50 miles
   New courts opening: Apex Center Pickleball Expansion

🏷️ SELKIRK (you follow this brand)  
   Power Air Invikta dropped 20% — $159 → $127
   New release: Selkirk Vanguard 3.0 announced

👤 BEN JOHNS (you follow this player)
   Won PPA Desert Classic singles
   Switching to new paddle model (rumored)

🔥 TOP MEMES THIS WEEK
   "When your partner says 'I got it' and definitely does not got it"
   [image] — 847 upvotes

📰 STRATEGY (you follow this topic)
   "Advanced Third Shot Drop Patterns for 4.0+ Players"
   
🏆 MLP (you follow this tour)
   Week 3 results: Florida Smash takes the crown
```

### Follow Counts as Social Proof

Display follower counts on entities:
- "1,247 players follow Selkirk"
- "892 players follow Ben Johns"  
- "324 players follow tournaments in Denver"

This creates FOMO and validates the platform's community.

---

## 21. AI Feature Indicators (Bot Icons)

### Rule
Any feature powered by AI/algorithms gets a small `Bot` icon (Lucide) next to it. This signals to users "this is smart/AI-powered" without being obnoxious.

### Where applied:
- **Paddle Finder Quiz** — Bot icon on navbar CTA button + homepage hero button
- **Portal Score** — Bot icon next to "Portal Score" label on every paddle card, paddle detail page, and the Portal Score explainer page
- **Portal Score explainer** — Badge reads "AI-Powered Rating System" with Bot icon
- **Portal Score tooltip** (hover on cards) — Bot icon before "Portal Score" text

### Future applications:
- Content Pipeline AI-generated briefs
- "For You" feed algorithm
- GEO-optimized articles (AI-enhanced badge)
- Price prediction ("AI predicts this paddle will drop in price")
- "Similar paddles" recommendations
- Auto-generated tournament recaps
- Smart search suggestions

---

## 22. Brand Voice & Guidelines

**See `BRAND.md` for the full canonical brand guidelines document.**

### Core Brand Updates (Feb 20, 2026)

**Tagline:** "Your Window Into the World of Pickleball"

**Brand Concept:** The "window" metaphor — Pickleball Portal is the lens through which players, businesses, and thought leaders see the sport. One destination, every angle.

**Positioning:** We were ahead of our time in 2017. We're reinventing the game again with AI. From paddle reviews to court expansion, tournaments to the business of pickleball — we're the authoritative go-to for the sport's greatest insights.

**Key Narrative Beats:**
1. Founded 2017 — before pickleball went mainstream
2. Independent — no brand owns us
3. AI-pioneering — Portal Score, personalized feeds, real-time data
4. Comprehensive — one-stop window for consumers, businesses, thought leaders
5. Constantly reinventing — ahead of the curve then, deploying AI now

**Files updated with new brand voice:**
- `src/app/page.tsx` — Homepage hero headline + description
- `src/app/about/page.tsx` — About hero + founder story + FAQ
- `src/components/brands/hero.tsx` — Brands page hero
- `src/components/consumer-footer.tsx` — Footer tagline
- `public/llms.txt` — AI crawler description

**Logo revision:** Pending Recraft redesign (see Recraft prompt in BRAND.md notes)

---

## 23. What's New (Feb 20, 2026)

### Features Shipped Since Feb 18

19 new pages built in overnight build — none existed 48 hours ago:

| Feature | Route | What It Does |
|---------|-------|-------------|
| News Hub | `/news` | RSS-aggregated pickleball news from 6+ sources |
| Rankings | `/rankings` | Pro player rankings — singles, doubles, mixed |
| Player Profiles | `/players/[slug]` | Baseball-card style player pages |
| Memes | `/memes` | Community pickleball meme hub with voting |
| My Feed | `/my-feed` | Personalized feed (auth-gated) |
| Courts | `/courts` | Court finder with map + search |
| Buzz | `/buzz` | Trending topics and social sentiment |
| Legality Checker | `/legality` | USA Pickleball approved/banned paddle lookup |
| Contributor Portal | `/contributor` | Writer portal with pay scale and article dashboard |
| Live Events | `/live` | Live/upcoming/recent tournament tracker |
| Intelligence | `/intelligence` | Brand analytics dashboard (B2B) |
| MLP Hub | `/mlp` | Major League Pickleball teams and rosters |
| Portal Score | `/portal-score` | Proprietary rating system explainer |
| Insider Guide | `/insider-guide` | TV, YouTube, podcasts, newsletters directory |
| Padel | `/padel` | Pickleball vs padel comparison + facilities |
| Travel | `/travel` | Pickleball destinations, resorts, camps |
| Dashboard | `/dashboard` | User dashboard with favorites, bag, check-ins |
| Following | `/following` | Manage followed brands, players, topics |
| Search | `/search` | Global site search |

### Comprehensive Test Suite Added

- 3 new test files: `new-features.spec.ts`, `new-features-interactive.spec.ts`, `auth.spec.ts`
- SEO tests expanded from 5 pages to 21 pages
- Mobile responsiveness tests for all 17 new public pages
- Auth flow UI tests (sign-in, sign-up, validation, OAuth, gated pages)
- Interactive feature tests (search, filtering, tab switching, voting)

---

## 24. Navigation Restructure (PLANNED)

### Problem
Current nav grew organically as features were added. Too many items in "Tools" dropdown (12 items). Paddles and Gear are separate when they should be unified. Blog and News are separate. Tournaments buried in Tools dropdown. No account/auth presence in header.

### New Navigation Architecture

```
┌──────────────────────────────────────────────────────────────────────────┐
│ [Logo]  GEAR ▾  TOURNAMENTS ▾  NEWS ▾  TOOLS ▾  [Search] [Avatar/Login]│
└──────────────────────────────────────────────────────────────────────────┘
```

**1. GEAR (mega menu) — All equipment in one place**
```
┌───────────────────────────────────────────────────────────────────┐
│  BROWSE                          SHOP BY BRAND                    │
│  ├── All Paddles                 5-column alphabetical grid       │
│  ├── Deals & Price Tracker       (Babolat through Wilson)         │
│  ├── Legality Checker                                             │
│  ├── Padel Rackets                                                │
│  │                               GUIDES                          │
│  │                               ├── Buyer's Guide               │
│  │                               ├── Best Pickleball Shoes        │
│  │                               ├── All Gear Articles            │
│  │                               └── Insider Guide                │
└───────────────────────────────────────────────────────────────────┘
```

**2. TOURNAMENTS (dropdown) — Main nav item**
```
┌─────────────────────────────┐
│  Tournament Finder           │
│  Live Events                 │
│  Court Finder                │
│  Travel & Getaways           │
└─────────────────────────────┘
```

**3. NEWS (dropdown) — Content hub**
```
┌─────────────────────────────┐
│  News Hub                    │
│  Blog                        │
│  Buzz / Trending             │
│  Memes                       │
└─────────────────────────────┘
```

**4. TOOLS (dropdown) — Interactive features**
```
┌─────────────────────────────┐
│  Paddle Finder Quiz    [AI] │
│  Portal Score          [AI] │
│  Player Rankings             │
│  MLP Hub                     │
│  Intelligence Dashboard      │
│  Compare Paddles             │
└─────────────────────────────┘
```

**5. Right side: Search + Account Avatar**
```
┌──────────────────────────────────────┐
│  [Search icon]  [User avatar / "Sign In" button]  │
│                                      │
│  Avatar dropdown (authenticated):    │
│  ├── My Feed                         │
│  ├── My Dashboard                    │
│  ├── Following                       │
│  ├── Favorites                       │
│  ├── Settings                        │
│  └── Sign Out                        │
│                                      │
│  Sign In button (unauthenticated):   │
│  Opens auth modal                    │
└──────────────────────────────────────┘
```

**6. About → Footer only (not primary nav)**
- Move About to footer "Company" column
- Contributor portal link in footer "Community" column

### Mobile Nav Changes
```
Hamburger → Sheet:
  My Feed (if authenticated)
  ─────────
  GEAR
    All Paddles
    Deals
    Legality
    Buyer's Guide
  ─────────
  TOURNAMENTS
    Find Tournaments
    Live Events
    Court Finder
    Travel
  ─────────
  NEWS
    News Hub
    Blog
    Buzz
    Memes
  ─────────
  TOOLS
    Paddle Finder [AI]
    Portal Score [AI]
    Rankings
    MLP Hub
    Intelligence
  ─────────
  [Sign In / Account]
```

### Files to Modify
- `src/components/consumer-nav.tsx` — Complete restructure
- `src/components/consumer-footer.tsx` — Add About, Contributor links
- Tests: Update `tests/navigation.spec.ts` NAV_LINKS array

---

## 25. Comprehensive News Intelligence System (PLANNED)

### Vision
**Every time pickleball is mentioned online — anywhere — we know about it.** Our news system should be the most comprehensive pickleball monitoring engine on the internet. Users come to us because they'll never miss a story, whether it's a pro tour recap on ESPN, a viral Reddit thread, a 60 Minutes feature, a New York Times think-piece, a Substack deep-dive, or an Instagram Reel from a pro player.

### Current State
- 6 RSS feeds in `scripts/fetch-news.js`: The Dink, USA Pickleball, Pickleball Magazine, Reddit, YouTube (placeholder), PPA/APP blogs
- Fetches every 2 hours → inserts into `news_items` table

### Tier 1: Verified Pickleball RSS Feeds (Direct Sources)

These feeds are verified active and return article content:

| # | Source | Feed URL | Category | Notes |
|---|--------|----------|----------|-------|
| 1 | **The Dink Pickleball** | `https://www.thedinkpickleball.com/feed` | news, gear, pro | Most popular PB media company |
| 2 | **USA Pickleball** | `https://usapickleball.org/feed` | rules, tournaments, official | National governing body |
| 3 | **Major League Pickleball** | `https://www.majorleaguepickleball.co/feed` | pro_tours, MLP | Team league updates |
| 4 | **PickleballMAX** | `https://pickleballmax.com/feed` | strategy, rules, growth | Respected improvement blog |
| 5 | **Crazy Pickleball Lady** | `https://crazypickleballlady.com/feed` | community, tips | Popular community blog |
| 6 | **Pickleball Canada** | `https://pickleballcanada.org/feed` | international, official | Canadian governing body |

### Tier 2: Additional Pickleball-Specific Feeds

| # | Source | Feed URL (verify) | Category |
|---|--------|-------------------|----------|
| 7 | Pickler | `https://pickler.com/blog/feed` | strategy, gear |
| 8 | The Kitchen Pickleball | `https://thekitchenpickleball.com/feed` | news, opinion |
| 9 | Selkirk Blog | `https://selkirk.com/blogs/news.atom` | brand, gear |
| 10 | JOOLA Blog | `https://joolausa.com/blogs/news.atom` | brand, gear |
| 11 | r/Pickleball (Reddit) | `https://www.reddit.com/r/pickleball/hot.json` | community |
| 12 | r/PickleballGear | `https://www.reddit.com/r/pickleballgear/hot.json` | gear |

### Tier 3: Google News Aggregation (Mainstream + Generalist Coverage)

**This is the key to catching ESPN, NYT, WSJ, The Atlantic, Barstool, 60 Minutes, etc.**

Google News provides RSS feeds for any keyword search. This is how we capture every mainstream mention:

| Feed | URL | What It Catches |
|------|-----|-----------------|
| **General pickleball** | `https://news.google.com/rss/search?q=pickleball` | All mainstream coverage — ESPN, NYT, WSJ, local news |
| **Tournament results** | `https://news.google.com/rss/search?q=pickleball+tournament` | Tournament coverage from all outlets |
| **Gear reviews** | `https://news.google.com/rss/search?q=pickleball+paddle+review` | Reviews from tech, sports, lifestyle sites |
| **Pickleball growth** | `https://news.google.com/rss/search?q=pickleball+growth+popularity` | Trend/business stories (WSJ, Forbes, etc.) |
| **MLP coverage** | `https://news.google.com/rss/search?q=%22major+league+pickleball%22` | MLP from all outlets |
| **PPA coverage** | `https://news.google.com/rss/search?q=%22PPA+tour%22+pickleball` | PPA from all outlets |
| **Pickleball controversy** | `https://news.google.com/rss/search?q=pickleball+controversy+OR+banned` | Noise complaints, bans, HOA fights |
| **Pickleball TV/documentary** | `https://news.google.com/rss/search?q=pickleball+TV+OR+documentary+OR+%2260+minutes%22` | TV features, documentaries, 60 Minutes |
| **Pickleball injuries** | `https://news.google.com/rss/search?q=pickleball+injuries+OR+health` | Health/medical coverage |
| **Pickleball business** | `https://news.google.com/rss/search?q=pickleball+business+OR+investment+OR+valuation` | Business/investment stories |

### Tier 4: Google Alerts (Real-Time Monitoring)

Set up Google Alerts with RSS delivery (not email) for hyper-specific monitoring:

| Alert Query | Purpose |
|-------------|---------|
| `"pickleball" site:espn.com` | ESPN coverage |
| `"pickleball" site:nytimes.com` | New York Times |
| `"pickleball" site:wsj.com` | Wall Street Journal |
| `"pickleball" site:theatlantic.com` | The Atlantic |
| `"pickleball" site:barstoolsports.com` | Barstool Sports |
| `"pickleball portal"` | Brand mentions |
| `"pickleball" "60 minutes" OR "documentary"` | TV/documentary features |
| `"pickleball" "netflix" OR "hulu" OR "amazon prime"` | Streaming content |

Setup: Google Alerts → Delivery: RSS feed → Parse in cron

### Tier 5: Social Media Monitoring

| Platform | Method | What We Track |
|----------|--------|--------------|
| **Reddit** | Reddit JSON API (`/r/pickleball/hot.json`) | Hot threads, trending discussions |
| **X/Twitter** | Twitter API v2 (search recent) | Trending pickleball tweets, pro player posts |
| **Instagram** | Instagram Basic Display API or hashtag monitoring | Pro player posts, viral content |
| **YouTube** | YouTube RSS (`https://www.youtube.com/feeds/videos.xml?channel_id=CHANNEL_ID`) | New videos from PB channels |
| **Substack** | RSS feeds of pickleball Substacks | Long-form analysis, opinion |
| **Medium** | RSS via `medium.com/feed/tag/pickleball` | Community writing |
| **TikTok** | Third-party monitoring (no native RSS) | Viral PB content |

**YouTube Channels to Monitor:**

| Channel | Category |
|---------|----------|
| PPA Tour | Pro matches, highlights |
| The Kitchen | News, opinion, strategy |
| Tyson McGuffin | Pro player content |
| Ben Johns | Pro player content |
| Zane Navratil | Pro player content |
| Pickleball Channel | Instructional |
| Briones Pickleball | Strategy, drills |
| John Cincotz | Reviews, strategy |
| Pickleball Studio | Community |

### Updated News Pipeline Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│              PICKLEBALL NEWS INTELLIGENCE ENGINE                 │
│                    (runs every 2 hours)                          │
│                                                                  │
│  LAYER 1: Direct PB Sources (6 verified RSS feeds)              │
│  ├── The Dink, USA Pickleball, MLP, PickleballMAX,              │
│  │   Crazy Pickleball Lady, Pickleball Canada                   │
│  │                                                              │
│  LAYER 2: Additional PB RSS (6+ feeds)                          │
│  ├── Pickler, The Kitchen, Selkirk, JOOLA, Reddit x2            │
│  │                                                              │
│  LAYER 3: Google News RSS (10 keyword feeds)                    │
│  ├── Catches ESPN, NYT, WSJ, The Atlantic, Barstool, etc.       │
│  │                                                              │
│  LAYER 4: Google Alerts RSS (8+ site-specific alerts)           │
│  ├── Targeted monitoring of specific outlets + brand mentions    │
│  │                                                              │
│  LAYER 5: Social (Reddit, YouTube, Medium, Substack)            │
│  ├── Community discussions, video content, long-form analysis    │
│                                                                  │
│  Total: 40+ feed sources                                        │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│              PROCESSING PIPELINE                                 │
│                                                                  │
│  1. Parse all feeds (rss-parser for XML, JSON for Reddit/YT)    │
│  2. Normalize: title, url, source, summary, image, published_at │
│  3. Dedup by URL (UPSERT on url column)                         │
│  4. Extract source publisher name (especially from Google News)  │
│  5. AI categorize: pro_tours, gear, community, strategy,         │
│     business, health, controversy, entertainment, international │
│  6. AI relevance score (1-100): filter out < 30                 │
│  7. AI extract summary if missing (200 chars)                   │
│  8. Detect mainstream outlet → flag as "trending" / "big story"  │
│  9. UPSERT into news_items table                                │
│  10. If "big story" → trigger push to My Feed subscribers       │
└─────────────────────────────────────────────────────────────────┘
```

### New `news_items` Columns

```sql
ALTER TABLE news_items ADD COLUMN source_type text; -- rss, google_news, google_alert, reddit, youtube, social
ALTER TABLE news_items ADD COLUMN source_outlet text; -- "ESPN", "New York Times", "Reddit", etc.
ALTER TABLE news_items ADD COLUMN relevance_score int; -- AI-scored 1-100
ALTER TABLE news_items ADD COLUMN is_mainstream boolean DEFAULT false; -- from major outlet
ALTER TABLE news_items ADD COLUMN is_trending boolean DEFAULT false; -- flagged as big story
ALTER TABLE news_items ADD COLUMN media_type text; -- article, video, discussion, social_post
```

### News Hub UI Enhancements

The `/news` page should surface this richness:

```
┌──────────────────────────────────────────────────────────────────┐
│  [All] [Pro Tours] [Gear] [Community] [Business] [Entertainment]│
│                                                                  │
│  ┌─ TRENDING ────────────────────────────────────────────────┐  │
│  │ 🔥 ESPN: "Pickleball's Next Chapter" — 2h ago            │  │
│  │ 🔥 NYT: "Why Pickleball Courts Are..." — 5h ago          │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌─ LATEST ──────────────────────────────────────────────────┐  │
│  │ The Dink: "PPA Tour Announces 2026 Schedule" — 1h ago     │  │
│  │ PickleballMAX: "5 Drills to Improve..." — 3h ago          │  │
│  │ Reddit: "Hot take: elongated paddles are..." — 4h ago      │  │
│  │ YouTube: "Tyson McGuffin Reviews the..." — 6h ago          │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                  │
│  Source: 40+ feeds · Updated every 2 hours                       │
└──────────────────────────────────────────────────────────────────┘
```

### Files to Create/Modify
- `scripts/fetch-news.js` — Add all new RSS feed URLs, Google News RSS parsing, publisher extraction
- New: `scripts/news-sources.json` — Central registry of all feed URLs and metadata
- Supabase: Run ALTER TABLE for new columns
- `src/app/news/` — UI enhancements for trending section, source badges, category filters

---

## 26. User Onboarding Walkthrough (PLANNED)

### Vision
A guided tour for first-time visitors — like Intercom/Appcues product tours that SaaS products use. Highlights key features, drives engagement with interactive elements, and funnels users toward signup.

### Walkthrough Flow (First Visit)

```
Step 1: Welcome Banner (top of page, dismissible)
┌──────────────────────────────────────────────────────────────────┐
│ Welcome to Pickleball Portal — the independent pickleball        │
│ authority since 2017. Here's what's new:                         │
│                                                                  │
│ [Take a Tour]  [Browse Paddles]  [Skip]                          │
└──────────────────────────────────────────────────────────────────┘

Step 2: Tooltip → Gear Menu
"Browse 500+ paddles with real-time prices from 19 retailers."

Step 3: Tooltip → Tournament Finder
"Find tournaments near you. Filter by skill level, format, and more."

Step 4: Tooltip → News Hub
"Stay current with aggregated news from 20+ pickleball sources."

Step 5: Tooltip → Paddle Finder CTA
"Not sure which paddle? Our AI-powered quiz matches you in 60 seconds."

Step 6: Tooltip → Search
"Search everything — paddles, tournaments, articles, players."

Step 7: Tooltip → Sign In / Avatar
"Create a free account to save favorites, track prices, and get your personalized feed."

Step 8: Completion
┌──────────────────────────────────────────────────────────────────┐
│ You're all set! Create your free account to unlock:              │
│ ✓ Personalized feed     ✓ Price alerts                          │
│ ✓ Saved favorites       ✓ Tournament check-ins                  │
│                                                                  │
│ [Create Free Account]  [Maybe Later]                             │
└──────────────────────────────────────────────────────────────────┘
```

### Implementation
- Use `localStorage` flag `pp_tour_completed` to show only once
- Lightweight tooltip component (no heavy library — build with Radix Popover)
- Keyboard accessible (Escape to dismiss, Tab to navigate)
- Mobile: simplified 4-step version (Gear, Tournaments, News, Sign Up)
- Analytics: track step completion rates via GA4 events

### "What's New" Modal (Returning Users)
After major updates, show a "What's New" modal:
```
┌──────────────────────────────────────────────────────────────────┐
│ What's New on Pickleball Portal                                  │
│                                                                  │
│ ★ News Hub — Real-time pickleball news from 20+ sources          │
│ ★ Player Rankings — Pro player stats and profiles                │
│ ★ Court Finder — Find courts near you with interactive map       │
│ ★ Legality Checker — Instant paddle approval status lookup       │
│ ★ Live Events — Track tournaments as they happen                 │
│ ★ MLP Hub — Major League Pickleball teams and rosters            │
│                                                                  │
│ [Explore New Features]  [Dismiss]                                │
└──────────────────────────────────────────────────────────────────┘
```
- Show based on `localStorage` version flag (e.g., `pp_whats_new_v2`)
- Link each feature to its page
- Track clicks via GA4

---

## 27. Signup & Engagement Strategy (PLANNED)

### Goal
Drive newsletter signups and account creation through strategic placement, social proof, and progressive gating.

### Newsletter Signup Touchpoints

| Location | Trigger | CTA |
|----------|---------|-----|
| Homepage hero | Immediate | "Get the Weekly Portal" |
| Article bottom | After reading | "Enjoyed this? Get weekly insights." |
| Article interstitial | Mid-article (after 3rd section) | Inline signup form |
| Exit intent popup | Mouse leaves viewport | "Before you go — get the best deals in your inbox" |
| Paddle detail page | After viewing price | "Get notified when this drops in price" (price alert → email capture) |
| Tournament detail | After viewing | "Get alerts for tournaments near you" |
| Footer | Always visible | Standard newsletter form |
| Paddle Finder results | After quiz completion | "Save your results — create a free account" |
| Onboarding tour (Step 8) | Tour completion | "Create your free account" |
| My Feed (unauthenticated) | Page visit | "Sign up to build your personalized feed" |

### Account Creation Incentives

| Incentive | Details |
|-----------|---------|
| Personalized Feed | "Build your custom pickleball news feed" |
| Price Alerts | "Get notified when your paddle drops in price" |
| Favorites | "Save paddles, tournaments, and players" |
| Tournament Check-ins | "RSVP to tournaments and see who's going" |
| Meme Voting | "Vote on memes and submit your own" |
| Follow System | "Follow brands, players, and topics" |
| Contributor Portal | "Write for us and earn $50-200 per article" |

### Progressive Gating Strategy
```
Level 0 (anonymous):    Browse everything, read articles, compare paddles
Level 1 (email only):   Newsletter, price alerts (email capture only)
Level 2 (account):      Favorites, follows, meme voting, tournament check-ins
Level 3 (profile):      My Feed, contributor portal, dashboard
```

Don't gate content. Gate personalization features.

---

## 28. Micro-Animations & Liveliness Strategy (PLANNED)

### Vision
Subtle motion cues that draw attention to interactive elements without being obnoxious. The goal is to make the site feel alive and guide users toward engagement actions.

### Animation Inventory

| Element | Animation | Trigger | CSS/Library |
|---------|-----------|---------|-------------|
| **Favorite Heart** | Pulse/throb (scale 1→1.15→1, 0.8s) | On hover, on first page load if not yet favorited | CSS `@keyframes pulse` |
| **Follow Button** | Subtle glow border pulse (green) | On hover, idle throb every 5s if not following | CSS `box-shadow` animation |
| **"New" Badge** | Gentle pulse with green glow | Continuous (items added in last 7 days) | CSS `@keyframes glow` |
| **Filter chips** | Entrance slide-up + fade-in | Page load, staggered 50ms each | CSS `@keyframes slideUp` |
| **Map pins** | Bounce on appear | Initial map load | CSS `@keyframes bounce` |
| **Score badges** | Count-up from 0 | When element enters viewport | `Intersection Observer` + JS counter |
| **Stat cards** | Number count-up | When enters viewport | `Intersection Observer` + JS counter |
| **CTA buttons** | Shimmer sweep effect | On hover | CSS `background-position` animation |
| **Newsletter form** | Subtle border glow | After 10s on page (attention draw) | CSS `@keyframes borderGlow` |
| **Paddle cards** | Slight lift + shadow on hover | Hover | CSS `transform: translateY(-2px)` + `box-shadow` |
| **Tournament cards** | "Live" indicator pulse (red dot) | Continuous for live tournaments | CSS `@keyframes livePulse` |
| **Search icon** | Gentle bounce once | After 3s idle on page | CSS `@keyframes bounce` one-shot |
| **Scroll progress** | Green bar at top of articles | Scroll position | JS scroll listener |
| **FAQ accordions** | Smooth height transition | Open/close | CSS `max-height` transition |
| **Brand logos** | Grayscale → color on hover | Hover | CSS `filter: grayscale(1) → grayscale(0)` |
| **Compare bar** | Slide up from bottom | When 1+ paddles selected | CSS `transform: translateY` |
| **Price drop arrow** | Bounce down arrow icon | On price cards showing drops | CSS `@keyframes bounceDown` |

### Rules
1. **No jarring animations** — everything is subtle, 200-800ms duration
2. **Respect `prefers-reduced-motion`** — disable all animations for accessibility
3. **No third-party animation libraries** — pure CSS + Intersection Observer
4. **Performance** — use `transform` and `opacity` only (GPU-accelerated)
5. **Don't animate text** — only borders, shadows, transforms, opacity
6. **Idle animations** fire max once then stop (no infinite loops except "Live" indicator)

## 29. Authentication & User Accounts

### Stack
- **Supabase Auth** — handles all auth flows, session management, JWT tokens
- **Google OAuth** — primary sign-in method (one-click, lowest friction)
- **Magic Link email** — fallback for users without Google accounts
- **Provider:** Google Cloud project `pickleball-portal-488017` under tom@pickleballportal.com

### Google OAuth Configuration (LIVE)
| Setting | Value |
|---------|-------|
| Client ID | `790647886980-2gsd36m0en1da002jjl1kccquupb90qs.apps.googleusercontent.com` |
| Redirect URI | `https://cztfwumwvtiwsabdilxd.supabase.co/auth/v1/callback` |
| Authorized JS Origin | `https://pickleballportal.com` |
| Supabase Google Provider | **Enabled** |
| OAuth Audience | Testing mode (publish to production before launch) |

### Auth UX Requirements
1. **"Sign in with Google" button** — prominent on nav (desktop: top-right; mobile: in Sheet menu)
2. **Progressive gating** — browsing is always free; auth required for: favorites, follows, price alerts, My Portal feed, paddle reviews, comments
3. **No auth wall on content** — articles, paddle pages, tournament listings, news are NEVER gated
4. **Post-login redirect** — user returns to the exact page they were on
5. **User profile** — auto-populated from Google (name, email, avatar); editable display name
6. **Supabase `profiles` table** — already exists; stores display_name, avatar_url, preferences
7. **AuthProvider** — already in root layout (`src/app/layout.tsx`); uses `@supabase/ssr` for server+client auth

### Auth Flow
```
User clicks "Sign in with Google"
  → Supabase signInWithOAuth({ provider: 'google' })
  → Google consent screen
  → Redirect to Supabase callback
  → Supabase creates/updates user + profile
  → Redirect back to site_url with session cookie
  → AuthProvider picks up session, UI updates
```

### Environment Variables (Vercel)
| Var | Status |
|-----|--------|
| `NEXT_PUBLIC_SUPABASE_URL` | ✅ Set |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | ✅ Set |
| `SUPABASE_SERVICE_ROLE_KEY` | ✅ Set |
| `CRON_SECRET` | ✅ Set |
| `NEXT_PUBLIC_GA_MEASUREMENT_ID` | ✅ Set (G-J7Y27KM430) |

### Pre-Launch Checklist
- [ ] Publish OAuth consent screen (Testing → Production) in GCP Auth Platform > Audience
- [ ] Add `https://www.pickleballportal.com` to Authorized JS Origins (after DNS cutover)
- [ ] Update Supabase `site_url` from `http://localhost:3000` to `https://pickleballportal.com`
- [ ] Add `https://pickleballportal.com` to Supabase redirect allow-list

## 30. Meme Generator — Viral Content Engine (PRIORITY BUILD)

### Vision
A pickleball meme generator powered by Gemini image generation (Nano Banana Pro) that creates shareable, watermarked memes driving organic traffic back to the site. Users create → share on social → friends see "Made on Pickleball Portal" → visit → create their own. Infinite viral loop.

### User Flow
```
User visits /memes/create
  → Picks a template OR uploads their own photo from phone
  → Types a caption (top text / bottom text)
  → Nano Banana Pro generates the meme image via API
  → Preview with "Pickleball Portal" watermark (small, bottom-right)
  → One-tap share to Instagram, Facebook, X, iMessage, WhatsApp
  → Meme auto-posts to /memes/ gallery
  → Community votes (auth-gated)
  → "Meme of the Week" featured on homepage
```

### Templates (Seed Library — 20 starter templates)
Categories:
- **Kitchen Violations** — partner drama at the NVZ line
- **Rec Play Chronicles** — the 4.0 guy slamming at open play, showing up 30 min early for a court
- **Paddle Addiction** — "I don't need another paddle" (buys 6th paddle)
- **The Dink Life** — soft game superiority, dink rally patience
- **Tournament vs Rec** — two completely different sports
- **Partner Drama** — the look when your partner poaches and misses
- **Rule Arguments** — "was that in or out?" eternal debate
- **One More Game** — saying "last game" 5 games ago

Templates support: classic meme format (top/bottom text), Drake format, distracted boyfriend, expectation vs reality, POV, "Nobody:", side-by-side comparison

### Monetization
- **Sponsored templates** — "This meme powered by JOOLA" / "Today's Top Meme brought to you by Selkirk"
- **Brand watermarks** — sponsors get logo placement on templates they sponsor
- **Viral reach** — every shared meme = free brand impression for sponsor
- Pricing: $500/mo per brand for sponsored meme template category

### Technical Stack
- **Generation:** Nano Banana Pro (Gemini 3 Pro Image) via API route
- **Storage:** Cloudinary (auto-upload generated memes)
- **Database:** Supabase `memes` table (id, image_url, caption, template, author_id, category, votes, shares, sponsor_id, created_at)
- **Voting:** Auth-gated, one vote per user per meme
- **Sharing:** Web Share API (native share sheet on mobile) + fallback copy-link
- **Watermark:** Applied server-side before storage (sharp or canvas)
- **Rate limit:** 5 meme generations per user per day (prevent abuse)

### Seed Content (Day 1 — 20 memes)
Mark as "Staff Pick" or "Portal Original" — be transparent that we seeded the first batch. No fake engagement numbers.

### Database Schema
```sql
CREATE TABLE memes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  image_url TEXT NOT NULL,
  caption_top TEXT,
  caption_bottom TEXT,
  template TEXT,
  category TEXT NOT NULL,
  author_id UUID REFERENCES auth.users(id),
  author_name TEXT DEFAULT 'Anonymous',
  sponsor_id UUID,
  sponsor_name TEXT,
  votes INTEGER DEFAULT 0,
  shares INTEGER DEFAULT 0,
  status TEXT DEFAULT 'approved', -- approved, pending, rejected
  featured BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE meme_votes (
  user_id UUID REFERENCES auth.users(id),
  meme_id UUID REFERENCES memes(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, meme_id)
);
```

## 31. PWA (Progressive Web App)

### Why
- "Add to Home Screen" = app-like experience without App Store
- Camera access for meme maker photo uploads
- Push notifications for price alerts, tournament reminders, meme-of-the-week
- Offline browsing of cached content (articles, paddle data)
- Mobile-first audience needs mobile-first experience

### Implementation
- `public/manifest.json` — app name, icons, theme color, display: standalone
- Service worker via `next-pwa` or `serwist` — cache static assets + API responses
- App icons: 192x192 + 512x512 (green portal logo on white)
- Theme color: `#22c55e` (pickleball green)
- Prompt "Add to Home Screen" after 2nd visit

## 32. Court Crowd Factor (Google Places Integration)

### Vision
Show real-time "busy now" / "usually busy" data for pickleball courts using Google Places API popular times. Help players find the best time to play.

### Data Source
- Google Places API (New) — `currentOpeningHours`, popular times via Place Details
- `goplaces` CLI for batch lookups
- Store in `courts` or `pickleball_destinations` table: `crowd_level` (1-5), `best_times` JSON, `last_checked`

### UX
- Court detail pages: "🟢 Usually Quiet Now" / "🟡 Getting Busy" / "🔴 Peak Hours"
- "Best Time to Play" chart (bar graph by hour, like Google Maps)
- Tournament pages: nearby court crowd data for practice courts
- Filter: "Show me quiet courts near me right now"

### Cron
- Refresh crowd data every 4 hours for top 100 courts
- On-demand lookup for any court when user visits the page

## 33. Monetization Strategy (Pre-Brand-Subscriptions)

| Revenue Stream | Status | Est. Monthly |
|---|---|---|
| Amazon Associates (pickleball07a-20) | ✅ LIVE | TBD (need traffic) |
| JustPaddles/Refersion (rfsn=6471927.deebc4) | ✅ LIVE | TBD |
| Sponsored meme templates | PLANNED | $500/brand/mo |
| Newsletter sponsorships (Beehiiv ad network) | PLANNED | $200-500/issue |
| Promoted paddle badges in catalog | PLANNED | $300/brand/mo |
| Tournament sponsorship hub | PLANNED (PRD §18) | Commission-based |
| Premium features (crowd data, advanced alerts) | PLANNED | Freemium |

## 34. Legacy WordPress Comments (MIGRATED)

- **817 comments** pulled from WordPress REST API and stored in Supabase `wp_comments` table
- Threaded (parent_comment_id preserved)
- Matched to post slugs for display on corresponding Next.js articles
- Top posts: Selkirk Project 006 (127), UK Courts (84), Engage Pursuit Pro (62), Noise Problems (55)
- Display as "Legacy Comments" section on article pages — read-only, with original dates and author names
- New commenting system (auth-gated, Supabase-powered) to be built separately
