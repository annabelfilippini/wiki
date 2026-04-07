---
title: "Fashion Finder Agent — Photo-to-Shopping Idea"
type: source
created: 2026-04-06
updated: 2026-04-06
author: Annabel Filippini
date: 2026-04-06
url:
tags: [telegram, product-idea, fashion, ai-agent, computer-vision]
---

# Fashion Finder Agent — Photo-to-Shopping Idea

## Key Takeaways
- Snap a photo of someone's outfit → AI identifies each clothing item → returns shopping links
- Natural language input: "this is a cute outfit, where are the clothes from?"
- Agent-based architecture: user provides image + intent, agent does the work

## How It Would Work
1. User inputs a photo (e.g., street style, Instagram screenshot, candid)
2. Computer vision identifies individual items: top, bottom, shoes, bag, accessories
3. Agent searches retailers for exact matches or closest alternatives
4. Returns shopping links with prices

## Reference Photo
Street style: cream oversized sweatshirt, navy wide-leg trousers, brown mules/clogs, Goyard-style tote bag.

## New Information
Builds on the earlier "fashion/closet AI" idea from [[apple-notes-ai-ideas]] — that version focused on wardrobe gap analysis and budget constraints. This version is more concrete: photo-in, shopping-links-out. The agent framing (vs. app framing) is notable — aligns with Annabel's current agent-building trajectory.

## Connections
- Prior art: [[apple-notes-ai-ideas]] (fashion AI with budget constraints)
- Pattern: same agent architecture as [[ellis-church]] (AI does the heavy lifting, user steers)
- Tech stack: would need computer vision (item segmentation), product search API, and affiliate links ([[affiliate-revenue-model]])
