# atomicOps AIOS

AI Operating System for solopreneurs and consultants. 28 skills across 4 business engines (Acquisition, Delivery, Support, Operations).

## Install

```bash
# From ZIP
claude --plugin-dir /path/to/atomicops-aios

# Or copy to your plugins directory
cp -r atomicops-aios ~/.claude/plugins/atomicops-aios
```

## First Run

```
/business-setup
```

One conversation captures your business identity, voice, offer, ICP, sales process, tools, and goals. Writes all context files so every skill knows who you are.

Then map your first business function:

```
/pod-mapper
```

## What's Included

### Acquisition (13 skills)
| Skill | What it does |
|---|---|
| `/research-lead` | Research prospects and generate personalised outreach |
| `/meeting-prep` | Pre-call research briefs and CLOSER battle cards |
| `/sales-closer` | Sales scripts, objection playbooks, battle cards |
| `/call-digest` | Process call transcripts into structured intelligence |
| `/proposal-generator` | Generate proposals and SOWs from call data |
| `/offer-engine` | Build offers, pricing, guarantees, value stacks |
| `/youtube-content` | Full YouTube pipeline — ideate, prep, post-publish |
| `/linkedin-content` | LinkedIn posts, carousels, weekly calendar |
| `/competitor-analysis` | Monitor competitor YouTube channels |
| `/ai-news-monitor` | Scored AI news from HN, GitHub, Reddit |
| `/youtube-seo` | Trend detection and rising keyword monitoring |
| `/thumbnail-generator` | Collaborative thumbnail design process |
| `/ai-seo` | AI search visibility auditing and optimisation |

### Delivery (5 skills)
| Skill | What it does |
|---|---|
| `/build-app` | Full-stack apps (ATLAS framework) |
| `/build-frontend` | Animated frontends (STAGE framework) |
| `/playwright-tester` | Automated UI testing |
| `/excalidraw-diagram` | Visual architecture diagrams |
| `/gamma-slides` | Generate slide decks from markdown |

### Support (2 skills)
| Skill | What it does |
|---|---|
| `/email-digest` | Gmail inbox triage — Urgent/Respond/Delegate/Archive |
| `/telegram` | Telegram bot for mobile access |

### Operations (8 skills)
| Skill | What it does |
|---|---|
| `/daily-brief` | Morning intelligence briefing (tasks, emails, news, competitors) |
| `/weekly-review` | Structured weekly business review |
| `/aios-health-check` | System diagnostics — checks everything is working |
| `/priority-focus` | Guided prioritisation to find your single highest-leverage focus |
| `/why-filter` | CBT-inspired filter for AI overwhelm and FOMO |
| `/augmentation-planner` | 30/60/90 day execution plans for levelling up |
| `/video-edit` | AI video editing — silence removal, audio mastering, chapters, transcription |
| `/business-setup` | AIOS onboarding wizard — configures the entire system |

### Planning Tools (free)
| Skill | What it does |
|---|---|
| `/pod-mapper` | Interactive workflow audit — map a business function, identify waste, translate to skills |
| `/business-setup` | One-time onboarding — captures business identity, writes all context files |

### Safety
- **Bash safety guard** — PreToolUse hook blocks destructive commands (rm -rf, force push, DROP TABLE, etc.)
- **Guardrails** — Rules preventing unauthorised external communications, credential exposure, and data loss

## Context Files

After running `/business-setup`, these files power every skill:

| File | Purpose |
|---|---|
| `context/my-business.md` | Business identity, stage, challenges |
| `context/my-voice.md` | Communication style, phrases, anti-patterns |
| `context/my-icp.md` | Ideal client profile and buying signals |
| `context/gtm-profile.md` | GTM configuration — offer, tools, sales process |

Templates are in `templates/` if you want to create these manually.

## 4 Business Engines → 4 Cowork Projects

Best used with separate Cowork Projects per business function, all pointing at the same workspace folder:

| Cowork Project | What it handles |
|---|---|
| **Acquisition** | Leads, outreach, calls, proposals, content, competitors, SEO |
| **Delivery** | Apps, frontends, testing, diagrams, presentations |
| **Support** | Email triage, client communication, Telegram |
| **Operations** | Daily brief, weekly review, health check, planning |

All skills are available in every project. The project sets the memory and context scope.

## Scheduling

| Time | Skill | Purpose |
|---|---|---|
| 6:00am | `/competitor-analysis` | Scan competitor channels |
| 6:00am | `/ai-news-monitor` | Score AI news |
| 6:00am | `/youtube-seo` | Detect rising trends |
| 7:00am | `/research-lead` | Enrich new leads |
| 7:00am | `/email-digest` | Triage inbox |
| 7:30am | `/daily-brief` | Synthesise everything → Telegram |
| Mon 8am | `/weekly-review` | Weekly metrics and priorities |
| Sun 9pm | `/aios-health-check` | System health audit |

Use `/schedule` (cloud tasks, laptop can be off) or Cowork's built-in scheduler.

## Requirements

- Claude Pro, Max, Team, or Enterprise subscription
- MCP connectors as needed: Gmail, ClickUp, YouTube Analytics, Supabase, Apollo, Firecrawl, Perplexity

## License

MIT

## Author

Mansel Scheffel — [atomicops.io](https://atomicops.io)
