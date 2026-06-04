---
title: "Master ALL 7 Levels of Claude Code Memory"
source: "https://www.youtube.com/watch?v=OMkdlwZxSt8&t=52s"
author:
  - "[[Mark Kashef]]"
published: 2026-04-22
created: 2026-04-29
description: "Master Claude Code: https://www.skool.com/earlyaidopters/aboutGrab the Memory Architect Kit (FREE): https://markkashef.gumroad.com/l/claude-memory-architect-kit---There are 35+ open source memor"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=OMkdlwZxSt8)

Master Claude Code: https://www.skool.com/earlyaidopters/about  
  
Grab the Memory Architect Kit (FREE): https://markkashef.gumroad.com/l/claude-memory-architect-kit  
  
\---  
  
There are 35+ open source memory systems for Claude Code. Every one of them says "this is the best approach." But memory is like a fingerprint. No two should look the same.  
  
In this video, I walk you through how to plan, design, and build your own memory system that's tailored to how you work. I show you the technique of cloning repos, auditing them with Claude Code, and cherry-picking the patterns that fit. Then I hand you a skill that interviews you, teaches you the memory building blocks, and builds the whole thing for you.  
  
Whether you're technical or not, this will change how you think about memory.  
  
\---  
  
0:00 - This is Your Brain  
0:58 - The Problem with Memory  
1:52 - Memory is a Fingerprint  
2:43 - Memory is an Infinite Game  
3:05 - The 3-Step Technique  
3:43 - Demo: Clone & Audit Repos  
5:01 - Comparing the Frameworks  
6:10 - Extracting What Matters  
7:25 - Your Lightweight Memory Spec  
8:15 - The Memory Building Blocks  
9:28 - Decay & Promotion  
9:55 - Multi-Signal Retrieval  
10:29 - The Memory Architect Skill  
10:45 - Salience, Disclosure & Compaction  
11:50 - Skill Demo: /memory-architect  
13:17 - Memory Stack Education  
14:40 - Your Memory Recipe  
14:56 - How to Inject Memory  
15:52 - Approach 1: CLAUDE.md  
16:08 - Approach 2: Hooks  
16:33 - Approach 3: Agent-Scoped  
18:16 - Build Complete  
18:43 - Wiring Hooks  
19:31 - The Payoff: "Who Am I?"  
19:55 - Closing  
  
\---  
  
Book a Consultation: https://calendly.com/d/crfp-qz3-m4z  
  
#claudecode #memory #obsidian #claudecodememory #memorypalace #claudecodeskills #aimemory #claudecodeai #secondbrain #aiproductivity #claudecodetutorial #memoryarchitect #agenticmemory #claudecodeobsidian

## Transcript

### This is Your Brain

**0:00** · So, this is your brain. Well, not exactly your brain, but some version of it. In reality, your brain and my brain are very similar, but they're not the same. They're wired differently. \[music\] They shoot signals at different times for different reasons. And when it comes to memory, even that isn't exactly the same, which is why when it comes to Claude Code, even though there are tons of open repositories claiming to be \[music\] the king of memory, there will be no perfect fit for everybody.

**0:25** · The perfect memory system that's tailored to what you do day in and day out doesn't exist off the shelf. But, this is something that with the right strategy, you could build yourself. So, the goal of this video isn't to show you some shiny new framework that will apply to everybody. Instead, I'm going to show you how you can plan, design, and build the perfect memory system that is tailored to your day-to-day workflows.

**0:49** · \[music\] And even if you're non-technical, as long as you have a Claude Code account and an open mind, you can do this, too. If I piqued your interest, then let's get into it. So, this here is the crux of the problem.

### The Problem with Memory

**1:00** · You have a variety, you have a surplus of different ways to implement memory in Claude Code because out of the box, Claude Code does have memory, it can even dream. But, even when it comes to transactional stuff, it's not the best.

**1:13** · And as you'd expect, the Claude Code team builds for the masses, they don't build for you. So, if you want something perfectly sculpted to your specifications, then we can build it and layer it on top of the existing memory.

**1:25** · So, instead of trying to replace the Claude Code memory, which naturally will get better over time, we are always trying to complement it in a way that your framework doesn't become obsolete.

