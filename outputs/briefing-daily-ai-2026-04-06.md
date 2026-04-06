---
title: 'Morning Briefing — 2026-04-06'
type: synthesis
created: 2026-04-06
updated: 2026-04-06
scan_type: daily-ai
sources: []
tags: [briefing, daily-ai]
---

# Morning Briefing — 2026-04-06

## Hot AI Tools & Resources

1. **Apfel — Apple's on-device LLM, finally usable** — A new Swift tool exposing Apple's built-in Foundation Model as a CLI, interactive chat, and OpenAI-compatible local server on Apple Silicon. No API keys, no subscription, no cloud. Cleared 513 points and 117 comments on HN this week, which for an on-device tool is a strong signal. If you're on an M-series Mac, this is the zero-cost local inference stack. ([Hacker News via Insights](https://insights.marvin-42.com/articles/hacker-news-pushes-apfel-as-a-local-ai-front-door-for-apple-silicon))

2. **Qwen 3.5-9B on MacBook Air M4, 20K context** — A patched llama.cpp build running Qwen 3.5-9B with a 20,000-token context window on a base M4 MacBook Air (16GB RAM) hit 1,159 upvotes and 193 comments on r/LocalLLaMA. That's a lot of signal: the local inference barrier just dropped again. A 9B model at 20K context, no GPU, is genuinely useful for Second Brain-style tasks. ([r/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/))

3. **MCP hits 97M installs — it's the standard now** — Anthropic's Model Context Protocol crossed 97M installs on March 25, with 5,800+ community and enterprise servers in production. Every major AI vendor (OpenAI, Google, Microsoft, AWS, Cloudflare) is now backing it through the Linux Foundation's Agentic AI Foundation. This isn't a protocol anymore — it's the plumbing. If you're building anything agentic, you're building on MCP. ([AI Unfiltered](https://www.arturmarkus.com/anthropics-model-context-protocol-hits-97-million-installs-on-march-25-mcp-transitions-from-experimental-to-foundation-layer-for-agentic-ai/) | [byteiota](https://byteiota.com/model-context-protocol-hits-97m-installs-standard-wins/))

4. **Meta's Llama 4 Scout + Maverick — best open-weights yet** — Released April 5. Maverick (400B total / 17B active, MoE) beats GPT-4o and Gemini 2.0 Flash on multimodal benchmarks. Scout has a **10M token context window** — the largest of any open-weight model — trained on 30T tokens across 200 languages. Apache 2.0. For Second Brain: this is the first self-hostable model that could compete with Sonnet 4.6 on long-context wiki tasks. ([Meta AI Blog](https://ai.meta.com/blog/llama-4-multimodal-intelligence/))

5. **Aider — Reddit's pick for AI coding without the lock-in** — Consistently coming up as the preferred AI coding tool for developers who don't want Cursor's subscription or Claude Code's API costs. Integrates with whatever IDE you already use, explains every diff, and doesn't try to own your workflow. Low hype, high utility. ([r/LocalLLaMA via AI Tool Discovery](https://www.aitooldiscovery.com/guides/best-ai-agents-reddit))

---

## AI Industry News

1. **Anthropic's Claude Mythos leaked — 10T parameters, new tier above Opus** — A configuration error exposed ~3,000 unpublished Anthropic assets, including a draft blog post for "Claude Mythos" (internal codename: Capybara). The model is described as "a step change" and "by far the most powerful we've ever developed." It adds a fourth product tier above Opus — larger, more expensive, currently in limited early access with cybersecurity partners. Notably, Anthropic's own draft flags the model as posing "unprecedented cybersecurity risks." No public launch date. ([Fortune](https://fortune.com/2026/03/26/anthropic-says-testing-mythos-powerful-new-ai-model-after-data-leak-reveals-its-existence-step-change-in-capabilities/) | [Dataconomy](https://dataconomy.com/2026/04/02/anthropic-tests-claude-mythos-as-its-most-powerful-ai-model/) | [Axios](https://www.axios.com/2026/03/29/claude-mythos-anthropic-cyberattack-ai-agents))

