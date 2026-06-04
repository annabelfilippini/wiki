---
title: "How To Build a Personal Agentic Operating System"
source: "https://www.youtube.com/watch?v=ntvkDnk_5jA"
author:
  - "[[The AI Daily Brief: Artificial Intelligence News]]"
published: 2026-04-25
created: 2026-04-27
description: "On our latest Operators Bonus Episode, Nufar Gaspar returns to introduce Agent OS, the latest free AIDB training program for building a personal agentic oper..."
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=ntvkDnk_5jA)

## Transcript

**0:01** · Today on the AI Daily Brief, how to build your agentic operating system. The AI Daily Brief is a daily podcast and video about the most important news and discussions in AI.

**0:23** · All right, friends. We are back with another operators bonus episode. Today we are once again joined by Newfar Gaspar who is here to introduce the latest free AIDB training program agent OS. Now those of you who have done AIDB New Year or maybe Claw Camp will be familiar with this style. It's a self-directed build-based program that's going to give you the tools you need to build a complete agentic operating system. And for those of you who are wondering what the difference between this and claw camp is, in many ways they share a lot of foundations.

**0:53** · But whereas claw camp is of course focused exclusively on OpenClaw, this is an updated program that is meant to be platform model and harness neutral.

**1:03** · Whether you're working with clawed code or codeex or some other set of tools, agent OS is about building dynamic and extensible and adaptable agentic systems that you can continue to evolve over time. But instead of me yapping about it, let's turn it over to Newfar to introduce the program and get you building your agentic operating system.

**1:22** · All right, Newfar, welcome back to the show. We got a fun one today.

**1:25** · Yes, we do.

**1:27** · So, this started kind of emerging around the time that I had started hacking around on claw camp. But before we dive in, we're going to talk about this agent OS idea today. But give us a little bit of background around where the the origin of this came from. Like most other people, I've been uh hacking around these systems for a few months realizing that different tools like uh we will explore in a minute are converging and that I'm still not getting optimal results unless I'm being very deliberate about what I'm putting underneath.

**1:56** · So basically that's the accumulation of all my thinking around how can you make any agentic tool work much better for you. So it's a framework that will not give any one novel concept but the overall accumulation of everything creates a much better system

**2:14** · for any tool whether it's open claw or any other agentic tool kind of moving from agents to agent systems almost and you know especially as I mean I literally as we're recording this openai just dropped their workspace agents and it's just that the innovation is going to keep coming I think the idea of having systems underneath that are extensible to the new platforms and and kind keep yourself organized are going to be increasingly valuable. So, I'm excited to dig into this with you.

**2:40** · Excited to share with everyone my best methods as of this morning at least. In today's episode, as mentioned, I will go over the full system that everybody who wants to get more out of the new wave of the agentic tools should build for themselves. And as a means of a background, what's happening today is that basically every agentic tool is becoming every agentic tool.

**3:00** · You said it in one of the shows over the last few weeks and you're correct because cursor just added agents and automations and cloud code added new memory systems also allows you to communicate with it from other channels and open claw radio files and codex run in the background and her

**3:21** · the kind of up and cominging open source from noose they also have similar architecture whether it's wind surf or anti-gravity or any of the numerous tools out there they are all converging on the same set of capabilities which means that the tool you pick matters less and less and what matters much more is the system that you build underneath it. So you want to build a system that captures how you work, what you know and what you need from the AI tool to do for you.

**3:48** · And one important framing before we go any further is that most of the discourse around agentic tools is kind of focusing on coding. And today I want to focus primarily on knowledge work. So whether it's strategy, communication, operations, decision- making, research management and anything that the knowledge worker does, that is where the most professionals live and that is where the agent OS or agentic operating system makes the biggest difference. And if some of these tools names are new to you, please don't disconnect.

**4:17** · Everything that we're going to cover today boils down to human readable text files and configurations. So if you can write a document, you can build an agentic operating system. And I'm seeing people building incredible things with the new wave of these tools. Many of you are using them seriously and getting real results. But here's what kind of clearly differentiates how well any tool works for you. And that is the underlying system. Whether you've carefully build it, maintain it, and improve it over time. That's the biggest unlock.

**4:48** · And most people haven't. And it's not because they can't but because they are building on instinct or best effort and they end up getting suboptimal result from the tools that are capable to do so much more. So the proof that the underlying system is the thing that matters every one of these agentic tools are are basically doing the same thing under the hood. They are reading text files that define who you are what you know what you can do and what you remember and what you can reach.

