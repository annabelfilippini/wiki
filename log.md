# Wiki Log

> Append-only chronological record. Each entry starts with `## [YYYY-MM-DD] operation | Title` for easy parsing.
> 
> `grep "^## \[" log.md | tail -5` — last 5 operations.

## [2026-04-05] ingest | LLM Wiki Pattern

**Source:** `raw/llm-wiki-pattern.md`
**Pages created:** [[llm-wiki]], [[obsidian]], [[vannevar-bush-memex]]
**Pages updated:** none (first ingest)
**Summary:** Bootstrapped the wiki with its own founding document.

## [2026-04-05] maintain | Business Hub Pages

**Pages created:** [[wayloft]], [[pickleball-portal]]
**Summary:** Initial hub pages for both businesses.

## [2026-04-05] ingest-batch | Wayloft (7 sources)

**Sources:** `raw/wayloft-master-plan-v3.md`, `raw/wayloft-build-plan.md`, `raw/wayloft-eng-review.md`, `raw/wayloft-ux-handoff.md`, `raw/wayloft-three-layer-funnel.md`, `raw/wayloft-signal-design.md`, `raw/wayloft-ellis-church.md`
**Source summaries created:** 7 (in sources/)
**Pages created:** [[ellis-church]], [[signal-design-system]], [[three-layer-funnel]], [[worth-it-tool]], [[transfer-partners]]
**Pages updated:** [[wayloft]] (hub page enriched with full source data)
**Cross-cutting pages created:** [[ai-persona-model]], [[affiliate-revenue-model]], [[beehiiv]]
**Conflicts flagged:**
- Fonts: UX Handoff (Instrument Serif) vs DESIGN.md (Geist). Resolved: DESIGN.md is newer.
- Default mode: dark vs light. Resolved: DESIGN.md is newer.
- Navigation: sidebar vs top nav. Resolved: DESIGN.md is newer.
- Scraper language: Master Plan says Python, Build Plan says Node.js+cheerio (what was built).
- Card count: varies 52-54 across docs.
- CSR annual fee: $795 in Ellis Church doc vs $550 elsewhere.

## [2026-04-05] ingest-batch | Pickleball Portal (6 sources)

**Sources:** `raw/pbp-prd.md`, `raw/pbp-architecture.md`, `raw/pbp-brand.md`, `raw/pbp-pikolai-notes.md`, `raw/pbp-affiliate-tracker.md`, `raw/pbp-tournament-prd.md`
**Source summaries created:** 6 (in sources/)
**Pages created:** [[pikolai-starostin]], [[portal-score]], [[tournament-aggregator]], [[pickleball-com]]
**Pages updated:** [[pickleball-portal]] (hub page enriched with full source data), [[beehiiv]], [[ai-persona-model]], [[affiliate-revenue-model]]
**Conflicts flagged:**
- Framework: "Next.js 16" in architecture doc, all others say 15 (typo).
- Article count: 409 (architecture) vs 303 (PRD). Different dates or counting method.
- Paddle count: 502 vs 428. 428 is actual DB count.
- JustPaddles: ACTIVE in PRD (Feb 18) → DEAD in affiliate tracker (Apr 4).
- GA4: 3 different IDs across docs. Only G-J7Y27KM430 is correct.
- Auto-deploy: architecture says working, CLAUDE.md says broken.
- Tournament PRD says Astro, but Next.js already deployed.

## [2026-04-05] ingest-batch | BB Session Backfill (4 sessions from decisions.jsonl)

**Sources:** `raw/bb-session-2026-04-03-ellis-church-reddit.md`, `raw/bb-session-2026-04-04-pbp-identity.md`, `raw/bb-session-2026-04-04-wayloft-landing-page.md`, `raw/bb-session-2026-04-04-pbp-triage.md`
**Source summaries created:** 4 (in sources/)
**Pages created:** [[clean-before-build]]
**Pages updated:** [[ellis-church]] (Reddit launch strategy), [[pickleball-portal]] (identity, lead product, phased approach, triage status), [[wayloft]] (landing page design direction), [[affiliate-revenue-model]] (Genius Links death detail), [[signal-design-system]] (landing page typography exception), [[worth-it-tool]] (demoted from landing page hero)
**Summary:** First BB→wiki pipeline test. Backfilled 15 decisions from `decisions.jsonl` into 4 session briefs (grouped by project + date + agent). One operational session skipped (onboarding upsert bug fix — not strategic). Clean Before Build pattern elevated to its own concept page at confidence 8/10.