2. **ChatGPT drops below 40% mobile DAU share for the first time** — Six months ago ChatGPT held 52% of daily active users on mobile. In March 2026, it fell to 38.7% — the fourth consecutive monthly drop. Google Gemini now holds ~25% DAU. Claude's power users are spending **139 minutes/day** in the app with only 12% churn, and Claude wins ~70% of head-to-head enterprise deals against OpenAI. Grok is at 15.2% (up from 1.6% a year ago). The "one AI to rule them all" era is over. ([Apptopia](https://apptopia.com/en/insights/gen-ai-chatbots-april-2026-apptopia-data-brief-chatgpt-drops-below-40-market-share/) | [eMarketer](https://www.emarketer.com/content/gemini-gains-ground-chatgpt-25-dau-share-claude-churn-drops))

3. **OpenAI closes $122B round at $852B valuation, GPT-5.5 "Spud" pretraining complete** — OpenAI is on a clear IPO track for late 2026, generating $25B ARR. GPT-5.5 (codename Spud) has completed pretraining and is in safety evaluation — release expected within weeks. GPT-5.4 mini is rolling out free as a fallback model. The company is betting the IPO on consumer dominance even as enterprise share slips. ([humai.blog](https://www.humai.blog/openai-makes-25-billion-a-year-and-is-preparing-for-an-ipo-here-is-what-the-numbers-actually-mean/))

4. **Anthropic ends flat-subscription coverage for third-party agentic tools** — Effective April 4, Claude Pro and Max subscriptions no longer cover OpenClaw and similar third-party agentic wrappers. Extra usage requires pay-as-you-go API access. The Batches API got a positive: max_tokens raised to 300K on Opus 4.6 and Sonnet 4.6 — useful for long-form generation tasks. ([TechCrunch](https://techcrunch.com/2026/04/04/anthropic-says-claude-code-subscribers-will-need-to-pay-extra-for-openclaw-support/))

---

## World News

1. **Iran rejects ceasefire as Trump's Strait of Hormuz deadline hits Tuesday** — Now in week 6 of the US-Israel war on Iran, Tehran rejected a 45-day ceasefire proposal from Egyptian, Pakistani, and Turkish mediators. Iran's position: "We only accept an end of the war with guarantees we won't be attacked again" — a permanent settlement, not a pause. Trump set a Tuesday deadline for Iran to reopen the Strait of Hormuz, threatening strikes on power plants and bridges ("Power Plant Day, and Bridge Day, all wrapped up in one"). The Strait has been effectively closed since February 28, when joint US-Israel strikes began. Israel separately killed the IRGC's head of intelligence overnight. Iran shot down two American military jets during the conflict. ([CNN](https://www.cnn.com/2026/04/06/world/live-news/iran-war-us-trump-oil) | [Bloomberg](https://www.bloomberg.com/news/articles/2026-04-06/iran-rejects-ceasefire-before-trump-ultimatum-expires-on-hormuz) | [NPR](https://www.npr.org/2026/04/06/nx-s1-5775383/iran-war-updates) | [Al Jazeera](https://www.aljazeera.com/news/liveblog/2026/4/6/iran-war-live-tehran-rejects-trumps-tuesday-deadline-on-strait-of-hormuz))

2. **Artemis II makes lunar flyby today — first humans near the Moon since 1972** — NASA's four-person crew (Reid Wiseman, Victor Glover, Christina Koch, Jeremy Hansen) launched April 1 and is making a free-return flyby of the Moon today. At 1:56 p.m. EDT, they surpassed the all-time human distance record set by Apollo 13 in 1970. Closest lunar approach at 4,070 miles at 7:02 p.m. No landing on this mission — the purpose is validating Orion's life support and systems before a crewed landing attempt. ([NASA](https://www.nasa.gov/blogs/missions/2026/04/05/artemis-ii-flight-day-5-correction-burn-complete/) | [Space.com](https://www.space.com/news/live/artemis-2-nasa-moon-mission-updates-april-6-2026))

3. **US tariff situation: IEEPA struck down, 15% global tariff now in effect** — In February, the Supreme Court ruled the administration's IEEPA-based sweeping tariffs unconstitutional. The administration pivoted to Section 122 of the Trade Act of 1974, imposing a temporary 15% universal global tariff on February 24. USMCA imports got an indefinite exemption extended April 2. Global trade response: other countries routed trade around the US, and global trade grew faster than the world economy despite the highest US tariff rates since WWII. Both US imports and Chinese exports reached all-time highs. ([CNBC](https://www.cnbc.com/2026/04/03/trump-tariffs-trade-war-impact.html) | [Tax Foundation](https://taxfoundation.org/research/all/federal/trump-tariffs-trade-war/) | [Marketplace](https://www.marketplace.org/story/2026/04/01/after-tariffs-global-trade-moves-on-without-us))

4. **Bangladesh declares measles emergency — 130+ children dead in six weeks** — Bangladesh launched an emergency MMR vaccination campaign after health data showed at least 130 children have died from measles since late February, with cases concentrated in Cox's Bazar among Rohingya refugee populations. The outbreak highlights a broader pattern: routine childhood vaccination rates dropped globally during COVID and have not fully recovered. ([CNN](https://www.cnn.com/2026/04/06/world/live-news/iran-war-us-trump-oil) | [Vindicator](https://www.vindy.com/news/national-news/2026/04/nation-and-world-at-a-glance-for-april-6/))

---

## Raw Sources
- [CNN Iran War Live](https://www.cnn.com/2026/04/06/world/live-news/iran-war-us-trump-oil) — Primary live coverage of Iran ceasefire rejection and Hormuz deadline
- [Bloomberg Iran Ceasefire](https://www.bloomberg.com/news/articles/2026-04-06/iran-rejects-ceasefire-before-trump-ultimatum-expires-on-hormuz) — Included for financial/geopolitical framing of Hormuz closure impact
- [NPR Iran Updates](https://www.npr.org/2026/04/06/nx-s1-5775383/iran-war-updates) — Context on diplomatic negotiations
- [NASA Artemis II](https://www.nasa.gov/blogs/missions/2026/04/05/artemis-ii-flight-day-5-correction-burn-complete/) — Official mission updates
- [Space.com Artemis II](https://www.space.com/news/live/artemis-2-nasa-moon-mission-updates-april-6-2026) — Live coverage of lunar flyby
- [CNBC Tariffs](https://www.cnbc.com/2026/04/03/trump-tariffs-trade-war-impact.html) — Tariff war impact analysis
- [Tax Foundation Tariff Tracker](https://taxfoundation.org/research/all/federal/trump-tariffs-trade-war/) — Comprehensive tariff timeline and numbers
- [Marketplace Tariffs](https://www.marketplace.org/story/2026/04/01/after-tariffs-global-trade-moves-on-without-us) — Global trade rerouting story
- [Fortune Mythos Leak](https://fortune.com/2026/03/26/anthropic-says-testing-mythos-powerful-new-ai-model-after-data-leak-reveals-its-existence-step-change-in-capabilities/) — First major coverage of Anthropic Mythos leak
- [Apptopia ChatGPT Share](https://apptopia.com/en/insights/gen-ai-chatbots-april-2026-apptopia-data-brief-chatgpt-drops-below-40-market-share/) — Mobile DAU market share data
- [eMarketer Claude Churn](https://www.emarketer.com/content/gemini-gains-ground-chatgpt-25-dau-share-claude-churn-drops) — Claude engagement and churn metrics
- [humai.blog OpenAI](https://www.humai.blog/openai-makes-25-billion-a-year-and-is-preparing-for-an-ipo-here-is-what-the-numbers-actually-mean/) — OpenAI financials and IPO track analysis
- [MCP 97M Installs](https://www.arturmarkus.com/anthropics-model-context-protocol-hits-97-million-installs-on-march-25-mcp-transitions-from-experimental-to-foundation-layer-for-agentic-ai/) — MCP adoption milestone
- [Meta Llama 4 Blog](https://ai.meta.com/blog/llama-4-multimodal-intelligence/) — Official Llama 4 Scout and Maverick announcement
- [Apfel on HN](https://insights.marvin-42.com/articles/hacker-news-pushes-apfel-as-a-local-ai-front-door-for-apple-silicon) — Apfel HN discussion coverage
- [r/LocalLLaMA Qwen on M4](https://www.reddit.com/r/LocalLLaMA/) — Community thread on llama.cpp + Qwen 3.5-9B M4 benchmark