**5:16** · So almost everything that we're going to build today is a text file and that's that which means that the work you do to build your system is portable. And while the tool owners and the tool companies might not want you to think so that's the reality of every tool becoming every tool. And when you switch tools or add a new one all you have to do is point the tool to the same folder and it reads the same files. No migration, no rebuild.

**5:45** · And the tool choice thus is becoming the least important decision in my opinion that you need to make. What does make a world of difference is what you build underneath. So the the underlying system has a name and we're as mentioned calling it the agentic operating system.

**6:00** · And that's why we built a free program to help everybody build one for themselves regardless of which tool they use. And more of that at the end. But a few things that you need to do and know today. First of all is why the agent OS is the most important and most overlooked concept in practical AI. We then will go over quickly the seven layers and what actually goes in each one and we'll talk about how to build the first version of this this week using the running example of a chief of staff agent.

**6:29** · So your agentic operating system has seven layers and you can see them on screen and all of your agents will run on top of these layers and each agent is basically inheriting the whole foundation. So the OS is what makes agents effective regardless of which tool you use and regardless of how many agents you add over time. You build the OS once you maintain it and then every agent you add gets better because the foundation is there. And we're going to walk through each layer.

**6:58** · So you you will have better sense of what I mean by that. And before I go into the layers, just to make it more concrete, I want to build one specific agent as we go through the layers. And let's focus on a chief of staff agent. That will be the agent that reviews your inbox. You perhaps let it prepare you for meeting, track every commitment you make across calls, maybe flag any blind spot that you have. This agent can perhaps draft your weekly updates, know your people, know your priorities and so on.

**7:27** · And this is one of the first agent by the way that I built for myself. I h built Chloe. She runs on OpenClaw and she's the front door to my entire system that I will briefly share later on. So, of all the agents that you can build, the chief of staff is probably the one that helps you the most in the day-to-day.

**7:48** · And whether you're an individual contributor and you are just getting started in your career or you're a seasoned executive already used to managing a team of assistants, everybody would benefit from having a chief of staff and eventually your chief of staff can become the agent that manages the other agents. So that's what we will build today layer by layer. The first layer will be identity and that answers one question. Who are you and what rules do you want enforced every single time the agent talks to you? This is the file that your tool reads first.

**8:20** · So it will read it before any question you type and before memory the first thing in open claw it's called soul in cursor it's called agents.mmd in claude code it's claude in GitHub copilot it's copilot instructions and so on different names

**8:39** · but the same idea a text file that tells the tool who is it working for if you've never proactively written this file your agent starts from zero or what it was able to collect randomly along the way and if you don't have a high intent mention regularly update and just sufficient amount of information in the identity file. You are missing a huge opportunity for you to get so much more out of the agentic tool or the agent that you will build on top of these agentic tools. So you write it once and you enforce it forever or rather the tool does.

**9:10** · And in terms of what goes into a good identity file, it has to include who you are, how you communicate, whether it's direct or diplomatic, bullets or pros, short or thorough, and so on. It needs to also include what you value. So whether you prefer concise versus lengthy, whether

**9:29** · you prefer challenge your thinking versus execute what you say, show your reasoning or just give you the answer and so on. and whether you have specific rules what AI should never do for example never send external email without showing me a draft or never flatter me or always tell me what I'm not seeing so that will be the identity

**9:50** · and here's the key to actually building a good identity file you don't write the file from scratch yourself you will hate it and you will quit instead I encourage you to brain dump to an AI and let the AI interview you so open any AI tool and ideally one that already has sufficient memory of you from ongoing work with you and say, "I'm building my eye identity file. Please ask me 15 questions about how I work, what I want, what I don't want, what frustrates me about AI today, and what rules I want enforced."

**10:19** · You answer and ideally out loud because it's much easier to speak to an AI tool. And then the AI will draft, you will edit, and you will ship a first version that, let's say, is about 70% right. You can patch it over the next three weeks as you notice the gaps. And basically this is the methodology for every layer that we will cover today. You brain dump, you let the AI interview you, you draft, you shift a minimal viable version of this file, and then you improve.

