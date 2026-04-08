---
title: AI Tools and Frameworks
type: concept
created: 2026-04-06
updated: 2026-04-06

sources: [telegram-2026-04-06-ami-labs-world-models, telegram-2026-04-06-gates-year-ahead-2026]
tags: [ai, tools]
missing_links: []
---

# AI Tools and Frameworks

Collected knowledge on AI tools, agent architecture, and the emerging "four powers" framework for how AI creates value.

## Agent Architecture

An AI agent requires three components:
1. **Model** (LLM) -- the reasoning engine
2. **Memory** (docs, history, context) -- persistent knowledge
3. **Tools** (APIs, databases, actions) -- what the agent can do

### Prompt Structure for Agents
- **Role** -- what kind of assistant is it
- **Task** -- what is it trying to accomplish
- **Input** -- what data does it have access to
- **Tools** -- what actions can it take
- **Constraints** -- what rules should it follow
- **Output** -- what should the final result look like

## The Four Powers of AI

Framework from video notes on how AI creates value:

| Power | What It Does | Key Tools |
|-------|-------------|-----------|
| **Build** | Creating software and tools | Bolt, Cursor, Replit |
| **Automate** | AI agents and workflow automation | ChatGPT, Relevance AI, Zapier, Make.com, n8n |
| **Create** | Professional-grade content | Midjourney, DALL-E, Suno, Descript |
| **Connect** | Building influence and audience | Claude, automated outreach tools |

## Key Skills to Develop
- AI agent development (platforms: ChatGPT, Relevance AI, n8n)
- Workflow automation (Zapier, Make.com)
- Prompt engineering (Promptmetheus)
- API integration (Postman)
- AI content creation (Midjourney, DALL-E)

## Tools Worth Using
- **NotebookLM** -- organize and interact with documents via AI chat
- **Cursor** -- VS Code fork with AI code generation, smart rewrites, codebase queries
- **Recall** -- organize AI learning and research
- **Readwise Reader** -- reading and annotation
- **Brave** -- research browser
- **Bright Data MCP** -- crawlers that access websites others can't
- **Jina AI** -- web content extraction

## Agentic Revolution Timeline (Google CEO notes)
1. **Phase 1:** Agents baked into business and government processes. Adopted first by well-funded companies. Watch biomedical, financial, and startup sectors.
2. **Phase 2:** National security implications emerge (cyber attack vectors)
3. **Long-term:** Specialized AI systems may unify into something beyond human-level intelligence

## Key Insight: Model Context Protocol
Write the task you want, connect a database, and the LLM produces code. MCP is the connector layer.

## Product Ideas
- Fashion/closet AI assistant with budget constraints
- Job rejection tracker (community + analytics)
- Vibe coding agency -- turn ideas into micro-SaaS using Bolt, Lovable, Replit, Cursor
- NotebookLM as interactive due diligence platform for buyers

## Emerging Paradigms: World Models

Beyond LLMs, [[world-models]] represent a distinct AI direction — systems that simulate physical world dynamics rather than language. [[ami-labs]] raised $1.03B (Mar 2026) to build these, led by [[yann-lecun]]. AMI Labs' own CEO predicts "world models" will become the next overhyped buzzword — signaling both genuine importance and incoming hype cycle.

## Gates' View: AI Trajectory (Jan 2026)

Bill Gates' "Year Ahead 2026" ([[telegram-2026-04-06-gates-year-ahead-2026]]) adds a macro perspective:
- "AI will change society the most of anything humans have ever created"
- No upper limit on AI intelligence; will exceed human levels without plateauing
- AI already makes software devs 2x more efficient, creating "demand elasticity for code"
- Job disruption will grow significantly over next 5 years
- Biggest risk: bioterrorism via open-source AI tools (above natural pandemics)
- AI in healthcare: Horizon1000 initiative (Gates Foundation + OpenAI, $50M) deploying AI in African clinics

## Connections
- [[wayloft]] -- uses AI agent patterns (Ellis Church persona)
- [[pickleball-portal]] -- uses AI persona pattern (Pikolai)
- [[ai-persona-model]] -- the cross-cutting pattern across both businesses
- [[world-models]] -- emerging paradigm beyond LLMs
- [[ami-labs]] -- $1.03B world models company
- [[telegram-2026-04-06-gates-year-ahead-2026]] -- Gates' macro view on AI trajectory and societal impact
