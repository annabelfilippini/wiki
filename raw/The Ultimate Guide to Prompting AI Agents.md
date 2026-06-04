---
title: "The Ultimate Guide to Prompting AI Agents"
source: "https://x.com/mattshumer_/status/2046738742161949135"
author:
  - "[[@mattshumer_]]"
published: 2026-04-21
created: 2026-04-22
description: "I've spent the last seven years prompting AI systems, and I've tried just about every approach you can imagine.Today, I'm sharing my framewo..."
tags:
  - "clippings"
---
![[raw/assets/a0b62e0060b4b9b9eb9c7785fec0ff84_MD5.jpg]]

I've spent the last seven years prompting AI systems, and I've tried just about every approach you can imagine.

**Today, I'm sharing my framework for getting the most out of AI agents.**

Prompting an AI agent isn't the same as prompting a chatbot. A chatbot answers. An agent works. It can read your files, write code, run tests, open a browser, take screenshots, and iterate on its own output until it's perfect. It can spend an hour on a task and come back with something real.

But only if you tell it what "real" means.

The biggest mistake I see is people prompting agents the way they used to prompt chatbots: they give it a sentence-long instruction, and out comes a generic answer. But agents don't need a sentence. They need a brief.

In this post I'll walk you through the framework I use to write briefs that actually get good work out of an agent. I call it the 3 C's: context, constraints, and composition.

## 1\. Context

Context is everything the agent needs to know to do the job, plus everything it needs access to. That includes the situation, the goal, the audience, and what success looks like. But it also includes the actual materials. The deck. The data file. The brand guidelines. The previous version. The repo. The relevant documentation. Whatever the agent will be touching, it should know it exists and where to find it.

Most people dramatically under-context their agents. They'll ask one to "make a deck about Q3" without sharing last quarter's deck for reference. They'll ask it to "analyze the user feedback" without specifying which file, what segment, or what decision the analysis is supposed to inform. They'll ask it to "refactor the auth module" without pointing it at the existing tests, the team's style guide, or the design doc the module is supposed to follow.

So the agent guesses. And when an agent guesses, you usually don't notice until it's an hour deep into the wrong thing.

Compare these two prompts:

> **Bad:** Analyze our customer feedback.

> **Better:** Analyze the customer feedback in /data/feedback\_q3.csv. The goal is to surface the top three reasons SMB customers churned this quarter, with representative quotes. We're trying to decide whether to invest in onboarding fixes or in pricing changes, so the analysis should help us pick. There's a previous version of this analysis at /docs/feedback\_q2.md that you can use as a template for structure.

The second prompt does two things. It tells the agent what the job is, and it tells the agent where to find everything it needs to do the job. Both matter.

**The intern test.** I use a simple test to check whether I've given enough context. Imagine an intern shows up on their first day and you hand them this prompt as their assignment. Could they get to work without coming back to ask you anything? If yes, the brief is probably complete. If no, your agent has the same questions the intern would. The agent just won't ask them. It'll likely guess.

## 2\. Constraints

This is where prompting agents diverges most from prompting chatbots. Constraints aren't just rules about the answer. They're the verification approach. They describe how the agent should check its own work as it goes, and what counts as actually being done.

Agents can run code. They can open files. They can take screenshots. They can re-read their own output and notice mistakes. So your constraints should **make them do those things.**

A weak constraint is "don't make things up." A real constraint says:

> After generating the slides, open the file, screenshot every slide, and check that the layout actually looks polished. If anything is misaligned, off-template, or has overflowing text, fix it and re-check.

> After drafting the report, open every cited URL and verify that the source actually says what you claim it says. Remove any claim you can't directly support.

> Before writing any production code, build a test harness that exercises the public API. Don't claim you're finished until every test passes.

> After refactoring, run the full test suite. If something that was passing now fails, you broke it. Don't stop until the suite is green again.

These aren't suggestions. They're stopping conditions. The agent is allowed to declare itself done when, and only when, those conditions are met.

This matters because of how agents tend to fail. They rarely produce obviously wrong work. They can produce plausible-looking work and confidently announce they're done (though this gets less and less likely every month as models improve). The slide deck opens to nine slides of overflowing text. The research summary has three citations that don't say what the agent claims they say. The refactor compiles and broke three tests the agent never re-ran. In every case the agent told you it was finished. It just hadn't actually verified anything.

You prevent that by making verification part of the work, not an optional afterthought.

A few patterns worth stealing:

- After producing a file, open it and confirm it actually looks the way you described.
- Before declaring done, list everything you didn't verify, and check those things.
- If you're unsure about something, say so explicitly instead of picking the most plausible guess.
- After making a change, re-run the checks that were passing before. Anything that broke should be fixed before returning to me.
- Build the test harness before starting on the implementation. Don't finish until every test passes.

The shift here is from "follow these rules while you write" to "complete this work, including the verification, and then tell me what you did and didn't check."

## 3\. Composition

Composition is how you want the deliverable **structured**, and it's the most underrated of the three. Agents can produce great work, but if you don't tell them what shape it should take, they'll usually default to whatever the model has seen most often. That's almost never what you actually want.

Specify the shape, for example:

> A one-page memo with these specific sections.

> A deck with one slide per insight, plus a summary slide at the end.

> A markdown file with a comparison table on top and a short narrative below.

> A JSON object with these exact fields.