**10:48** · And for our chief of staff, identity will capture your communication style, your pet peeves, your non-negotiables. For example, never let me walk into a meeting without a pre-eread or always tell me who else I owe to reply to or flag when I'm overcommitting for the next week. And then we have the context.

**11:09** · The context is what you know. And what you know is the single biggest predictor of whether AI gives you the generic output or something genuinely useful for your actual situation. So a generic AI advice is just like one Google search away. And what you cannot get from the public internet is your situation, your road map, your org chart, your customer segments, your priorities and so on. And unlike other layers, this is not something that will be solved by better models. Your specific context will always be yours.

**11:39** · And no model improvements will ever ever know what you're shipping next quarter or who your key stakeholders unless you tell it. And context files are the documents in your workspace that your agent read on demand and they are not part of the prompt you type. They are the library that the agent can reach for when the task needs it. Now there is a big trap here. If you're trying to context engineer in one session, you will produce a 40page document and you never update that.

**12:10** · That's not context. It's just a quick to be stale novel. So what actually works here is to have basically three to five focused files each on a single page each covers one thing whether it's my team my product my customers my quarter my stakeholders and so on make it dated and fresh and update when things change and

**12:33** · often we call it context curation and it's not a project that has a beginning or an end it's a practice and every time you catch yourself reexl explaining something about your situation to AI, that thing should have been in a context file. Write it down and add it to the library and then you move on. For example, for our chief of staff, we will at the very minimum need a stakeholders file. Who reports to you, who you report to, key crossunctional partners, what each one cares about, and so on.

**13:04** · Strategy and priorities file, what you're trying to achieve this year, what the organization is focused on, and an operating principle file. how decisions get made, what you push back on, what you escalate and so on. And I believe that context creation is the single fastest path to AI value. So the moment anyone gets this, whether it's you or people around you, this is where the conversation changes. They stop asking what AI tool should I use and start asking what knowledge do I have that isn't written down anywhere.

**13:33** · And of course, if you want to go deeper on this layer, NLW did an amazing episode a few days ago called How to Build a Personal Context Portfolio in MCP server. And it walks you through hands-on, including templates and companion apps. So, he did such a good job that I'm going to let NLW take it from here. So, identity is who you are. Context is what you know, and skills is how you work. And a skill is a reusable instruction set for the AI or workflow that you do repeatedly.

**14:03** · It can be the weekly status updates or the meeting prep, stakeholders emails and so on. It can be decisions and memos, you name it. And I believe that every knowledge worker easily has 20 or 30 of these patterns and each one can be written as when I say some kind of a trigger do some kind of a process using the following sources and produce output in this format. So without a skill, you're basically reexplaining the format every time. You paste the same sources every time.

**14:33** · You complain that the guy writes in a weird voice and you never bother to teach it your voice. So a skill fixes that. And if you write it once, well, it fires forever. Again, I want to encourage an MVP skill, not a perfect skill to begin with. The first version is always not perfect and kind of wrong, but you use it for a week and then you notice when it's off and what it needs to improve. you patch it and then a few weeks in that skill is writing better first draft than you'd ever get from starting over each time.

**15:03** · For our beloved chief of staff agent, a bunch of skills that you can consider will be pre-eread that will produce a one-page period for any meeting. It can be daily brief that scans everything that is open on my inbox or Slack or calendar and gives me what is on my plate for today. Voice match that helps AI write like you. commitment tracker and I can think of many other and I'm sure you can and of course if you want to go deeper on skills we did a skill masterass episode in this show a few weeks ago.

**15:33** · Memory is the next layer and this is where every agentic tool company is probably investing extensively right now and that is happening for a very good reason because it is clearly one of the biggest unlocks. It's kind of the core part of what makes open claw feel like magic.

**15:51** · Cloud code recently added automemory and cursor has project level memory and things are changing on a daily basis in the memory front and because it's so important every tool is racing to improve and they frequently copy each other's breakthroughs. So what's currently a limitation in one tool will probably be solved by the next time you go and and look into a a new tool release. So the question is if so many experts are working on memory what does it mean for you in practical terms.

**16:23** · So first the good news you can just lean on the existing memory in your tool and it will keep getting better for sure. But at least as of now no matter which tool you're using and how well its memory is working there are few things that you should do. At the very minimum I want you to understand how your tool's memory works. You can ask it directly. Explain how your memory system works.

**16:45** · What do you remember between sessions?