## [2026-04-05] synthesis | AI Persona Pattern Deck

**Output:** `outputs/ai-persona-pattern-deck.html` (Marp slide deck, 11 slides)
**Pages referenced:** [[ai-persona-model]], [[ellis-church]], [[pikolai-starostin]], [[wayloft]], [[pickleball-portal]], [[three-layer-funnel]], [[worth-it-tool]], [[beehiiv]]
**Summary:** First synthesis page and first Marp deck. Cross-cutting analysis of the AI persona pattern across both businesses. Compares Ellis Church (theory, unproven) vs Pikolai (proven at 100K visitors, 409 articles). Flags the key risk: persona must serve real user needs, not just be a cool concept.

## [2026-04-06] ingest-batch | Apple Notes Import (16 sources)

**Sources:** 16 files from `raw/apple-notes/` (exported via Exporter app from Apple Notes)
**Source summaries created:** 16
**Concept pages created:** [[ai-tools-and-frameworks]], [[power-bi]], [[personal-finance-strategy]], [[half-ironman-training]], [[beginner-running-program]]
**Entity pages created:** [[sf-neighborhoods]], [[california-guide]], [[hanoi-travel]], [[puerto-rico-travel]], [[india-travel]]
**Pages updated:** none (all new knowledge domains)
**Archive:** 297 additional Apple Notes copied to `raw/apple-notes-archive/` for Obsidian browsability without wiki processing
**Skipped:** 21 files containing passwords, credentials, or sensitive health data. ~100 expired to-dos, grocery lists, and stubs also excluded.
**Security flags:**
- `AI YouTube.md` contains exposed OpenAI API keys and GitHub tokens -- not ingested, user warned to rotate
- `Go bot.md` Supabase connection string -- redacted from wiki summary
**Summary:** First bulk import from a personal notes app. 411 total notes triaged into 3 tiers: 16 ingested (project/career/knowledge value), 297 archived (searchable but unprocessed), ~100 skipped (noise/sensitive). Created 10 new entity/concept pages spanning AI tools, personal finance, SF housing, travel, and endurance sports. New knowledge domains: travel, endurance training, personal finance, data analytics.

## [2026-04-06] ingest | China Brain Chip (Nature)

**Source:** `raw/China approves brain chip to treat paralysis — a world first.md`
**Pages created:** [[china-approves-brain-chip]] (source), [[brain-computer-interface]] (concept), [[neuralink]] (entity)
**Pages updated:** none
**Summary:** First neuroscience source. China approved the world's first BCI for use outside clinical trials — beating Neuralink to regulatory approval. Limited source content (paywalled Nature article), but the regulatory milestone is the key takeaway.
**Note:** `raw/AI 2027.md` listed by auto-ingest hook but does not exist in raw/. Skipped.

## [2026-04-06] ingest | Notes Thoughts (Autonomous System Vision)

**Source:** `raw/Notes thoughts.md`
**Pages created:** [[notes-thoughts]] (source), [[autonomous-business-system]] (concept)
**Pages updated:** [[llm-wiki]] (added role as Layer 1-2 of autonomous system)
**Summary:** First explicit articulation of the full autonomous business system — 7 layers from knowledge capture through automated distribution. Concept page maps current state of each layer and open questions. Positions LLM Wiki as the foundation layer.

## [2026-04-06] ingest | AMI Labs World Models (Telegram)

**Source:** `raw/telegram-2026-04-06-ami-labs-world-models.md` (via Telegram brain dump)
**URL:** https://techcrunch.com/2026/03/09/yann-lecuns-ami-labs-raises-1-03-billion-to-build-world-models/
**Source summary created:** [[ami-labs-funding]]
**Entity pages created:** [[ami-labs]], [[yann-lecun]]
**Concept pages created:** [[world-models]]
**Pages updated:** [[ai-tools-and-frameworks]] (added world models as emerging paradigm)
**Summary:** First Telegram brain dump ingest. Yann LeCun's AMI Labs raised $1.03B for world models — AI systems that simulate physical environments. New knowledge domain for the wiki: world models as a paradigm beyond LLMs. LeBrun's self-aware "this will be a buzzword" quote is the most interesting signal.

## [2026-04-06] maintain | Restructure to 3-Folder Pattern