**1:35** · And instead of getting tribal and saying, "I am team Mem Palace." or "I am team Claud Mem." or "I'm even team Claud Sidian." the intersection of Claude Code and Obsidian, you can have it all. And really, when it comes down to it, you might not need 90% of what is in these repos. Now, some of these use vector databases, others use graphs, and others just use markdown files. And again, it's about what modalities make sense for you. And I've already alluded to the fact that memory is like a fingerprint.

### Memory is a Fingerprint

**2:05** · No two memory systems look exactly the same. So, if we take someone that runs a high-volume e-comm business, what they're worried about are seasonal patterns, consumer demand, the performance of things like meta ads. And when it comes to someone else, like a wealth manager, they'll be concerned with very different things, very deep relationships that are much fewer in quantity, but much deeper in value. And a lawyer would be concerned with a whole different set of things, like precedent recall, case history, examples of things that have worked and have not worked for their clients before.

**2:37** · So, the question isn't what repo should I adopt, it should be, "What does my memory system need to look like?" And I find a lot of misleading advice on YouTube telling you that once you figure out this one memory system, it will unlock superpowers forever. In reality, memory is an infinite game, it's not a finite one.

### Memory is an Infinite Game

**2:57** · So, the moment you finish it, the job is to maintain and iterate on it as you evolve, your business evolves, and your day-to-day evolves as well. This is why I'm going to go through the very simple process that only takes three steps to get started. And these steps are to clone existing GitHub repositories, then

### The 3-Step Technique

**3:14** · feed them to Claude Code to audit them, compare them, contrast them in full, and once you really convey what your use cases are and what your memory palace should look like, then Claude Code can extract all the design patterns, all the code necessary to start building your memory system. And then it really comes down to, how do you inject this memory into your day-to-day Claude use? So, let's take this technique for a spin.

**3:38** · All we need are these three existing repos right here. Theoretically, you could add five, 10, 15 all at once. And all we're going to do is, we're going to take each GitHub repository URL, give it to Claude Code, and say, "Do a full deep dive and do a compare and contrast on all of these repos." So, I've added all three links right here, and I've asked Claude Code to clone the following repositories. And all we have to do is add one additional line.

### Demo: Clone & Audit Repos

**4:05** · Spin up a series of explore sub-agents to go through each and every one of these repos, pull out all the design patterns, all the interesting code, and anything that you find consequential or novel about managing memory with agentic tools.

**4:20** · So, it could be more than one line, maybe a couple lines if you zoom in. And then we send that over, and now what it will do is, it will not only clone using bash each one of these repositories, and then it will populate, as you see here, immediately, each folder with the associated code. And once that's ready to go, it will then spin up its sub-agents to take a very close look as to what's happening underneath the hood.

**4:43** · And moments later, we have three background agents that are launched.

**4:46** · They'll take anywhere between 1 to 5 to 10 minutes to do a full deep dive exploration, and the best part is, because these are sub-agents, all of this context, all this exploration will happen elsewhere, and all we'll have in our context window are the core results.

### Comparing the Frameworks

**5:01** · In 5 minutes into the future, we have all the agents return with full completion, and we have a report below that compares and contrasts each one of these frameworks. So, if we scroll down, you can see right away, between Mem Palace, Claud Sidian, and Mem Zero, Mem Zero is very vector database-based.

**5:19** · Claud Sidian is just purely markdown files, while Mem Palace is also a version of vector database memory, but it's using a very light database called Chroma DB. And naturally, as you scroll down, there will be infinitely detail that I won't run you through since you can do this on your own, but the whole point is that you can get the full lay of the land for each one of these frameworks. But then, what do we do next? And by the way, if you enjoy the way I walk through these concepts on YouTube and it leaves you craving more and more depth, then you want to make sure you check out my Claude Code Magic Course.

**5:51** · That's a living course, meaning as things get deprecated or as things get obsolete, I keep replacing them and adding more exclusive content. You'll be able to find this and all of my other courses, including my personal assistant Claude Code system, in my early adopter's \[music\] community. So, if that interests you, check out the first link in the description below. All right, back to the video. Now that we know exactly what these frameworks are and how they work, the next step is deciding what matters and extracting that. So, this is the part where you jump in and you add some context.

### Extracting What Matters

