# PRD: Tournament Aggregator + User Account System
**Pickleball Portal — Product Requirements Document**
**Version:** 1.0 | **Date:** February 2026 | **Author:** Ace (PM)
**Status:** APPROVED FOR BUILD

---

## Table of Contents
1. [Problem Statement & Vision](#1-problem-statement--vision)
2. [Multi-Source Scraper Architecture](#2-multi-source-scraper-architecture)
3. [Tournament Director Validation System](#3-tournament-director-validation-system)
4. [User Account & Sticky Features Funnel](#4-user-account--sticky-features-funnel)
5. [Supabase Schema Changes](#5-supabase-schema-changes)
6. [Phased Build Plan](#6-phased-build-plan)
7. [Success Metrics](#7-success-metrics)

---

## 1. Problem Statement & Vision

### The Problem
Pickleball tournament information is catastrophically fragmented. A 4.0 player in Denver who wants to compete this spring must manually check pickleballtournaments.com, USA Pickleball's site, local Facebook groups, their club's email list, and 3 other sites — and will still miss half the events. When they do find a tournament, the data is often stale (entry fees updated on one site but not others), duplicated (same event on 5 platforms), or flat-out wrong.

Tournament directors have the inverse problem: they post to multiple platforms manually, field the same questions over and over, and have no single authoritative listing they can point to.

The market is owned by two players — Dundon's pickleballtournaments.com + pickleball.com duopoly — but neither has solved the *aggregation* problem. They're walled gardens, not utilities.

### The Opportunity
We are DR 43 with 566 linking domains. We rank for paddle content. We do NOT yet rank for tournament content — that's intentional, because we haven't built the data moat yet.

The gap is real and wide: **there is no canonical, multi-source tournament database in pickleball.** We can own that position in 12–18 months if we build the infrastructure now.

### Vision
**Pickleball Portal becomes the definitive tournament database for the sport** — the place where any player, at any skill level, in any geography, finds every tournament they're eligible for, with validated data, registration links, and personalized alerts.

Tournament directors actively contribute to our database because we send them leads. Brands sponsor events because we have the audience. Players create accounts because we help them compete.

This is the flywheel:
```
Better data → More player trust → More accounts → More engagement signals →
Better SEO → More tournament directors submitting directly →
Even better data
```

### Strategic Rationale
| Metric | Today | Target (12 mo) |
|--------|-------|----------------|
| Tournament listings | ~200 (scraped) | 5,000+ (verified) |
| Organic tournament pages | ~50 | 3,000+ |
| Registered users | ~0 | 25,000 |
| Email list (tournament segment) | ~0 | 50,000 |
| Monthly tournament page views | ~5K | 500K |

---

## 2. Multi-Source Scraper Architecture

### 2.1 Source Inventory & Priority

| # | Source | Type | Priority | Scrape Frequency | Notes |
|---|--------|------|----------|-----------------|-------|
| 1 | pickleballtournaments.com | HTML / JSON | P0 | Every 4h | Largest directory, Dundon-owned. Structured event data. |
| 2 | usapickleball.org | HTML | P0 | Every 12h | Official sanctioning body. Golden Ticket, TPS points. |
| 3 | ppatour.com | HTML / API | P0 | Every 24h | Pro tour. Schedule + results. |
| 4 | theapp.global | HTML | P0 | Every 24h | APP Tour. Pro + amateur. |
| 5 | pickleball.com | HTML | P1 | Every 24h | Dundon-owned. API access denied — scrape public pages only. |
| 6 | picklewave.com | HTML | P1 | Every 24h | Pro aggregator (PPA, APP, PPL, MLP). Cross-check source. |
| 7 | pickleballmax.com | HTML | P1 | Every 48h | Tournament calendar, news. |
| 8 | pickleballden.com | HTML | P2 | Every 48h | Clubs + tournaments. |
| 9 | usseniorpickleball.com | HTML | P2 | Every 72h | Senior-specific events. |
| 10 | usopenpickleball.com | HTML | P2 | Annual + change detect | Major annual event only. Monitor for schedule updates. |
| 11 | eventbrite.com | API | P2 | Every 48h | Query "pickleball tournament" with geo filters. |
| 12 | Facebook Groups | Meta API / partner | P3 | Weekly | Recreational/local events. Fragmented. Auth-gated. |

### 2.2 Data Model: Source Configuration

```
scrape_sources table stores per-source config:
- base_url, scrape_type (html/json/api)
- rate_limit_ms (ms between requests)
- cron_schedule (cron expression)
- auth_required, headers_json (custom UA, cookies)
- active boolean
- last_run_at, last_success_at
- failure_count, backoff_until
```

Each source has a defined **field mapping** (stored as `field_map JSONB`) that normalizes source-specific field names to our canonical schema. Example for pickleballtournaments.com:

```json
{
  "tournament_name": "name",
  "start_date": "date_start",
  "end_date": "date_end",
  "location_city": "city",
  "location_state": "state",
  "registration_fee": "entry_fee_min",
  "director": "director_name",
  "director_contact": "director_email"
}
```

### 2.3 Scraper Pipeline

```
[Scraper Worker]
     │
     ▼
[Fetch raw HTML/JSON] ──→ [Store in raw_tournament_scrapes]
     │
     ▼
[Parse → Normalize using field_map]
     │
     ▼
[Deduplication Engine]
  ├── Exact match: name + date + city
  ├── Fuzzy match: name similarity >85% + date within 2 days + same state
  └── Director match: same director email + date within 7 days
     │
     ▼
  [No match found]           [Match found]
     │                            │
     ▼                            ▼
[Create new canonical]    [Merge: update fields]
[tournament record]       [add source citation]
[confidence = low]        [recalculate confidence]
     │
     ▼
[Confidence Scoring Engine]
     │
     ▼
[Inconsistency Detection]
  └── If conflicts exist → queue for director outreach
```

### 2.4 Deduplication Logic

**Matching Algorithm (in order of precedence):**

1. **Hard match** — `source_id` exists in `tournament_source_citations` for this source → update, don't create
2. **Canonical match** — normalized `(name, date_start, city, state)` within fuzzy thresholds → merge
3. **Soft match** — Director email matches + date range overlaps → flag for manual review

**Fuzzy matching thresholds:**
- Name similarity: Levenshtein distance or trigram similarity ≥ 0.85 (pg_trgm)
- Date tolerance: ± 2 days (accounts for "weekend" events where start date varies by source)
- City: exact match after normalization (lowercase, strip punctuation)

**Conflict resolution priority (when sources disagree):**
1. Source submitted directly by tournament director (highest)
2. USA Pickleball official (official sanctioning body)
3. pickleballtournaments.com (highest volume, usually first-to-list)
4. PPA / APP official tour sites (for pro events)
5. All other sources (lower weight)

### 2.5 Confidence Scoring

Each canonical tournament field gets a per-field confidence score (0.0–1.0):

| Condition | Score |
|-----------|-------|
| Field confirmed by tournament director | 1.0 |
| Field consistent across 3+ sources | 0.95 |
| Field consistent across 2 sources | 0.80 |
| Field from single high-authority source (USAP, PT.com) | 0.70 |
| Field from single lower-authority source | 0.50 |
| Field inferred/calculated | 0.40 |
| Field from Facebook/Eventbrite only | 0.30 |

**Overall tournament confidence** = weighted average of field scores for critical fields (date_start, city, entry_fee_min, status).

**UI display rules:**
- confidence ≥ 0.90 → show normally
- confidence 0.70–0.89 → show with "Data from [N] sources" tooltip
- confidence < 0.70 → show warning badge "Confirm details with organizer" + link to source

### 2.6 Scraper Infrastructure

**Runtime:** Node.js workers on Vercel Cron Jobs (or Railway cron if Vercel limits hit)

**Tech stack:**
- `playwright` or `puppeteer` for JS-heavy pages (pickleballtournaments.com uses React)
- `cheerio` + `axios` for static HTML pages
- Eventbrite: official API with `q=pickleball+tournament&category=sports`
- Rate limiting: per-source configurable delay + exponential backoff on 429s
- User-agent rotation: `Mozilla/5.0 (compatible; PickleballPortalBot/1.0; +https://pickleballportal.com/bot)`
- `robots.txt` respected at all times (we are not a bad actor)
- IP rotation: optional via residential proxy pool for high-frequency sources

**Error handling:**
- HTTP 4xx → log, mark source as having issues, alert on-call
- HTTP 5xx → retry with exponential backoff (3x, then mark failed run)
- Parse error → store raw HTML, flag for manual review, don't corrupt canonical data
- Rate limit hit → pause source for `backoff_until`, resume automatically

**Scrape run logging:**
- Every run stored in `scrape_runs`: source, start/end time, tournaments_found, tournaments_new, tournaments_updated, tournaments_merged, errors_count

---

## 3. Tournament Director Validation System

### 3.1 Why This Matters

The scraper gets us 80% accuracy. The other 20% — entry fees, exact dates, skill level brackets, registration deadlines — requires the tournament director. But this isn't just a data quality play: **every director we email is a relationship**. Directors who validate data become advocates. They start submitting directly. They send players to our listing. They consider sponsorship deals.

This is relationship-driven SEO and content quality, not just automation.

### 3.2 Trigger Conditions

An outreach is queued when **any** of the following is true:

| Trigger | Example |
|---------|---------|
| Date inconsistency | PT.com says Aug 2–3, USAP says Aug 3–4 |
| Entry fee inconsistency | PT.com says $45/event, PB.com says $60/event |
| Low overall confidence score | < 0.60 on critical fields |
| New tournament, single source | Just scraped from Facebook/Eventbrite |
| Director email found but not yet contacted | New tournament, no prior outreach |
| 30-day refresh | Re-verify major tournaments as dates approach |

### 3.3 Outreach Flow

```
[Inconsistency Detected]
         │
         ▼
[Find director contact]
  ├── Scraped from listing (director_email on tournaments table)
  ├── Tournament website WHOIS / contact page
  └── Director not found → skip (can't reach them)
         │
         ▼
[outreach_queue record created]
  status: 'queued'
  template: 'initial_validation'
  inconsistencies: {field, source_a_value, source_b_value}
         │
         ▼
[Scheduler — runs hourly]
  ├── Pick up queued items → send email → status: 'sent'
  ├── 5 days later: no response → send follow_up → status: 'follow_up_sent'
  └── 14 days later: no response → status: 'stale'
         │
         ▼
[Director responds]
  ├── Magic link in email → pre-filled form on pickleballportal.com/verify/[token]
  ├── Response stored in outreach_queue.response_data
  ├── Canonical fields updated with director-confirmed values
  ├── Confidence scores boosted to 1.0 for confirmed fields
  └── status: 'validated' + tournaments.verified = true
         │
         ▼
[UI Badge] "✓ Verified by Director" appears on tournament listing
```

### 3.4 Email Templates

**Template: initial_validation**
```
Subject: Your [Tournament Name] listing on Pickleball Portal

Hi [Director Name],

We're building the most accurate pickleball tournament database on the web 
and found your event [Tournament Name] ([date], [city]) listed with some 
discrepancies across different platforms.

We'd love to make sure players see the correct information:

• Start date: We're seeing [Aug 2] on one source and [Aug 3] on another
• Entry fee: Listed as [$45] on pickleballtournaments.com and [$60] elsewhere

Can you confirm the details? It takes 2 minutes:
→ [Confirm your event details — magic link]

Once verified, your listing will show a "✓ Verified by Director" badge and 
we'll send players your way.

Thanks,
The Pickleball Portal Team
```

**Template: follow_up** (Day 5 if no response)
```
Subject: Quick follow-up — [Tournament Name] listing

Hi [Director Name], quick follow-up on verifying your event details for 
[Tournament Name]. We're seeing conflicting information and want to make 
sure players register with the right details.

→ [Verify in 2 minutes — magic link]

If you'd prefer to not be contacted, reply with "remove" and we'll stop.
```

**Template: thank_you** (after validation)
```
Subject: ✓ Your event is verified on Pickleball Portal

[Director Name], thanks for verifying [Tournament Name]! Your listing now 
shows the "Verified by Director" badge and will appear higher in our search 
results.

We get [X,000] monthly visitors looking for tournaments in [State] — we'll 
send them your way.

Want to submit future events directly? It's free:
→ pickleballportal.com/submit-tournament
```

### 3.5 Director Self-Submission Portal

Beyond outreach, build a free submission form at `/submit-tournament`:
- Pre-filled if we've already scraped their event (matched by director email)
- All fields editable
- After submission: automatically published as `verified = true`
- Director gets account with `/director/dashboard` showing:
  - Event stats (views, registration clicks, player interest count)
  - Edit event details
  - Manage multiple events
  - Upgrade prompt: "Want sponsored placement?"

This converts one-way outreach into an ongoing relationship. Directors who submit directly represent our highest-quality, zero-scrape-cost data.

---

## 4. User Account & Sticky Features Funnel

### 4.1 Philosophy

Every friction point in the funnel costs us email addresses and accounts. The golden rule: **never ask for more than you need at the moment of value**. A player trying to save a tournament listing doesn't need to fill out a profile. They need one click and their email.

The counter-rule: **never give away the account-tier value for free**. Browsing is always free. Personalization requires email. Community features require an account.

### 4.2 Conversion Ladder

```
TIER 0 — ANONYMOUS
────────────────────────────────────────────────────────────────────
What they can do:
  • Browse ALL tournaments, paddles, articles freely
  • Filter/search with no gates
  • View tournament details, registration links
  • Take the paddle finder quiz (results shown freely)
  • See deal prices and retailer links

What they can't do: anything persistent across sessions
────────────────────────────────────────────────────────────────────

TIER 1 — EMAIL SUBSCRIBER (Supabase: email_subscribers table)
────────────────────────────────────────────────────────────────────
Trigger moments (show value prop, then email gate):

  ❶ Save a paddle
     Value prop: "We'll track the price and email you when it drops"
     Gate: Email address
     
  ❷ Price alert
     Value prop: "Alert me when [Joola Hyperion] drops below $200"
     Gate: Email + target price
     
  ❸ Tournament near me alerts
     Value prop: "Auto-find tournaments in my area"
     Gate: Email + zip code
     
  ❹ Save paddle quiz results
     Value prop: "Save your results and share with your group"
     Gate: Email
     
  ❺ "I'm interested in this tournament"
     Value prop: "We'll email you when registration opens"
     Gate: Email

localStorage bridge: Saves and watches work anonymously in localStorage.
When email is captured, we migrate localStorage state to their subscriber record.
"We saved your 3 items — create an account to access them anywhere."
────────────────────────────────────────────────────────────────────

TIER 2 — FULL ACCOUNT (Supabase Auth)
────────────────────────────────────────────────────────────────────
Trigger moments:

  ❶ Save more than 3 items
     "You're at your save limit. Create a free account for unlimited saves."
     
  ❷ "My Bag" — paddle collection tracker
     "Track what you own, what you're testing, what's on your wishlist"
     
  ❸ "My Tournaments" dashboard
     "All your upcoming events in one place. Get reminded 7 days out."
     
  ❹ Saved searches with change alerts
     "Alert me when new 4.0 tournaments open in Colorado within 50 miles"
     
  ❺ "My Courts" — home courts + local tournament alerts
     "Pin your courts. We'll tell you about tournaments hosted there."
     
  ❻ Player profile (skill level, DUPR)
     "Tell us your level and we'll filter tournaments to only ones you're eligible for"

Auth methods:
  - Email/password (default)
  - Google OAuth
  - Apple Sign-In (required for iOS users)
────────────────────────────────────────────────────────────────────

TIER 3 — COMMUNITY MEMBER (Full account + community features)
────────────────────────────────────────────────────────────────────
Unlocks after account creation:

  ❶ Paddle reviews
     - Text review + star ratings (power, control, spin, pop, value)
     - "Verified Owner" badge if paddle is in their My Bag
     - Helpful/Not Helpful voting
     
  ❷ Tournament check-in
     - "I'm going to [Tournament Name]" → public count on listing
     - See who else is going (if they've opted in)
     - Social proof: "14 players from your area are registered"
     
  ❸ Find a partner
     - Opt-in availability for partner matching
     - Filters: skill level, tournament, location, format (singles/doubles/mixed)
     - First message requires account on both sides
     - No DMs without mutual opt-in (prevents spam)
────────────────────────────────────────────────────────────────────
```

### 4.3 Progressive Profile Design

Profile completion is gamified without being annoying:

```
Profile strength bar (visible in dashboard only):

◼◼◼◼◼◼◼◼◻◻  80%  [Complete your profile]
  
Steps:
  ✓ Email captured
  ✓ Name added
  ✓ Zip code set
  ✓ Skill level set
  ◻ DUPR rating linked
  ◻ Profile photo
  ◻ First paddle review

Completion rewards: no paywall, just social signals
  - 100% profile = "Verified Player" badge on reviews and check-ins
  - Unlocks "Find a Partner" feature
```

### 4.4 Pre-Auth to Post-Auth Migration

Critical for conversion: we never lose their anonymous work.

```javascript
// On email capture (Tier 1):
async function captureEmail(email: string) {
  const localSaves = localStorage.getItem('pp_saves'); // {paddles: [], tournaments: []}
  await upsertSubscriber(email, JSON.parse(localSaves));
  // localStorage preserved until they explicitly sign in or clear browser
}

// On account creation (Tier 2):
async function onAccountCreated(userId: string, email: string) {
  // 1. Find email_subscribers record
  const subscriber = await getSubscriber(email);
  // 2. Migrate favorites to user_favorites table
  await migrateSaves(userId, subscriber.saved_data);
  // 3. Migrate price alerts to link to userId
  await linkAlerts(userId, email);
  // 4. Delete email_subscribers record (now they're a full user)
  await deleteSubscriber(email);
  // 5. Show: "Welcome! We moved your 5 saved items to your account."
}
```

### 4.5 Tournament-Specific Features

**Tournament Detail Page** (`/tournaments/[slug]`) — the core page that drives registration clicks:

```
[Tournament Name]                          ✓ Verified by Director
Phoenix Classic 2026                       Aug 2–3 · Scottsdale, AZ

 ┌─────────────────────────────────────────────────────┐
 │  ⭐ SAVE    📅 ADD TO CALENDAR    🔔 NOTIFY ME       │
 └─────────────────────────────────────────────────────┘

 14 players from your area are interested  ←── community proof
 
 EVENTS                  ENTRY FEE    SPOTS
 Men's Doubles 4.0-4.5   $65          32/64
 Women's Doubles 4.0+    $65          18/32
 Mixed Doubles Open      $65          Full (waitlist)

 [Register Now →]  ← affiliate/tracking link to PT.com

 Data from 3 sources · Last verified Feb 16, 2026
 Something wrong? → [Notify us]
```

**Key interaction: "Notify Me"** — this is the email gate. Players click Notify Me, enter email, and get:
- Registration opens alerts (if registration_open date is future)
- 7-day reminder before tournament
- Results notification after tournament

**"I'm Going" check-in:**
- Requires Tier 2 account
- Public count shown on listing ("23 players confirmed going")
- Optional: show avatar stack of people you follow who are going
- Creates social proof → drives more registrations

---

## 5. Supabase Schema Changes

### 5.1 Existing Tables — Modifications Needed

The `tournaments` table in `004_tournaments.sql` is solid. The `tournament_events` and `sponsorship_inquiries` tables are in place. The `profiles`, `email_subscribers`, and `price_alerts` tables in `20260214_initial_schema.sql` are also solid foundations.

**Note on conflict:** `20260214_initial_schema.sql` defines a simple `tournaments` table for GrabAMatch-style local tournament creation. `004_tournaments.sql` defines the full aggregation schema. These will conflict if both migrations run against the same DB. The `004` version supersedes — the migration should `DROP TABLE IF EXISTS public.tournaments CASCADE` before recreating.

**Modifications to `tournaments` table:**

```sql
-- Add multi-source tracking fields
ALTER TABLE public.tournaments
  ADD COLUMN IF NOT EXISTS overall_confidence DECIMAL(3,2) DEFAULT 0.50,
  ADD COLUMN IF NOT EXISTS field_confidence JSONB DEFAULT '{}',
  -- e.g. {"date_start": 0.95, "entry_fee_min": 0.70, "city": 1.0}
  ADD COLUMN IF NOT EXISTS verified_by_director BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS director_verified_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS has_inconsistencies BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS inconsistency_fields TEXT[],
  ADD COLUMN IF NOT EXISTS submit_token TEXT UNIQUE, -- for director self-edit magic links
  ADD COLUMN IF NOT EXISTS view_count INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS registration_click_count INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS interested_count INTEGER DEFAULT 0, -- Tier 1 saves
  ADD COLUMN IF NOT EXISTS going_count INTEGER DEFAULT 0; -- Tier 2 check-ins
```

**Modifications to `profiles` table:**

```sql
-- Already has skill_level, dupr_rating, zip_code, location
-- Add missing fields for tournament-focused features:
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS username TEXT UNIQUE,
  ADD COLUMN IF NOT EXISTS bio TEXT,
  ADD COLUMN IF NOT EXISTS home_facility_id UUID REFERENCES public.facilities(id),
  ADD COLUMN IF NOT EXISTS tournaments_played INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS is_tournament_director BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS notification_prefs JSONB DEFAULT '{
    "tournament_reminders": true,
    "registration_opens": true,
    "price_alerts": true,
    "partner_requests": true,
    "new_tournaments_near_me": true
  }',
  ADD COLUMN IF NOT EXISTS partner_search_active BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS partner_search_formats TEXT[]; -- doubles, mixed, singles
```

**Modifications to `email_subscribers` table:**

```sql
ALTER TABLE public.email_subscribers
  ADD COLUMN IF NOT EXISTS saved_paddles UUID[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS saved_tournaments UUID[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS tournament_interest_zips TEXT[] DEFAULT '{}',
  -- zip codes they want tournament alerts for
  ADD COLUMN IF NOT EXISTS tournament_skill_min DECIMAL(3,1),
  ADD COLUMN IF NOT EXISTS tournament_skill_max DECIMAL(3,1),
  ADD COLUMN IF NOT EXISTS notification_token TEXT UNIQUE DEFAULT gen_random_uuid()::text;
  -- used for one-click unsubscribe / magic links
```

### 5.2 New Tables — Scraper Infrastructure

```sql
-- ============================================
-- SCRAPER: Source Configuration
-- ============================================
CREATE TABLE public.scrape_sources (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL UNIQUE,          -- 'pickleballtournaments', 'usapickleball', etc.
  base_url TEXT NOT NULL,
  scrape_type TEXT NOT NULL,          -- 'html', 'json', 'api'
  cron_schedule TEXT NOT NULL,        -- '0 */4 * * *' = every 4 hours
  rate_limit_ms INTEGER DEFAULT 2000, -- ms between requests
  field_map JSONB NOT NULL,           -- source field → canonical field mapping
  selectors JSONB,                    -- CSS selectors or JSON paths
  auth_required BOOLEAN DEFAULT false,
  headers JSONB DEFAULT '{}',         -- custom headers, cookies
  active BOOLEAN DEFAULT true,
  priority INTEGER DEFAULT 5,         -- 1=highest, 10=lowest
  last_run_at TIMESTAMPTZ,
  last_success_at TIMESTAMPTZ,
  failure_count INTEGER DEFAULT 0,
  backoff_until TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- SCRAPER: Run History
-- ============================================
CREATE TABLE public.scrape_runs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  source_id UUID REFERENCES public.scrape_sources(id),
  source_name TEXT NOT NULL,          -- denormalized for fast lookup
  started_at TIMESTAMPTZ NOT NULL,
  completed_at TIMESTAMPTZ,
  status TEXT DEFAULT 'running',      -- running, completed, failed, partial
  tournaments_found INTEGER DEFAULT 0,
  tournaments_new INTEGER DEFAULT 0,
  tournaments_updated INTEGER DEFAULT 0,
  tournaments_merged INTEGER DEFAULT 0, -- deduped into existing
  tournaments_flagged INTEGER DEFAULT 0, -- inconsistencies detected
  errors_count INTEGER DEFAULT 0,
  errors JSONB DEFAULT '[]',          -- [{url, error, timestamp}]
  duration_ms INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_scrape_runs_source ON public.scrape_runs(source_id, started_at DESC);
CREATE INDEX idx_scrape_runs_status ON public.scrape_runs(status, started_at DESC);

-- ============================================
-- SCRAPER: Raw Tournament Data (before normalization)
-- ============================================
CREATE TABLE public.raw_tournament_scrapes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  run_id UUID REFERENCES public.scrape_runs(id),
  source_name TEXT NOT NULL,
  source_id TEXT,                     -- ID from the source platform
  source_url TEXT NOT NULL,
  raw_html TEXT,                      -- stored for debugging / re-parsing
  raw_data JSONB,                     -- parsed raw fields (pre-normalization)
  normalized_data JSONB,              -- post-normalization (our field names)
  canonical_tournament_id UUID REFERENCES public.tournaments(id), -- NULL if not yet matched
  dedup_status TEXT DEFAULT 'pending', -- pending, matched, created, rejected
  dedup_match_type TEXT,              -- 'exact', 'fuzzy', 'director', 'manual'
  parse_errors JSONB DEFAULT '[]',
  scraped_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_raw_scrapes_source ON public.raw_tournament_scrapes(source_name, source_id);
CREATE INDEX idx_raw_scrapes_canonical ON public.raw_tournament_scrapes(canonical_tournament_id);
CREATE INDEX idx_raw_scrapes_run ON public.raw_tournament_scrapes(run_id);
CREATE INDEX idx_raw_scrapes_status ON public.raw_tournament_scrapes(dedup_status);

-- ============================================
-- SCRAPER: Source Citations per Tournament
-- (Which sources we found this tournament on)
-- ============================================
CREATE TABLE public.tournament_source_citations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tournament_id UUID NOT NULL REFERENCES public.tournaments(id) ON DELETE CASCADE,
  source_name TEXT NOT NULL,
  source_id TEXT,                     -- ID on source platform
  source_url TEXT NOT NULL,
  source_data JSONB,                  -- what this source says (latest snapshot)
  first_seen_at TIMESTAMPTZ DEFAULT NOW(),
  last_seen_at TIMESTAMPTZ DEFAULT NOW(),
  last_verified_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,     -- false if tournament no longer appears on source
  UNIQUE(tournament_id, source_name)
);

CREATE INDEX idx_citations_tournament ON public.tournament_source_citations(tournament_id);
CREATE INDEX idx_citations_source ON public.tournament_source_citations(source_name, source_id);

-- ============================================
-- SCRAPER: Field-Level Inconsistencies
-- ============================================
CREATE TABLE public.tournament_inconsistencies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tournament_id UUID NOT NULL REFERENCES public.tournaments(id) ON DELETE CASCADE,
  field_name TEXT NOT NULL,           -- 'date_start', 'entry_fee_min', etc.
  source_a TEXT NOT NULL,
  source_a_value TEXT NOT NULL,
  source_b TEXT NOT NULL,
  source_b_value TEXT NOT NULL,
  detected_at TIMESTAMPTZ DEFAULT NOW(),
  resolved BOOLEAN DEFAULT false,
  resolved_value TEXT,
  resolved_by TEXT,                   -- 'director', 'manual', 'scraper_update'
  resolved_at TIMESTAMPTZ
);

CREATE INDEX idx_inconsistencies_tournament ON public.tournament_inconsistencies(tournament_id, resolved);
CREATE INDEX idx_inconsistencies_unresolved ON public.tournament_inconsistencies(detected_at) WHERE resolved = false;
```

### 5.3 New Tables — Director Outreach

```sql
-- ============================================
-- DIRECTOR OUTREACH: Email Queue
-- ============================================
CREATE TABLE public.outreach_queue (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tournament_id UUID NOT NULL REFERENCES public.tournaments(id) ON DELETE CASCADE,
  
  -- Director contact
  director_email TEXT NOT NULL,
  director_name TEXT,
  
  -- What we're asking about
  inconsistencies JSONB NOT NULL,
  -- [{field: "date_start", source_a: "PT", value_a: "2026-08-02",
  --   source_b: "USAP", value_b: "2026-08-03"}]
  
  -- Email tracking
  template_id TEXT NOT NULL,          -- 'initial_validation', 'follow_up', 'thank_you'
  status TEXT DEFAULT 'queued',       -- queued, sent, follow_up_sent, responded, validated, stale, bounced, opted_out
  
  -- Timestamps
  queued_at TIMESTAMPTZ DEFAULT NOW(),
  sent_at TIMESTAMPTZ,
  follow_up_sent_at TIMESTAMPTZ,
  responded_at TIMESTAMPTZ,
  
  -- Director response
  verify_token TEXT UNIQUE DEFAULT gen_random_uuid()::text, -- magic link token
  response_data JSONB,
  -- {confirmed_fields: {date_start: "2026-08-02", entry_fee_min: 65}, notes: "..."}
  
  -- Email provider tracking
  email_message_id TEXT,              -- from SendGrid/Resend
  email_opened_at TIMESTAMPTZ,
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_outreach_tournament ON public.outreach_queue(tournament_id);
CREATE INDEX idx_outreach_status ON public.outreach_queue(status, queued_at);
CREATE INDEX idx_outreach_send_queue ON public.outreach_queue(status, queued_at)
  WHERE status IN ('queued', 'sent');
CREATE INDEX idx_outreach_token ON public.outreach_queue(verify_token);

-- ============================================
-- DIRECTOR OUTREACH: Email Templates
-- ============================================
CREATE TABLE public.outreach_templates (
  id TEXT PRIMARY KEY,                -- 'initial_validation', 'follow_up', 'thank_you'
  subject TEXT NOT NULL,
  body_html TEXT NOT NULL,
  body_text TEXT NOT NULL,
  active BOOLEAN DEFAULT true,
  version INTEGER DEFAULT 1,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- DIRECTOR ACCOUNTS (for self-submission portal)
-- ============================================
CREATE TABLE public.director_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  name TEXT NOT NULL,
  phone TEXT,
  organization TEXT,
  city TEXT,
  state TEXT,
  tournaments_managed UUID[],         -- tournament IDs they can edit
  verified BOOLEAN DEFAULT false,     -- verified identity
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_director_email ON public.director_profiles(email);
```

### 5.4 New Tables — User Account Features

```sql
-- ============================================
-- USER FAVORITES (Tier 2)
-- ============================================
CREATE TABLE public.user_favorites (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL,            -- 'tournament', 'paddle', 'article', 'facility'
  item_id UUID NOT NULL,              -- references the respective table
  item_slug TEXT,                     -- denormalized for quick URL building
  notes TEXT,                         -- user's private note
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, item_type, item_id)
);

CREATE INDEX idx_favorites_user ON public.user_favorites(user_id, item_type);
CREATE INDEX idx_favorites_item ON public.user_favorites(item_type, item_id);

ALTER TABLE public.user_favorites ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own favorites" ON public.user_favorites
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- MY BAG — Paddle Collection (Tier 2)
-- ============================================
CREATE TABLE public.user_bag (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  paddle_id UUID NOT NULL REFERENCES public.paddles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'own',          -- own, testing, wishlist, sold
  purchase_price DECIMAL(6,2),
  purchase_date DATE,
  purchase_retailer TEXT,
  condition TEXT,                     -- new, like_new, good, fair
  notes TEXT,
  is_primary BOOLEAN DEFAULT false,   -- their "main" paddle
  added_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, paddle_id)
);

CREATE INDEX idx_bag_user ON public.user_bag(user_id);
ALTER TABLE public.user_bag ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own bag" ON public.user_bag
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- MY COURTS — Home Courts (Tier 2)
-- ============================================
CREATE TABLE public.user_courts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  facility_id UUID NOT NULL REFERENCES public.facilities(id) ON DELETE CASCADE,
  label TEXT DEFAULT 'home',          -- home, work, travel
  notify_tournaments BOOLEAN DEFAULT true, -- alert when tournaments at this facility
  added_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, facility_id)
);

CREATE INDEX idx_user_courts_user ON public.user_courts(user_id);
ALTER TABLE public.user_courts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own courts" ON public.user_courts
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- SAVED SEARCHES + ALERTS (Tier 2)
-- ============================================
CREATE TABLE public.saved_searches (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  name TEXT,                          -- "Colorado 4.0 Tournaments"
  search_params JSONB NOT NULL,
  -- {state: "CO", skill_min: 3.5, skill_max: 4.5, radius_miles: 75,
  --  format: ["doubles"], tier: ["regional", "national"]}
  alert_on_new BOOLEAN DEFAULT true,
  alert_frequency TEXT DEFAULT 'immediate', -- immediate, daily, weekly
  last_alerted_at TIMESTAMPTZ,
  last_result_count INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_saved_searches_user ON public.saved_searches(user_id);
CREATE INDEX idx_saved_searches_active ON public.saved_searches(active, last_alerted_at)
  WHERE active = true;
ALTER TABLE public.saved_searches ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own searches" ON public.saved_searches
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- TOURNAMENT CHECK-INS / "I'm Going" (Tier 2)
-- ============================================
CREATE TABLE public.tournament_checkins (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tournament_id UUID NOT NULL REFERENCES public.tournaments(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'going',        -- going, interested, maybe
  events JSONB DEFAULT '[]',          -- [{event_id, event_name}] — which divisions
  public BOOLEAN DEFAULT true,        -- show in "X people going" count
  notes TEXT,
  checked_in_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(tournament_id, user_id)
);

CREATE INDEX idx_checkins_tournament ON public.tournament_checkins(tournament_id);
CREATE INDEX idx_checkins_user ON public.tournament_checkins(user_id);
ALTER TABLE public.tournament_checkins ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Check-ins visible to all" ON public.tournament_checkins
  FOR SELECT USING (public = true);
CREATE POLICY "Users manage own check-ins" ON public.tournament_checkins
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- PADDLE REVIEWS (Tier 3)
-- ============================================
CREATE TABLE public.paddle_reviews (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  paddle_id UUID NOT NULL REFERENCES public.paddles(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  
  -- Ratings (1-5 each)
  rating_overall INTEGER CHECK (rating_overall BETWEEN 1 AND 5),
  rating_power INTEGER CHECK (rating_power BETWEEN 1 AND 5),
  rating_control INTEGER CHECK (rating_control BETWEEN 1 AND 5),
  rating_spin INTEGER CHECK (rating_spin BETWEEN 1 AND 5),
  rating_pop INTEGER CHECK (rating_pop BETWEEN 1 AND 5),
  rating_value INTEGER CHECK (rating_value BETWEEN 1 AND 5),
  
  -- Content
  title TEXT,
  body TEXT NOT NULL,
  play_style TEXT,                    -- banger, dinker, all-around, serve-and-volley
  skill_level_at_time DECIMAL(2,1),
  
  -- Verification
  verified_owner BOOLEAN DEFAULT false, -- paddle is in their user_bag
  
  -- Social
  helpful_count INTEGER DEFAULT 0,
  not_helpful_count INTEGER DEFAULT 0,
  
  -- Moderation
  status TEXT DEFAULT 'published',    -- pending, published, rejected, removed
  flagged BOOLEAN DEFAULT false,
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(paddle_id, user_id)          -- one review per paddle per user
);

CREATE INDEX idx_reviews_paddle ON public.paddle_reviews(paddle_id, status);
CREATE INDEX idx_reviews_user ON public.paddle_reviews(user_id);
CREATE INDEX idx_reviews_verified ON public.paddle_reviews(paddle_id, verified_owner)
  WHERE verified_owner = true AND status = 'published';
ALTER TABLE public.paddle_reviews ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Published reviews visible to all" ON public.paddle_reviews
  FOR SELECT USING (status = 'published');
CREATE POLICY "Users manage own reviews" ON public.paddle_reviews
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- PARTNER SEARCH (Tier 3)
-- ============================================
CREATE TABLE public.partner_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  requester_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  tournament_id UUID REFERENCES public.tournaments(id), -- NULL = general partner search
  
  format TEXT NOT NULL,               -- doubles, mixed_doubles, singles
  skill_min DECIMAL(2,1),
  skill_max DECIMAL(2,1),
  message TEXT,
  
  status TEXT DEFAULT 'open',         -- open, matched, closed, expired
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '30 days'),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_partner_requests_open ON public.partner_requests(status, expires_at)
  WHERE status = 'open';
CREATE INDEX idx_partner_requests_tournament ON public.partner_requests(tournament_id)
  WHERE tournament_id IS NOT NULL;
ALTER TABLE public.partner_requests ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Partner requests visible to authenticated" ON public.partner_requests
  FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "Users manage own requests" ON public.partner_requests
  FOR ALL USING (auth.uid() = requester_id);

-- ============================================
-- TOURNAMENT INTEREST (Tier 1 — email-gated only)
-- ============================================
CREATE TABLE public.tournament_interests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tournament_id UUID NOT NULL REFERENCES public.tournaments(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  user_id UUID REFERENCES public.profiles(id), -- NULL if email-only
  interest_type TEXT DEFAULT 'notify', -- notify (reg opens), remind (7-day), results
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(tournament_id, email)
);

CREATE INDEX idx_interests_tournament ON public.tournament_interests(tournament_id);
CREATE INDEX idx_interests_email ON public.tournament_interests(email);
```

### 5.5 Views and Functions

```sql
-- ============================================
-- FUNCTION: Find tournaments near zip/coords
-- (extends existing find_nearby_courts pattern)
-- ============================================
CREATE OR REPLACE FUNCTION find_tournaments_near(
  user_lat DOUBLE PRECISION,
  user_lng DOUBLE PRECISION,
  radius_miles INTEGER DEFAULT 75,
  skill_min_filter DECIMAL DEFAULT NULL,
  skill_max_filter DECIMAL DEFAULT NULL,
  date_from DATE DEFAULT CURRENT_DATE,
  date_to DATE DEFAULT NULL,
  formats TEXT[] DEFAULT NULL
)
RETURNS TABLE (
  id UUID,
  name TEXT,
  slug TEXT,
  date_start DATE,
  date_end DATE,
  city TEXT,
  state TEXT,
  distance_miles DOUBLE PRECISION,
  entry_fee_min DECIMAL,
  overall_confidence DECIMAL,
  verified_by_director BOOLEAN,
  going_count INTEGER,
  tier TEXT
) AS $$
  SELECT
    t.id, t.name, t.slug, t.date_start, t.date_end,
    t.city, t.state,
    ST_Distance(
      ST_SetSRID(ST_MakePoint(t.lng, t.lat), 4326)::geography,
      ST_SetSRID(ST_MakePoint(user_lng, user_lat), 4326)::geography
    ) / 1609.34 AS distance_miles,
    t.entry_fee_min, t.overall_confidence, t.verified_by_director,
    t.going_count, t.tier
  FROM public.tournaments t
  WHERE
    t.lat IS NOT NULL AND t.lng IS NOT NULL
    AND t.date_start >= date_from
    AND (date_to IS NULL OR t.date_start <= date_to)
    AND t.status IN ('upcoming', 'registration_open', 'registration_closed')
    AND ST_DWithin(
      ST_SetSRID(ST_MakePoint(t.lng, t.lat), 4326)::geography,
      ST_SetSRID(ST_MakePoint(user_lng, user_lat), 4326)::geography,
      radius_miles * 1609.34
    )
    AND (skill_min_filter IS NULL OR t.max_skill >= skill_min_filter)
    AND (skill_max_filter IS NULL OR t.min_skill <= skill_max_filter)
    AND (formats IS NULL OR t.format && formats)
  ORDER BY distance_miles, t.date_start;
$$ LANGUAGE SQL STABLE;

-- ============================================
-- VIEW: Tournament Listing (public-facing data)
-- Aggregates source count, check-in count, confidence
-- ============================================
CREATE OR REPLACE VIEW public.tournament_listing AS
SELECT
  t.*,
  COUNT(DISTINCT tsc.source_name) AS source_count,
  COUNT(DISTINCT tc.id) AS checkin_count,
  COUNT(DISTINCT ti.email) AS interest_count,
  EXISTS(
    SELECT 1 FROM public.outreach_queue oq
    WHERE oq.tournament_id = t.id
      AND oq.status = 'validated'
  ) AS director_responded
FROM public.tournaments t
LEFT JOIN public.tournament_source_citations tsc
  ON tsc.tournament_id = t.id AND tsc.is_active = true
LEFT JOIN public.tournament_checkins tc
  ON tc.tournament_id = t.id AND tc.public = true
LEFT JOIN public.tournament_interests ti
  ON ti.tournament_id = t.id
GROUP BY t.id;
```

---

## 6. Phased Build Plan

### Phase 0 — Foundation (Weeks 1–2)
**Goal:** Get the scraper infra running and data flowing in.

**Ships:**
- [ ] `scrape_sources` + `scrape_runs` + `raw_tournament_scrapes` migration
- [ ] `tournament_source_citations` + `tournament_inconsistencies` migration
- [ ] `tournament` table modifications (confidence, going_count, etc.)
- [ ] Scraper worker: pickleballtournaments.com (P0, highest volume)
- [ ] Scraper worker: usapickleball.org (P0, official data)
- [ ] Deduplication engine (basic: name + date + city exact match)
- [ ] Confidence scoring engine (v1: source count based)
- [ ] Admin dashboard: scrape run logs, tournament count by source
- [ ] Cron job infrastructure on Vercel

**Definition of done:** 1,000+ canonical tournaments in DB, sourced from 2+ sources.

---

### Phase 1 — Tournament Directory MVP (Weeks 3–5)
**Goal:** Launch the public tournament directory. Start ranking for tournament queries.

**Ships:**
- [ ] `/tournaments` — browse/search page (filter by state, date, skill level, format)
- [ ] `/tournaments/[slug]` — tournament detail page (full SEO treatment)
- [ ] `/tournaments/[state]` — state landing pages (e.g., `/tournaments/colorado`) — 50 pages instant
- [ ] Geo search: "Near me" with zip code input
- [ ] Scraper workers: PPA Tour, APP Tour, pickleball.com (P0/P1)
- [ ] Fuzzy deduplication (trigram similarity)
- [ ] Inconsistency detection engine
- [ ] `tournament_interests` table + "Notify me" email gate (Tier 1)
- [ ] Confidence badge UI ("Data from 3 sources")
- [ ] Schema.org `Event` structured data on all tournament pages
- [ ] `sitemap-tournaments.xml` auto-generated

**Definition of done:** 2,500+ tournament pages indexed, ranking for "[city] pickleball tournament" in target markets.

---

### Phase 2 — Director Outreach (Weeks 5–7)
**Goal:** Turn data quality into relationships. Get first verified listings.

**Ships:**
- [ ] `outreach_queue` + `outreach_templates` migration
- [ ] `director_profiles` migration
- [ ] Outreach scheduler (hourly cron: send queued, follow up stale)
- [ ] Magic link verification flow (`/verify/[token]` → pre-filled form)
- [ ] Director self-submission portal (`/submit-tournament`)
- [ ] Director dashboard (`/director/dashboard`)
- [ ] "✓ Verified by Director" badge on listings
- [ ] Thank you email + relationship nurture sequence
- [ ] SendGrid / Resend integration for transactional email

**Target:** 50 verified tournaments in 30 days. 10 directors actively using the portal.

---

### Phase 3 — User Accounts (Weeks 7–10)
**Goal:** Convert anonymous traffic to email subscribers and accounts.

**Ships:**
- [ ] Supabase Auth integration (email/password + Google OAuth)
- [ ] Tier 1: Email capture modal (save tournament, notify me, near-me alerts)
- [ ] `tournament_interests` → email notification pipeline
- [ ] localStorage ↔ email subscriber migration on capture
- [ ] Tier 2: Account creation flow (progressive, not a wall)
- [ ] `user_favorites` — save tournaments, paddles, articles
- [ ] `user_bag` — My Bag paddle collection
- [ ] `user_courts` — My Courts
- [ ] `saved_searches` — save tournament searches with alerts
- [ ] User dashboard (`/dashboard`) — favorites, upcoming tournaments, alerts
- [ ] Profile completion UI (progress bar, prompts)
- [ ] localStorage → account migration on signup

**Target:** 5,000 email subscribers, 1,000 accounts in 60 days post-launch.

---

### Phase 4 — Community & Stickiness (Weeks 11–15)
**Goal:** Make Pickleball Portal the social hub around tournaments.

**Ships:**
- [ ] `tournament_checkins` — "I'm Going" feature with public count
- [ ] Check-in count on tournament listing cards ("23 players going")
- [ ] `paddle_reviews` — full review system with verified owner badge
- [ ] Review aggregation on paddle pages (avg score, review count)
- [ ] `partner_requests` — Find a Partner feature
- [ ] Apple Sign-In
- [ ] Tournament reminder email pipeline (7-day, 1-day)
- [ ] "New tournaments near you" weekly digest (from saved searches)
- [ ] Scraper workers: all remaining P2 sources
- [ ] Full fuzzy deduplication with PostGIS geo-matching

**Target:** 10K+ accounts, 500+ paddle reviews, 1,000+ tournament check-ins.

---

### Phase 5 — Next.js Migration (Weeks 14–18, parallel track)
**Goal:** Migrate from Astro to Next.js + shadcn/ui for full RSC/SSR capabilities.

**Ships:**
- [ ] Next.js 15 app router setup
- [ ] shadcn/ui component library (tournament cards, search UI, auth modals)
- [ ] Server-side tournament search (replaces client-side filtering)
- [ ] ISR for tournament pages (revalidate on scrape update)
- [ ] API routes for saved searches, check-ins, reviews
- [ ] Supabase SSR auth (server components)
- [ ] Vercel Edge Config for feature flags

**Astro → Next.js migration is parallel to Phase 4, not blocking it.**

---

### Phase 6 — Revenue & Monetization (Weeks 16+)
**Goal:** Convert the directory into a revenue stream.

**Ships:**
- [ ] Sponsored tournament placement (promoted listings)
- [ ] Director paid features: analytics dashboard, email blast to interested players
- [ ] Brand sponsorship marketplace (leverages existing `sponsorship_inquiries`)
- [ ] "Register here" affiliate tracking (track registration clicks, negotiate rev share with PT.com)
- [ ] Tournament program ad slots

---

## 7. Success Metrics

### Data Quality
| Metric | Phase 1 Target | Phase 4 Target |
|--------|---------------|----------------|
| Total canonical tournaments | 2,500 | 8,000+ |
| Source coverage (avg sources/tournament) | 1.5 | 2.8+ |
| Tournaments with confidence ≥ 0.90 | 40% | 70% |
| Director-verified tournaments | 0 | 300+ |
| Scraper uptime | 95% | 99% |
| New tournament detection lag | <24h | <4h |

### SEO / Organic
| Metric | Phase 1 Target | Phase 4 Target |
|--------|---------------|----------------|
| Tournament pages indexed | 500 | 5,000+ |
| "[City] pickleball tournament" rankings (top 3) | 5 cities | 50 cities |
| Organic tournament page views/month | 10K | 300K |
| Featured snippets / AI citations | 5 | 50+ |
| Tournament-related keywords ranking | 200 | 2,000+ |

### User Acquisition
| Metric | 30d Post-Launch | 90d Post-Launch | 180d Post-Launch |
|--------|-----------------|-----------------|------------------|
| Email subscribers | 2,000 | 15,000 | 50,000 |
| Registered accounts | 500 | 5,000 | 25,000 |
| Tier 2 → Tier 3 conversion | — | 20% | 25% |
| Daily active users | 200 | 2,000 | 10,000 |
| Email open rate (tournament alerts) | — | >35% | >35% |

### Engagement
| Metric | Phase 3 Target | Phase 4 Target |
|--------|---------------|----------------|
| Avg saves per user | 3+ | 8+ |
| Tournament check-ins | 100 | 2,500+ |
| Paddle reviews | 0 | 500+ |
| Verified owner reviews | 0 | 200+ |
| Partner requests created | 0 | 300+ |

### Director Relations
| Metric | Phase 2 Target | Phase 4 Target |
|--------|---------------|----------------|
| Outreach emails sent | 200 | 1,000+ |
| Response rate | >15% | >25% |
| Director verifications | 50 | 300+ |
| Directors using self-submission portal | 10 | 100+ |
| Directors with active dashboard accounts | 5 | 75+ |

### Business
| Metric | Target |
|--------|--------|
| Registration click-throughs / month | 10,000+ (Phase 2) |
| Registration affiliate revenue (if deal struck) | $2K+/mo (Phase 6) |
| Sponsored placement revenue | $1K+/mo (Phase 6) |
| Director paid dashboard subscribers | 20+ (Phase 6) |

---

## Appendix A: Competitive Moat Analysis

| What we'll have | Why it matters |
|-----------------|----------------|
| Multi-source aggregation | No other site cross-references 10+ sources |
| Director-verified data | Trust signal competitors can't easily replicate |
| Confidence scoring | Transparent data quality — earns press coverage |
| User tournament history | First-party data on player behavior |
| Paddle + tournament integration | "Register for tournament" adjacent to "buy the right paddle" |
| Partner matching | Social stickiness, daily active users |
| SEO footprint (8K+ pages) | Can't be replicated quickly |

## Appendix B: Robots.txt / Legal Risk Mitigation

- All scraping targets public pages (no login walls bypassed)
- We respect `robots.txt` (Disallow directives honored)
- We do not re-publish raw content — we publish normalized summaries with source attribution and outbound links
- We link to registration pages (driving traffic TO the source sites, not replacing them)
- Rate limits are conservative (2+ seconds between requests)
- Director outreach includes opt-out in every email
- We are building a clearinghouse, not a competing registration platform

Primary legal risk: pickleballtournaments.com / pickleball.com (Dundon) C&D. Mitigation: our scraping sends them registration traffic. We are synergistic, not competitive. If C&D received, we remove that source while retaining all other data.

## Appendix C: Stack Summary

| Layer | Technology |
|-------|-----------|
| Frontend | Astro (now) → Next.js 15 (Phase 5) |
| UI Components | shadcn/ui + Tailwind |
| Database | Supabase (PostgreSQL + PostGIS) |
| Auth | Supabase Auth (email + Google + Apple) |
| Scraping | Node.js + Playwright + Cheerio |
| Cron | Vercel Cron Jobs |
| Email | Resend (transactional) + Loops or Beehiiv (marketing) |
| Search | Postgres full-text (FTS) + pg_trgm (fuzzy) |
| Geo | PostGIS (already enabled) |
| Hosting | Vercel |
| Monitoring | Vercel Analytics + Datadog (Phase 2+) |

---

*Document owner: Ace (PM) | Next review: March 2026*
*Build from this document. Questions → TJ.*