**Changes:** Adopted Karpathy's flat 3-folder structure: `raw/`, `wiki/`, `outputs/`.
- Merged `pages/` (17 files) + `sources/` (18 files) into `wiki/` (35 files total)
- Renamed `synthesis/` to `outputs/` (1 file)
- Deleted empty `pages/`, `sources/`, `synthesis/` directories
- Rewrote `CLAUDE.md` schema for new structure
- Updated `index.md` — single flat listing, no more separate Sources/Pages sections
- Updated Dataview queries to reference new paths
**No wikilinks broken** — Obsidian resolves by filename, not path.

## [2026-04-06] scan | Daily AI Briefing

**Output:** `outputs/briefing-daily-ai-2026-04-06.md`
**Sources scanned:** Hacker News, Reddit (r/LocalLLaMA, r/MachineLearning), TechCrunch, VentureBeat, Skift, Business Travel Magazine, Meta AI Blog, Google DeepMind, PyPI Blog, IDC, humai.blog
**Top stories:** Llama 4 Scout+Maverick (Meta open-weight MoE multimodal), Claude Mythos 10T parameter leak, Anthropic ends OpenClaw subscription coverage, agentic travel booking vs. loyalty optimization tension, Travel Smarter loyalty platform launch (Wayloft competitor), Microsoft MAI models in Foundry, LiteLLM supply chain attack, Gemini 3.1 Pro benchmarks, OpenAI $122B round / IPO track
**Kill/Build signals:** Agentic booking = Wayloft positioning opportunity. Llama 4 Maverick = Second Brain architecture upgrade candidate.

## [2026-04-06] scan | Community Scan (HN / Reddit / Product Hunt)