**6:21** · So, in Claude Code, I'm going to use a very mini version of this, but ideally, you should vent between 3, 5, 10 minutes all of the context of your day-to-day, all of the things that you wish could be remembered and how you'd like them to be remembered. So, I can say something like this.

**6:37** · Okay, so I want to design this memory that ideally runs very light on my computer. It could be something like a SQL Lite. But, the main thing is, I want to have some memories that fade over time, some that persist, and I want to be able to always look up a memory using semantics. But, I don't want it to be too in-depth. I don't need a nuclear bomb for a fist fight. So, can you come up with the most simple and elegant series of memory frameworks or memory paradigms that you can derive from all of these repos that you explored?

**7:05** · Now, a little bit verbose, you could say this in any permutation you want, but the TLDR is, can you explore everything you just analyzed and apply it to my scenario?

**7:17** · So, once we send this off, Claude will think through, "What is the path of least resistance to create our own derivative memory system?" And then we get back a very simplistic plan, and it's labeled a lightweight memory spec, and it says pulling only what fits a laptop and a fist fight. It walks you through the stack and it says you probably only need some form of small, local embedding framework for the vector database. It walks through what the memory table would look like, the core paradigms, maybe a two-tier memory system with some form of decay of some memories.

### Your Lightweight Memory Spec

**7:47** · And then as you go down, it walks through how it's going to add memories over time and clean them up, and then some form of synthesis roll-up.

**7:56** · And then you can go back and forth until it sounds like something that would make sense for you. The best part of this is, if you build V0, V1, V2, and you're still unhappy, you can always go and explore other repos, bring them into context, see what's missing until you get to the perfect formula for you. Now, what if you don't even know what to ask Claude Code because this whole memory concept is newer to you? There are a series of building blocks that you can combine together that make up a good memory system.

### The Memory Building Blocks

**8:22** · The first building block is identity, and this is everything from what your name is to your occupation, to your age, to anything that should persist over time no matter what. So, these memories remain forever unless you change them yourself. And then we have critical context, which is somewhat associated to identity. If you are now running a business, if you work in a company, anything that is contextually important to that position or that point in life should be part of the context here. And then you have on-demand working memory.

**8:51** · And this is likely something you're working on right now that might not actually be worth persisting in the future. So, you can think of this as a messy desk of thoughts. And these thoughts might be all for this work-in-progress task, but once it's done, they might not matter.

**9:06** · And then we have long-term and episodic memory. Episodic memory focuses on the why. So, not just the what of the memory, but why did you care to store this memory? And then the long-term knowledge are things that are not foundational to you as a person or to your day-to-day, but something that's worth persisting over time. Maybe the outcome of a litigation, a big event, something that deserves to be looked back on at a future point. And then we have things that happen in the background.

### Decay & Promotion

**9:32** · One of them is called decay, where over time, you can choose for memories to degrade in importance, especially if it's very temporal in nature. And the inverse of that are promotions, and these are not promotions at work, but more so promoting memories in importance that eventually become persistent because you keep calling on those memories over and over again. And the best part about memory systems is that you can always mix and match. So, if you want some level of semantic meaning look up, you can integrate that to also go along with keyword matching and then with entity.

### Multi-Signal Retrieval

**10:03** · So, in one sentence, you can have three different layers of memory do the work to try to connect the dots and really understand what it is that matters to you. So, instead of brute forcing 25,000 tokens for a single memory look up, you could break it down by as much as five to six times to something like 7,000 tokens, but using these different signal mechanisms as ways to pre-filter your memory data.

**10:27** · Now, I'm going to show you and give you a memory architect skill to help you through the process of coming up with your best blueprint for your memory system. But, before we get to that, a couple key concepts that we haven't gone over are ones called salience and another one called compaction survival and one more called progressive disclosure. Very fancy words, but very simple meanings.

### The Memory Architect Skill

### Salience, Disclosure & Compaction

**10:50** · Salience is basically a proxy for memories that are revisited very often versus others that are pretty much never visited after the first time. So, you can think of this as a very oftenly crossed path versus one that is overgrown with tons of shrubs, weeds, et cetera. If we go back to that initial building block image, progressive disclosure is about loading the most important things first. So, the number one thing that will be loaded is your identity, then some form of knowledge, and then rarely accessed is your full history.

