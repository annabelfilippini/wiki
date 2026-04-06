---
title: "Pickleball Portal Architecture"
type: source
created: 2026-04-05
updated: 2026-04-05
author: Annabel Filippini
date: 2026-03-31
url: ""
tags: [pbp, architecture, technical]
---

# Pickleball Portal Architecture

## Key Takeaways
- Next.js 15 on Vercel behind Cloudflare (CDN + DNS)
- Articles: 409 Markdown files in `content/posts/` — no database for content
- Paddle data in Supabase (Postgres)
- Images: Cloudinary (account `dfizq1up6`, shared across Tom's ventures). Auto WebP, on-the-fly resize.
- Two email systems: Resend (transactional) + [[beehiiv]] (newsletter, 2,219 subscribers as of March 2026)
- [[pikolai-starostin]] "writes" the newsletter
- Google Auth via Supabase — no passwords
- Cron jobs: fetch-news (6 AM daily), check-price-alerts (2 PM daily)
- Known issues: GA4 ID wrong in .env.local, IndexNow broken (Next.js catch-all intercepts), ~111 articles need SEO rewrites

## Conflicts
- Says "Next.js 16" in one place — all other docs say Next.js 15 (likely typo)
- Article count: 409 here vs 303 in PRD (Feb 18). Growth between dates, or different counting method.