Format matters because format changes thinking. An agent told to produce "an analysis" will write paragraphs. An agent told to produce "a one-page memo with a recommendation, three supporting reasons, and the strongest counterargument" will actually structure the work that way as it goes.

Instead of asking "what should I do?", ask for the answer in a specific shape, like:

> Format the answer as: - My recommendation - Why this is the best option - The strongest counterargument - What would change my mind

## A reusable template

Here's a template you can adapt to almost any agent task:

> **Context:** \[the situation, audience, background\] \[the files, repos, docs, or data the agent will work with\] \[anything else that defines the standard\] **Your task:** \[the specific thing you want produced or done\]. **Constraints:** \[rule 1\] \[rule 2\] **Verification (don't finish until):** \[open the artifact and confirm X\] \[run the check Y and confirm it passes\] **Output format:** \[shape of the deliverable\] \[length, tone, style if relevant\]

And here's a real version, filled in:

> **Context:** Source data is in /data/q3\_metrics.csv. Last quarter's deck is at /decks/q2\_board.pptx. Match its structure and style. Brand template is at /templates/brand\_deck.pptx. Audience is six board members, mostly investors. They care about growth, burn, and any change in trajectory. The big story is that we missed revenue but improved retention. The deck needs to be honest about both. **Your task:** Build the Q3 board deck end-to-end. **Constraints:** One headline number per slide. No more than 12 slides. Use a chart only when a chart adds something a sentence can't. **Verification (don't finish until):** You've opened every slide and confirmed nothing overflows the template. Every number on every slide reconciles to the source data. You've flagged any slide where the story is ambiguous and I should sanity-check the framing. **Output format:** A finished .pptx using the brand template. A short text summary (8-10 sentences) of the narrative arc and any judgment calls you had to make.

That brief will get you a real board deck. "Make me a Q3 deck" will get you twelve slides of disconnected charts and a narrative that quietly avoids the misses.

## Why this matters more for agents

Chatbots could be sloppy and you'd notice in the answer, within a few seconds. Agents can be sloppy and you might not notice until the deck is sent, the report is in front of your boss, or the change is merged. They take real actions. Their mistakes have real surface area.

So the prompt has to do more work. It has to give the agent enough context to do the job, enough verification to trust the result, and enough structure that the deliverable comes out shaped the way you can actually use it.

The skill is shifting from "prompt engineering" to "task specification." You're writing a brief for someone who can do real work but doesn't know your team's standards, your previous decisions, or what "done" looks like to you. That brief is the lever.

## Bad prompting vs. good prompting

A few side-by-side examples make it concrete.

For a **deck**, the bad version is "make me a deck about Q3 results." The good version is: "Build a deck on Q3 results for our exec team meeting next Tuesday. Source data is in /data/q3\_metrics.csv. Last quarter's deck is at /decks/q2\_review.pptx. Match its style and structure. After generating, open every slide, screenshot it, and confirm the layout looks clean. Flag any slide where the data is ambiguous or the chart doesn't tell a clear story."

For a **research task**, the bad version is "research what our top three competitors are doing on pricing." The good version is: "Research current pricing pages for \[Competitor A\], \[Competitor B\], and \[Competitor C\]. For each, capture the tier names, prices, included seats, and any notable add-ons or restrictions. Visit each site directly and screenshot the pricing page as evidence. Don't include anything you couldn't verify on the live page. Output a single comparison table plus a short paragraph on what's different from our current pricing."

For a **content draft**, the bad version is "write me a launch announcement." The good version is: "Draft a launch announcement for the new export-to-CSV feature, aimed at existing customers on the Pro plan. Tone should match the last three posts on our blog (linked). Keep it under 300 words. Lead with the user benefit, not the feature. After drafting, re-read it once and cut anything that sounds like marketing fluff. Give me the final version plus a one-line summary of what you cut and why."

For a **code change**, the bad version is "fix the bug in the checkout flow." The good version is: "There's a bug in the checkout flow where the cart total doesn't update when a coupon is removed. Repro is in ticket #4421. The relevant code is in /src/cart. Existing tests are in /tests/cart. Add a failing test that reproduces the bug, fix it, and don't finish until the full cart test suite passes. Open a PR with the test, the fix, and a one-paragraph explanation of the root cause."

## The most important phrase

The single highest-leverage phrase in agent prompting is don't finish until. Use it constantly.

Don't finish until you've opened the file and confirmed it looks right. Don't finish until every cited source has been verified. Don't finish until you've listed what you didn't check. Don't finish until the tests pass. Don't finish until the linter is green.

It works because it changes what "done" means. Without it, the agent is done when it has produced a thing. With it, the agent is done when it has produced a thing and confirmed the thing is correct. Those are very different stopping conditions, and the gap between them is where almost all agent failure lives.

## Pulling it together

The 3 C's aren't really a formula. They're a checklist for being specific. Have you given the agent the situation and the materials? Have you told it how to verify its own work and what counts as done? Have you described what the deliverable should look like? If yes, the output is usually good. If no, it usually isn't.

Working with agents has started to feel less like typing into a chatbot and more like briefing a contractor who can do the job but has never met you. The thing that pays off is being able to write that brief well: clear enough that the work gets done, specific enough that you can trust the result. Most of what people now call prompt engineering is really just that.

If you've made it this far, try [https://agent-s.app](https://agent-s.app/), which does most of this automatically. It's the most powerful agent in the world, but it's so simple that my mom uses it daily.

And send this to a friend who might find it useful!