**11:19** · Typically, you're looking for 1 to 2% of your entire history, especially as you log more over time. And compaction survival is something that 90% of people don't know about, where if you choose to compact in Claude Code, you can actually auto inject memories in that compacted version of the session to make sure it still knows the most important things moving forward. And yes, I'll show you a sneak peek on how you could do this. But first, let me show you this amazing skill that I've put together for you.

**11:47** · It's meant to interview you on who you are, your recipe, and then come up with the ingredients for the perfect meal so you can actually build your memory system and ideally actually implement it. But before we get to that, I'm going to walk you through this skill that's fully designed to interview you on what you want your memory system to look like, and then its job is to come up with all the parameters and all the ingredients, and I actually trained it on all of the repos that I could find.

### Skill Demo: /memory-architect

**12:13** · So, you can go from ideating about memory to actually building the framework, and near the end of this video, I'll show you how to inject it. So, if we clear our last session, let's write memory architect right here. And this will walk through the process of the interview. So, upon starting, you have a fork in the road.

**12:32** · Do you want to go through the full walk-through, which will teach you how memory works as well as actually guide you through it step by step, or do you want the fast track? Basically, you know what you want and you just want it to implement it for you. If we pick full walk-through, it'll come up with some more multiple-choice questions that I'm provoking using the ask user input tool.

**12:51** · So, in this case, it asks you what best describes your role. And you can always type something different if it applies to you, but in my case, I will just say content creator, knowledge worker. And then it will ask you how technical are you with infrastructure. If you say something like config light or CLI comfortable, it'll give it an idea.

**13:08** · You'll submit those, and then it will ask you for more information. And not only does it interrogate you, but it educates you. So, it walks you through what the layers of a memory stack look like so you can actually understand what's happening. And then you can go to the next set of questions. Which memory layers do you want in your system? And this is meant to be a multi-select. So, I can click identity, critical context, long-term knowledge, hit next, and then it asks you, do you want any of these advanced layers? And it then defines each one of them. In this case, let's say I say none of these. And I do submit. And then I do submit again.

### Memory Stack Education

**13:39** · It will keep going until it realizes, okay, do we have enough to build Mark's perfect memory system? So, it walks through the next set of layers that we selected. And then some hypotheticals on how it would look like. And then we have a few more questions. So, we'll go through and let's keep going, and I'm going to jump to the penultimate step.

**13:59** · So, given that I use Obsidian in my day-to-day, I have biased this skill to basically walk you through what an Obsidian plus Claude Code system would look like. So, once you go through more questions, it drafts what a possible back-end could look like. So, in this case, telling you you could use Obsidian with the Claude Code CLI for Obsidian, and it should walk you through, do you want to use a plain markdown folder in general and not use Obsidian at all, or do you want to use Obsidian? In this case, I will just write Obsidian. And then if you don't have the command line interface, it will tell you to go and actually install it and use it.

**14:31** · So, after some more interrogation, it goes through your final recipe. So, this is your proposed memory architecture, exactly how it searches, how it deals with working memory, all the components, all the layers, everything that we had in the back and forth. And then finally tells you, where should the memory live?

### Your Memory Recipe

**14:50** · So, you can say in this folder, in the dot memory folder, in an existing Obsidian folder, and anywhere from there. So, while this builds out our entire memory system, how are we going to inject this into our Claude Code tactically? Now, there's many ways to implement this elegantly. One simple workflow is imagine you start up your Claude Code, your session starts, and when that session starts, you can fire off what's called a hook. That hook will inject memory, or you can write in your Claude MD to refer to a certain place in your repo.

### How to Inject Memory

**15:19** · And then as you work, not only do you have Claude Code have its own memory, but now you can have this additional layer that's always injecting the parts that matter. And if you choose to compact, then you can always auto inject more memories or existing memories to make sure that if Claude Code has done a TLDR of a very long-running session, that that TLDR actually injects the parts that matter.

**15:41** · Now, without being fuzzy about this, how can we accomplish this? So, one way is in your Claude MD, you can actually say when you start a session, read this vault file. So, vault would be for an Obsidian database. Then you have this markdown file, and you're telling it to read it at session start. Now, the thing with Claude MD is it's always auto injected at the very beginning of a session, but it's not deterministic, meaning maybe nine times out of 10, Claude Code will read it and it will read anything associated to it in that file, but there is always a chance that it doesn't.

