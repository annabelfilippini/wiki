---
title: "Post by @bcherny on X"
source: "https://x.com/bcherny/status/2044847848035156457"
author:
  - "[[@bcherny]]"
published: 2026-04-16
created: 2026-04-22
description: "Dogfooding Opus 4.7 the last few weeks, I've been feeling incredibly productive. Sharing a few tips to get more out of 4.7"
tags:
  - "clippings"
---
Dogfooding Opus 4.7 the last few weeks, I've been feeling incredibly productive. Sharing a few tips to get more out of 4.7 🧵

---

1/ Auto mode = no more permission prompts

Opus 4.7 loves doing complex, long-running tasks like deep research, refactoring code, building complex features, iterating until it hits a performance benchmark.

In the past, you either had to babysit the model while it did these sorts

![[raw/assets/4f3c2609d8d1dee1915f79fe5e0fec64_MD5.png]]

---

2/ The new /fewer-permission-prompts skill

We've also released a new /fewer-permission-prompts skill. It scans through your session history to find common bash and MCP commands that are safe but caused repeated permission prompts.

It then recommends a list of commands to add to

[code.claude.com Configure permissions - Claude Code Docs](https://t.co/VOjwuW0FJx)

---

3/ Recaps

We shipped recaps earlier this week, to prep for Opus 4.7. Recaps are short summaries for what an agent did & what's next.

Very useful when returning to a long-running session after a few minutes or a few hours.

![[raw/assets/9aa9ad145e1f20668cc41cad7e0f05f2_MD5.jpg]]

---

4/ Focus mode

I've been loving the new focus mode in the CLI, which hides all the intermediate work to just focus on the final result. The model has reached a point where I generally trust it to run the right commands and make the right edits. I just look at the final result.

![[raw/assets/d6fa9a2276c7336af922b014706cef8b_MD5.png]]

---

5/ Configure your effort level

Opus 4.7 uses adaptive thinking instead of thinking budgets. To tune the model to think more/less, we recommend tuning effort.

Use lower effort for faster responses and lower token usage. Use higher effort for the most intelligence and capability.