**16:47** · What do you forget? You need to know what you're working with before you can improve it. And also you need to know the limitations. Most tools still have gaps in cross session memory in what they retain versus discard and also in how context window interact with the stored memory. So by understanding the limitations, you will get significantly better results. And for the more advanced users, I would encourage you to add specialized memory for your work context.

**17:14** · So some people maintain a running log, others create structured memory files, some people use dedicated memory tools or MCP servers. What I want you to be is to be deliberate about what gets remembered. Your agent does remember things on its own, but it doesn't always pick up the right things.

**17:32** · So a major decision, a change in priorities or the end of a very long session might not be picked up properly how you would expect. So you should deliberately get the agent to remember that. And these are the things that you should make into a habit or even create a dedicated skill to help your agent remember the way you like it to remember. And there is a lot of variance between the tool. That's something that you need to know. So it's a layer that you can probably deepen over time.

**17:59** · You don't need to solve it on day one, but it the better the memory works and the better the overall experience becomes because memory is what makes every other layer stick across sessions. If we're going with our chief of staff, beyond the general memory, you might want to create dedicated memory for decision logs. For example, what was decided, why, what's the alternatives that we were contemplating and so on.

**18:23** · We might want to also include a dedicated memory for learning about the working processes because you want the chief of staff to also own an ongoing improvement. And perhaps you want to remember relationship context, how conversation with a specific stakeholder went, what they reacted well to and so on. And this is more structured than the generic memory that any tool that you use will provide and will really help your chief of staff agent to be much better companion and helper for you.

**18:51** · So everything so far has made your AI smarter about you. We move to the next layer which is connections and that makes it capable of acting in the real world. And connections are how your agent reaches real systems whether it's email or calendar, Slack, Jira, Salesforce, your databases. There are various ways to get there. We have the MCPs or model context protocols. This is the open standard that many tools support.

**19:18** · Recently, we're seeing CLI tools that give your agent more judgment to decide how to interact with the external system on its own. And there's always the option of direct API or scripting to get connected. You don't have to go deep on that to be able to connect your agent because we are already seeing that in many tools whether it's cloud code desktop or cursor marketplace, they are making connections progressively easier to set out of the box and of course we with open cloud there are many connections already enabled as well.

**19:46** · So, one thing that I want to say about connections is I want to encourage you to start as much as possible with a readonly access.

**19:55** · Before you let your agents write back into systems, let the agents only read your calendar or only read your inbox, not let them send emails and add calendar and so on. Right access should be added after you watch the agent behave for a few weeks and you have enough trust. And it doesn't matter if it's open claw or one of the commercial tools. The reason why I'm saying that is that the risk scales with the capability. So the more your agents can do in real systems, the more you need to think about permissions and security.

**20:27** · And this is real. We're already seeing incidents on a daily basis. It's not just data leaks in the traditional sense, but rather you can imagine an agent that has access to your company Slack and a very loose set of permissions. someone on your team starts chatting with it and now the agent is happily sharing your private notes, your opinions about colleagues, your draft feedback. So, it's not a hypothetical risk. Incidents like that are already happening and the agents that are gossiping while being very funny, they also pose a very big risk for employee privacy.

**20:59** · So, use the list privilege connections. Talk to your IT team if you're connecting any work systems and don't be the one creating the cautionary tails for others in your company specifically for your chief of staff. At the very minimum, give it a read access to the calendar and inbox. And even better, you can give it a read and write access on personal task list. If you want to be extra good, you can give it permission to post draft on Slack or DM to yourself for approval before sending.

**21:31** · Moving on to the next layer. The worst thing that happens with your agent OS isn't that it fails, it's that it works confidently and wrongly and you ship the output before you noticed. And verification is knowing what to check and every agent job has its own very quick test. If you draft emails, you need to basically tone match or uh you need to check that the facts are correct and so on. If you're doing data analysis, you have to check the numbers.

**21:57** · So, it's very specific to the different tasks or skills that you give the agents. I encourage you to do at least three to five checks. In many cases, it's it's under a minute to run and it will save you a lot of grief after. And they do get faster with practice. In the first week, it might be slow and it might get a little bit frustrating. But the more time goes by and the more you trust your agent on low stakes, you can uh verify just the high stakes one. And verification is not just about the individual output. You also need to improve the system over time.