### Approach 1: CLAUDE.md

### Approach 2: Hooks

**16:12** · Which is where we come to row two. If you use a hook, you can actually \[clears throat\] deterministically fire a hook at session start to make it read this identity file. And you can do the same thing with compaction, where before the pre-compact event using hooks, you can also inject another thing. So, you can call this underscore context MD. One little Easter egg here is theoretically, you could maintain a markdown file of what you deem to be the most important parts of your session, so when you compact, you can auto inject that context that matters.

### Approach 3: Agent-Scoped

**16:44** · And this comes in really handy if you have something like an open claw, a Hermes agent, or something like me, like a Claude Code system that uses Claude Code as the base. If you don't know what I'm talking about, I have a whole video on this and I'll link it above. So, with your agent team, each one can have its separate vault folder that it always auto injects.

**17:02** · So, for me, day-to-day, when it comes to communication, so these are things like emails, WhatsApp, Slack, anything that I want to answer on the go, my comms agent will always auto inject all of my notes about communications, maybe not just style, but certain events that are happening. So, when we start a session, we have the Claude MD, but we also have an auto injection of these core memories. So, approach one is purely text.

**17:27** · All you have to do is just say read the following, and when you intentionally say things like read, these are magic words because Claude Code uses tools like read, write, edit, glob, grep, and a series of others. So, when you say the specific command word, it is much more likely to actually do it. For approach two, if you're a beginner, you might be fearful of setting up hooks. Luckily, you can tag something called the Claude Code Guide and ask it to create a hook at the session start or before a tool call that auto injects a specific memory file.

**17:56** · And for number three, assuming you're using something like Obsidian, as long as you have the command line interface set up, you can always go back and forth with Claude Code to negotiate for a certain project, for a certain agent, when a vault or a series of vault memories should be injected. And if we go back to our memory system, it is almost ready to go. So, all the files are created. This is what it looks like. It's in this folder called memory within this project. We have the Claude MD file with some memory instructions.

### Build Complete

**18:25** · We have the prime auto injected memory that we're going to put, the identity file of who I am, the context, some scripts. If you scroll through, it walks you through exactly how it works, and it says, I need you to configure Claude Code hooks for a custom memory system.

### Wiring Hooks

**18:43** · What we can do is, if we don't know exactly how to do this ourselves, we can tag our buddy and do @ClaudeCodeGuide, and we'll say, can you take care of setting up all the hooks for us based on the top specifications and the latest documentation that you find on effectively and efficiently implementing them?

**19:03** · And then when we send this off, this basically spins up a sub-agent to go and look at documentation and come back to us with the result. And after some research, it is creating all the hooks right in front of you right here. You can already take a peek at hooks at session start, what it should look like, the fact that it will auto inject this specific priming memory file. And all you have to do is just do allow, it will continue, and the goal is, not in this current session, in the next one, we will see an auto injection of all of these memories.

### The Payoff: "Who Am I?"

**19:33** · So, it tells us to close the session and open a fresh new one, like I said. So, if I ask something like, who am I and what am I working on, it will auto inject everything in that priming file that tells me that I am a content creator, I am CLI comfortable, I'm working in Claude Code, and my current project is the memory recording from YouTube. So, this is just a glimpse of how deep you can make a memory system in a very short amount of time.

### Closing

**19:55** · So, I'm hoping this entire walk-through breaks not only limiting beliefs, but also breaks any anxieties and overwhelm of having to keep up with the latest and greatest framework \[music\] deemed to be the ultimate version of memory. By taking all the concepts in this video, as well as the skill in the second link in the description below, you'll be able to start and finish your version of a memory system that works for you.

**20:17** · And once again, if you want to go much deeper on memory, if you want to see how I design memory \[music\] systems for my Claude Claw Personal Assistant System, then you're going to want to hop into the Early Adopters Community to catch my Claude Code Magic Course and everything else I have cooking up. And for the rest of you, if you found this helpful and you appreciated the depth, then all I could ask of you is a like on the video, a comment if you're feeling friendly, and a sub if you want to see more.