**Output:** `outputs/briefing-community-scan-2026-04-06.md`
**Sources scanned:** Hacker News (Show HN posts), r/LocalLLaMA, r/ChatGPT, r/artificial, r/SideProject, Product Hunt
**Top stories:** Apfel (Apple on-device LLM CLI, 513 pts on HN), Gemma 4 (Apache 2.0 open model, #3 globally on Arena AI), Claw Code (open-source Claude Code harness, 72K GitHub stars), Microsoft MAI-Transcribe-1 (SOTA ASR, 50% cheaper), ChatGPT market share collapse (86.7% → 64.5%)
**Kill/Build signals:** Apfel + Gemma 4 = viable free local inference stack on Apple Silicon. ChatGPT fragmentation = tailwind for specialist tools. MAI-Voice-1 = Ellis Church audio content path.
**Note:** Supplemental to daily briefing; daily briefing covers Llama 4, Claude Mythos, OpenClaw, travel AI. This scan captures community-level build/ship activity.

## [2026-04-06] briefing | Morning Briefing — Three-Section Daily

**Output:** `outputs/briefing-daily-ai-2026-04-06.md` (overwrites earlier AI-only scan)
**Sections:** Hot AI Tools & Resources | AI Industry News | World News
**Top stories:** Apfel (Apple on-device LLM CLI, HN 513pts), Qwen 3.5-9B on M4 (LocalLLaMA 1159 upvotes), MCP at 97M installs, Llama 4 Scout/Maverick (Meta), Claude Mythos leak (10T params), ChatGPT below 40% mobile DAU, OpenAI $122B round / GPT-5.5 pretraining done, Iran rejects ceasefire (Hormuz deadline today), Artemis II lunar flyby, US IEEPA tariffs struck down → 15% Section 122 in effect, Bangladesh measles emergency

## [2026-04-06] scan | AI Industry Scan — Company Moves + Broader Signals

**Output:** `outputs/briefing-industry-scan-2026-04-06.md`
**Sources scanned:** TechCrunch, VentureBeat, Washington Examiner, Axios, CalMatters, PYMNTS, FinancialContent, CNBC, IBTimes, World Economic Forum, Quinnipiac/TechCrunch trust poll, Bright Horizons, Transparency Coalition
**Layer 1 — Company moves:**
- OpenAI acquires TBPN (first media company acquisition, owned distribution play)
- Anthropic forms AnthroPAC amid active Pentagon lawsuit (supply chain risk label, two federal suits filed March 9, temp block holding)
- Anthropic acquires Coefficient Bio for $400M (AI biotech, drug R&D vertical play)
- Anthropic is hottest trade in AI secondary markets; OpenAI cooling; SpaceX IPO looming
- Meta cuts ~20% of workforce (~15K employees) under "Efficiency 2.0" / AI-native pivot; market rewarded it
- Microsoft launches three in-house MAI models (Transcribe, Voice, Image) — slow decoupling from OpenAI dependency
**Layer 2 — Bigger picture:**
- California's Newsom EO N-5-26 + legislative multipronged approach = de facto national AI standard, despite federal deregulatory push
- AI workforce adoption gap: 42% expect role changes, only 17% use AI frequently; 76% of Americans rarely trust AI results; 23% wage premium for AI skills
**Kill/Build signals:** TBPN acquisition validates owned media + AI product thesis (Ellis Church). AI trust gap = transparency as brand differentiator. Meta displacement = community opportunity.

## [2026-04-06] scan | AI Buzz Scan (HN / Reddit / Product Hunt / GitHub)

**Output:** `outputs/ai-buzz-scan-2026-04-06.md`
**Sources scanned:** Hacker News (Show HN), r/LocalLLaMA, r/MachineLearning, r/artificial, Product Hunt, GitHub Trending, X/Twitter community signals
**Top items:** Cursor 3 (parallel agents IDE, April 2 launch), GPT-OSS (OpenAI Apache 2.0 open weights, 120B + 20B), Qwen3-Coder 480B (SOTA open coding agent, beats Claude Sonnet on SWE-Bench), Kimi K2 (1T-param MoE, outperforms DeepSeek V3), Cline (59.9K stars, 5M installs, $1M OSS grant), Pluck (UI copy → AI coding tools, fresh Show HN), Dimensional (agentic robotics OS, no ROS, GitHub #3 trending)
**Note:** Supplements earlier community scan (Apfel, Gemma 4, Claw Code, MAI-Transcribe-1). This scan covers next-tier items with genuine community engagement.

## [2026-04-06] query | World News Briefing

**Output:** `outputs/briefing-world-news-2026-04-06.md`
**Sources searched:** Al Jazeera, CNN, NPR, Bloomberg, CNBC, Russia Matters, UN Security Council Report, WHO, Euronews, Earth.org, Tax Foundation, PIIE, Wikipedia (2026 Iran war, 2026 Strait of Hormuz crisis), FinancialContent, FDD, GMA Network, Newsweek, Moscow Times
**Stories covered:** Iran-US war / Strait of Hormuz deadline; Ukraine Easter escalation; global oil shock + Muscat Protocol partial relief; Gaza ceasefire status; US tariff IEEPA ruling struck down 6-3 (Feb 20); Italy coal phase-out delayed to 2038; WHO World Health Day "Stand with science"; US March jobs report (178K).
**Note:** Reuters, AP News, BBC blocked to search agent (domain restrictions per Anthropic crawler policy). Coverage sourced from equivalent outlets.

## [2026-04-06] ingest | Gates Year Ahead 2026 (Telegram)

**Source:** `raw/telegram-2026-04-06-gates-year-ahead-2026.md` (via Telegram brain dump)
**URL:** https://www.gatesnotes.com/meet-bill/tech-thinking/reader/the-year-ahead-2026
**Source summary created:** [[gates-year-ahead-2026]]
**Pages updated:** [[ai-tools-and-frameworks]] (added Gates' macro view on AI trajectory)
**Summary:** Bill Gates' annual outlook essay (Jan 9, 2026). Key signal: child deaths under 5 rose for first time this century (4.6M→4.8M in 2025). Gates frames AI as the most transformative thing humans have ever created, with no intelligence ceiling. Two immediate risks: bioterrorism via open-source AI and job market disruption. Horizon1000 initiative (Gates Foundation + OpenAI, $50M) deploying AI in 1,000 African healthcare clinics by 2028. Also covers climate (40% emissions reduction in last decade) and education (personalized learning via AI).

## [2026-04-07] briefing | Morning Briefing — 2026-04-07

**Output:** `outputs/briefing-daily-ai-2026-04-07.md`
**Sections:** AI Tools, Tech & Advancements | AI Industry News & Shifts | World News
**Top stories:** Apfel (Apple on-device LLM CLI, HN 513pts), Qwen 3.5-9B on M4 Air (LocalLLaMA 1159 upvotes), Gemma 4 edge (sub-1.5GB, Raspberry Pi 5), MCP at 97M installs (Linux Foundation AAIF), llamafile resurgence; OpenAI/Anthropic/Google unite against Chinese distillation, Anthropic revenue $9B→$30B annualized + multi-GW compute deal, Goldman Sachs 16K AI jobs/month cut (Gen Z worst hit), AI skills power law widening; Iran war Day 38 (ceasefire rejected, Trump deadline), US pharma tariffs up to 100% (10.2% avg effective rate), Artemis II distance record, Vietnam To Lam elected president, NK daughter as heir signal.