**22:28** · So periodically I want you to do a retrospective with your agents. Audit the system and figure out which parts are under serving you. And maybe there are skills that are never being called or maybe there are context files that become stale. Maybe some agents need updated instructions. So I want you to similarly to how you would re-evaluate your employees or your company periodically. You will do that also with your agentic systems. You can do that either indirectly by auditing your each and every agent that you build on top of the system.

**22:59** · Or you can go directly to audit the OS layers themselves. And the great thing about the tools is that they let you just do that directly from the tool. You can literally ask them what is not being used and so on. And the reason why I'm talking about this audit discipline in the agent OS program, it's because it's something that without it, your OS has a shelf life of maybe 8 weeks before everything goes stale. And with it, your OS compounds even further and forever.

**23:30** · All right, top of the stack. And a great addition, not a mandatory one, is to add automations. Those are things that the agents can run when you're not watching.

**23:38** · Whether it's a daily summary every morning at 7 am a monitoring task that pings Slack or anything else that you can think of. They are very powerful and of course with open flow we also have heartbeat and chron jobs for the ones who are involved with that. However, this is the layer that creates a lot of risk if you're not careful because an agent that is running at 3:00 a.m. with a wrong answer can do damage before you wake up. So a few rules with regards to automations. Only automate workflows you have run manually enough times and trust.

**24:08** · Second, I want you to start with automations that produce draft for you to review, not outputs that go directly to other people. And lastly, always add logs. You need to know what ran and what it did as it was running. And finally, here's where the whole thing clicks. Once you build your OS, agents become cheap because your first agent is hard as you're building the agent OS and the agent itself probably at the same time.

**24:36** · Your chief of staff maybe took you a weekend. But the second agent that is built on top of this system, maybe it's a research agent or a board prep agent that takes you an afternoon because it inherits everything that is relevant and it already knows you and it knows your context. knows your voice and you're only adding a job description and a few specific skills and from here on after your third, your fifth and so on, they are each becoming faster and faster.

**24:59** · So this is the compounding return and why I'm so bullish on the agentic operating system and it matters more than the agents or the tools themselves. So this is my system. I mentioned Chloe, my chief of staff. She was one of the first that I built. After that I also build specialist agents for content, for technical building, for platform work and so on. They all share state to a central hub. They all share the same agentic operating system.

**25:26** · And my chief of staff sees the specialist and what they're doing using the shared hub for a different episode, but just showing that I practice what I preach. And this is exactly the sequence of what our agent OS free program walks you through. 10 build project any aentic tool that you want bring your own it's totally free and the link will be shared in the show notes and in the IDB training website and lastly while the tools keep changing

**25:58** · they will keep converging and the next one that we launch before you finish learning the current one that doesn't matter the part that does matter is that your OS travels with you and every tool swap and every new agent and every new capability that drops next It all lands on the same foundation. The people who build that foundation now will basically have it compound from here on after and everyone else will keep starting over with new tools.

**26:24** · So if your question is how do I roll this out across entire organization that's what we do with enterprise claw but today was personal and start with agent OS program and that's that. See you in the build log.

**26:41** · This is great. I you know I was thinking about this as you were as you were just closing this out. The three free programs that we've now released really show just how quickly things have evolved this year. AIDB New Year was 10 fairly disconnected projects that represented all each kind of a foundational skill set for something with AI. But they're very disconnected.

**27:04** · It's like a little image generation over here, a little you know writing model selection over here. And the one thing that almost sort of precaged what would come next was the first project, project zero, was building yourself a companion tracker uh with lovable or replet or something like that, right? One of the very basic vibe coding tools. Some people used cloud code, but most people were using something even simpler than that. And then just a month and a half later or so, we were into the realm of open claw.

**27:30** · And the claw camp program was really it shared a lot of these pieces, but obviously it was designed very specifically around a particular tool that lots of people were using. And what's become clear now and I think what this represents the next evolution of is that it's not about the tool. It's not about the model. It's not about the harness. It is going to be about going forward these systems that sit underneath and that allow you to swap in harnesses, swap out harnesses, swap in models, swap out models.

**27:58** · And uh you know it'll be interesting to see how much in the future we keep layering on new programs versus expanding this one and others. But I think this is a great tool for people who are getting deeper into this space and who want to be able to be flexible and dynamic as the whole industry evolves and get more value out of any harness and any tool and any model they choose.

**28:19** · Nuar, always great to have you on the show. Thanks so much for hanging out.