---
title: "I Replaced OpenClaw and Hermes With Claude Code Agents"
source: "https://www.youtube.com/watch?v=rVzGu5OYYS0"
author:
  - "[[Mark Kashef]]"
published: 2026-04-14
created: 2026-04-14
description: "Join the community: https://www.skool.com/earlyaidopters/aboutBook a consultation: https://calendly.com/d/crfp-qz3-m4zFree Blueprint Kit (link 2): https://markkashef.gumroad.com/l/gnwsm---I buil"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=rVzGu5OYYS0)

Join the community: https://www.skool.com/earlyaidopters/about  
Book a consultation: https://calendly.com/d/crfp-qz3-m4z  
Free Blueprint Kit (link 2): https://markkashef.gumroad.com/l/gnwsm  
  
\---  
  
I built a personal AI command center on top of my existing Claude Code subscription. No new frameworks. No extra API costs. Just the Agent SDK, a few hundred lines of code, and layers I keep adding over time.  
  
In this video I walk through the full system. Five specialized agents that delegate to each other through a shared hive mind. A voice war room where I talk to my agents in real time using Gemini Live. A mission control dashboard for kicking off tasks and auto-assigning them to the right agent. Memory that filters, decays, pins, and consolidates itself every 30 minutes. Security layers, scheduled tasks, and launchd services that spin everything up when my Mac boots.  
  
I also explain why I chose this over OpenClaw, Hermes Agent, and every other framework that shows up every week. The short version is that my foundation is Claude Code itself, and everything else is a removable layer on top.  
  
If you want to build your own version, I dropped a free blueprint kit in the second link below. It includes a mega prompt you paste into Claude Code, 8 modular Power Pack prompts, an assessment prompt for existing setups, and a 20-page visual architecture guide.  
  
0:00 War Room demo and live agent conversation  
1:22 Task delegation to comms agent  
1:37 Experimental meeting room (Daily.co)  
2:17 What changed since v0  
2:50 The Agent SDK bridge explained  
3:21 V0 architecture (Telegram + SQLite + 200 lines)  
4:01 How the system evolved  
4:20 Memory layers and Obsidian injection  
4:43 Multi-agent with hive mind  
5:00 Gemini-powered memory extraction  
5:18 Voice layers and Pipecat  
5:26 Meeting stack and Pika avatars  
5:43 Security and chat ID allowlist  
6:08 Auto-launch with launchd services  
6:23 Dashboard via Cloudflare tunnel  
6:49 Free blueprint kit  
6:57 Why not OpenClaw or Hermes Agent  
7:50 Running multiple agents from Telegram  
8:34 Hive mind cross-agent awareness  
8:46 Mission control and task auto-assignment  
9:50 War Room delegation design  
10:25 Memory is personal  
10:57 Gemini as a memory washing machine  
11:26 Alternative memory backends  
11:40 Obsidian per-agent injection  
12:06 Why not Anthropic Channels  
13:00 Message queue prevents silent failures  
13:42 Memory classifier and pinned memories  
14:25 Importance decay and distribution  
14:41 Exfiltration guard and security layers  
15:19 Anthropic terms of service  
16:18 The layered architecture philosophy  
17:11 Investing in your Claude Code ecosystem  
17:36 War Room architecture breakdown  
18:06 What is Pipecat  
19:01 Pipecat frames and envelopes  
20:07 Three routing rules  
20:51 Free blueprints and resources  
21:43 Community and one-click clone  
  
#ClaudeCode #OpenClaw #HermesAgent #AgentSDK #ClaudeClaw #AIAgent #Pipecat #GeminiLive #PersonalAI #MultiAgent #AIAutomation #Telegram #WarRoom #MissionControl #AIMemory

## Transcript

### War Room demo and live agent conversation

**0:00** · So, what you're looking at right now isn't OpenClaw and it most certainly isn't Hermes agent. You're looking at my mission control for my existing Claude Code command center. And the best part is this is using my existing Claude Code subscription and it's using my existing Cloud Code ecosystem. And of all the features that I could show you, this one is my favorite, which is the ability to hop into our war room and have a conversation with our council of agents.

**0:25** · So, all you do is click enter, hear this beautiful track behind the scenes, and then we have our agents assemble, go to the left hand sidebar, and we can have a conversation with our main agent.

**0:39** · Hey, how's it going?

**0:41** · Same as always. All good.

**0:43** · Okay, awesome. So, I have a whole YouTube audience watching you live. Can you explain to them what it is that you do?

**0:50** · I'm Maine, Mark's triage and default agent. I handle general requests and delegate tasks to specialized agents to get things done fast.

**0:58** · Okay.

**0:58** · So, just in case to make sure that you're not a gimmick, can you actually assign a task to our communications agent to create a script for me on creating a YouTube video about basically putting together a cla command center?

**1:13** · That task is already in progress with coms.

**1:15** · Okay. So, when do you think it'll be done?

**1:18** · I don't have an exact time frame, but Mark will get a telegram notification when it's ready.

### Task delegation to comms agent

**1:22** · And just a few minutes later, this singular agent is able to kick off this task and we get this whole script from our communications agent walking through the script, the structure, and everything that we would need to do to put together a great YouTube video. And on top of that, if I want to, I have this experimental feature that will allow me to actually hop into the equivalent of a Google Meet and have a back and forth conversation with my main agent. So I can click on create room. We can copy this over. We can paste it in.

### Experimental meeting room (Daily.co)

**1:50** · And then voila, within seconds, we will see our beautiful main agent here. And I will say, "Hello." Hello. How are you?

**1:56** · I'm good. What's up?

**1:57** · Yeah, I want to plan out my day. What do you think I should do? Should I do my YouTube video first? Should I send out my emails? Should I respond to my community members? What do you think is the best thing for me to do today?

**2:06** · YouTube hits wider reach and builds authority faster than individual emails or community engagement, which are more maintenance. Knocking out the big stuff first sets you up for a better day.

### What changed since v0

**2:17** · All right, cool. And this is really a glimpse of what my Clawudeclaw operating system can do. I dropped the Vzero version of this build more than a month ago on YouTube, and many of you seem to like it. And ever since then, I've spent hundreds of hours improving and adjusting every single feature to get the absolute most out of it. And as I've been improving it, my members are swearing by it. So in this video, I'm not just going to show you these features and dangle them in front of you. I'm going to give you the entire map of how you could build this yourself. So, if you stick around to the very end, you'll never have to turn your head for a brand new framework ever again. Let's dive in. So, just in case you're less familiar, this entire stack is built on top of one single element.

### The Agent SDK bridge explained

**2:57** · And this element that enables everything is called the agent SDK, which stands for software development kit. It's a free framework released by Anthropic that essentially allows you to run a remote terminal session of cloud code from whatever program or interface that basically speaks to it. So the SDK is the bridge and all you have to do is decide what kind of device you want to interact with it from. So in my VZero aha moment, we just had to choose an interface, then choose one modality, in which case I chose Telegram, but you could also use Slack or Discord or whatever you wanted. And then we added on the layer 3 which included the telegram API which would manage the connection between the SDK your cloud code session and telegram. And then we had some basic memory and we used something called SQL light which is a light version of a database that runs free on your computer in a very lightweight file. And the best part of this stack was it promised to be infinitely malleable because outside of these 200 lines of code to enable the bridge between the SDK and your service you can add on whatever you want. So over the hundreds of hours that I've invested to improve this build, it has now evolved into this where I have multiple user interfaces. Not just the phone, but we have like you saw my mission control from the dashboard as well as the browser. In terms of channels you can connect to everything I mentioned before. And then in terms of the memory, we have a lot richer memory.

### V0 architecture (Telegram + SQLite + 200 lines)

### How the system evolved

### Memory layers and Obsidian injection

**4:20** · So we have different layers from a cloud MD file to your SQLite memory to pinned memories to memories that decay over time. And we even inject some Obsidian notes depending on what Obsidian vault each agent is handling. So let's say the communications agent would tap into any folders from my Obsidian related communications. And whereas we had one single agent before, we are now essentially doing the equivalent of running multiple terminal sessions that are dedicated to that specific context of agent. And to make sure that all agents could communicate with each other and keep track of what the other is up to, we created something called the hive mind. And this is a unified memory state of every task that has been completed by a specific agent. And in terms of subsystems, we use things like Gemini to basically take a look at our entire conversation and decide dynamically what deserves to be a persistent memory versus a throwaway memory. And then we add on different layers such as the voice layers that you saw in my demo.

### Multi-agent with hive mind

### Gemini-powered memory extraction

### Voice layers and Pipecat

**5:18** · And we use things like Gemini Live and Pipecat, which I'll get to a little bit later. Now, the meeting stack is highly experimental and I enable things like using Pika, which allows an actual avatar to interact with you, but it is eyewateringly expensive for now. We have what I showed you, which is daily.co, which creates that Google Meet experience. And then we have a few other options. And this is really what I want to explore moving forward. And in terms of security, if someone knows your Telegram username for your individual agent or agents, the way we would stop them from being able to ask questions, ask for credentials, or basically ping any request to it and receive a response is making sure that your chat ID is only on the allow list. So you create the agent and it recognizes that only this Telegram user from this Telegram account can actually message and interact. And lastly, back in the past, I had to use a terminal to spin up this cloud code agent that runs on the SDK. But now we have the services called launched that as soon as I turn on my computer, every single agent spins up and I can use them right away. And the mission control I showed you runs through a cloudflare tunnel. So we can go back into Telegram and I could do something like slashdashboard and this will give me a direct access that I can click on this specific link go to our dashboard and we can interact with it from here. And in addition to that you can add a new agent from your mission control dashboard. You can change the models and do all kinds of stuff. So, my core goal with this video is you could essentially take the transcript, take these images and resources that I'll make available to you for free in the second link in the description below, and you could essentially recreate whatever it is that would be relevant to you. Now, to address a question that you might be thinking, why go to all of this trouble just to not use OpenClaw or Hermes agent or Louis Vuitton agent? The reason being I wanted to be able to take advantage of all the skills, all the infrastructure, everything that I've set up on my computer and then combine that with added layers of functionality to use my existing subscription and not pay additional API costs. And the best part is as new things come out cuz today it's Hermes agent, tomorrow it's Elephant Agent. Let's say Elephant Agent explodes and now every single creator on YouTube says it's insane and it crushes everything. All you have to do is be nice and relaxed. You can go and clone that repo. You can bring it into cloud code. You can audit whatever features you want that you find really impactful.

### Meeting stack and Pika avatars

### Security and chat ID allowlist

### Auto-launch with launchd services

### Dashboard via Cloudflare tunnel

### Free blueprint kit

### Why not OpenClaw or Hermes Agent

**7:41** · And then you can just bring that in. If these are open- source frameworks, then you can always go shop, take off the shelf what interests you and implement it in your own way. And in terms of assembling the team, it's literally the equivalent of spinning up multiple terminal sessions and running them at the same time. So, if I pop over to my Telegram and I just say, "Hey, can you pull the latest emails that are relevant for me to review?" And I send that over, I can go to my Claude Claw and say, "Hey, do you know what my ops agent has been up to recently? Can you tap into the hive mind?" And we keep throwing one request after the other. Hey, can you analyze my last video and tell me how well it did in terms of views and comments made? You have the exact same luxury of running multiple terminal sessions except you can do it from anywhere you want. And although I have to blur the response, you can see right here, it can tap into the hive mind and retrieve every single task that the ops agent has been up to. So in terms of agentic memory, you don't just have it at the singular agent level, you also have it at the global level. And in terms of the mission control center, instead of having it be a pure wrapper on top of transactional activity, you can actually create and kick off tasks and use a language model to decide what is the best agent for said task. So if we scroll down to the very bottom here and we click on new, I will say create thumbnail for my command center YouTube video. And then we will say the agent should use the nano banana API to create a beautiful thumbnail and send it to me via telegram. The thumbnail should just have a picture of Claude the Claude code mascot running around basically causing havoc. Then we will put let's say medium. We'll click on create. And now we have the core task. If you want to auto assign it to the best agent, we will click on auto assign. And behind the scenes, we'll have a language model using a very cheap model from Gemini go and decide what is the best model for the job. And within seconds, the language model rightly buckets this task under the content agent. So then it can go and execute it as soon as I move it from cued to live. And in terms of the war room design, the way it works is we have our main agent. This main agent has a task where nine times out of 10, it will try to delegate and throw a task immediately. So, it's trying to be the optimal manager where it doesn't do anything or shouldn't do anything itself unless you explicitly tell it to do so.

### Running multiple agents from Telegram

### Hive mind cross-agent awareness

### Mission control and task auto-assignment

### War Room delegation design

**10:07** · But it should know all the skill sets of comms, content, ops, research, and whatever agent that it is that you add and then push it to the one with the right competency. And although you saw me demo speaking specifically to the main agent, you can also talk to the comms, the content, the ops, or the research agent just by clicking on them.

### Memory is personal

**10:25** · And again, I'm telling you this in case you want to take this exact same design and apply it on your end. Now, when it comes to memory, it is a very hot topic on YouTube and everyone is producing videos on what they think the best system is. But the truth is, memory is very personal. So, you can use a lot of these tools like Obsidian, like these vector databases, but at the end of the day, my memory system is designed for the way my life works and the way my business runs. So, you can definitely use bits and pieces from what you see on YouTube, but you want to make sure that you can really make it your own. So, in my version of memory, two core things are happening. Number one, our Gemini behind the scenes is acting like a washing machine. So, as it goes through the conversation, we're using Gemini 3 flash, which is super cheap and has a huge context window. So, even if it's monitoring all of my chats, knowing that I'm not going to put anything in that chat that's super private, it will be able to see what is a fact, what is a preference, and what's a context. And accordingly, it will be able to better categorize it in our SQL light memory.

### Gemini as a memory washing machine

### Alternative memory backends

**11:26** · Now, in case SQL light is too light for you, you can use things like Superbase, Pine Cone, Purely Obsidian. And what I'm doing with Obsidian behind the scenes is because I have so many memories and so many tasks and so many projects depending on the type of agent any folder within my Obsidian that's relevant to content is auto injected with the Claude MD at the beginning of that session. Same thing with ops.

### Obsidian per-agent injection

**11:51** · Anything related to my business finances, our expenses, our workshops we do for clients, all of that is always auto injected in memory. So when you ask it a question about your Obsidian, it's using your existing CLI skills to tap into it. So another question that might pop up is why go through all the trouble to set up this SDK to use something like Telegram when Anthropic themselves have this feature that's called channels where you can use cloud code via Telegram, iMessage, Discord. The one question I'd ask you is, have you used it? Because for me, I've used the Telegram, I've used the Discord, and it keeps disconnecting. And that MCP server is quick to set up, but after 2 3 days of uses, it gets disconnected on a regular basis because I personally set up all of them. And I noticed that the Discord and the Telegram kept disconnecting even though it was using a stable MCP server behind the scenes. And for me, the last thing I want to worry about is opening up my phone after waking up and seeing that Telegram is not connected. But just in case you want to use these channels, then you definitely can. This whole system is very modular. The only part that we really needed to use is those 200 lines of code to let us run this remote cloud code session. And for those who are more technically inclined, this is what happens when we send a message via Telegram. Now, step one is you send your message and then from Telegram it goes into a queue. This is basically a waiting room. This waiting room is designed because what if multiple agents are firing messages at the same time?

### Why not Anthropic Channels

### Message queue prevents silent failures

**13:18** · And what if with a singular agent conversation, you have a scheduled task or a cron job that runs and then it fires a response and then at the same time you send a question to get a different response. Usually this would lead to some form of silent failure. But the way I've designed it is to have this queuing system to have only one message be pushed to one agent at one particular time. And then we have the language model behind the scenes that classifies what is this conversation and message about at all times and deciding what should be if anything committed to memory and what might deserve to be a pinned memory. And just in case you don't know what I mean when I say pinned memory, if we go to our dashboard and we scroll to the very bottom here, you'll see that we have 99 general memories.

### Memory classifier and pinned memories

**14:02** · Then we have 122 insights. These are insights that Gemini is making on my preferences, what I like, what I don't like, etc. And then we have these pinned memories. And these are memories that I want to persist across all agents, all time. And these are things like my name, address, email address, business mailing list. Everything that is really fundamental to be always taken into account. And then we have the importance distribution where we can gauge what memories are important and which ones are likely to fade out. And if I scroll to the very bottom, which I don't want to because there's personal information, you will see a whole list of memories that are about to go outside of the database and ones that will persist no matter what. And the last notable element here is this guard that makes sure that if someone messages your Telegram bot that they won't receive a response because they are not permissioned to interact with it. Now, is this a bulletproof setup? I will tell you no. You can add multiple layers and maybe with cloud mythos we will be able to add even more but for the most part we have your data. Then we have logs.

### Importance decay and distribution

### Exfiltration guard and security layers

**15:01** · Then we have a guard around who can interact with your agent. Then we have a pin where once you spin up your agents you can enter a pin that allows you to actually speak to them. And then we have this chat ID allow list. What ids are allowed to actually interact with your telegram account. And you can keep adding more and more layers. Now, another huge elephant in the room is, is this something that works with the terms of service of Anthropic? I am not a lawyer. This is not legal advice. A lot of the space when it comes to rules and regulations around Anthropics policies have been very gray. But what hasn't been gray is as of April 4th, they have banned your ability to use your Claude Code subscription with third-party providers and harnesses like OpenClaw.

### Anthropic terms of service

**15:44** · So, someone asked Boris Churnney, the creator of Cloud Code, can you use your existing Cloud Code subscription to use and run something like the agent SDK for personal local tools? This being a good example of a personal tool that I'm not commercializing whatsoever. The last time I saw something about this, he did confirm that it should be legit. But again, this space changes all the time.

**16:06** · This is not legal advice. Do your own due diligence. But from what I can see, it seems fair game that you can use your cla subscription with the claude ecosystem using the claude bridge to the cloud code harness. So the overall benefit of you using this ecosystem is that you are sitting here and then you have this layer which I call for myself claudeclaw. In here you can add whatever feature it is that appeals to you. If you see something that says Hermes is even more insane, it added X, you can go pull the GitHub repo, give it to Cloud Code, and say, can you tell me what it would look like to add this to our existing system? Layer it on top of our Claude code agents. Then you go back and forth, make a plan, and you implement it. So, as new things continually come out, and they won't stop, you don't have to worry about doing the equivalent of moving houses. As the enthropic ecosystem gets better, the models get better, memory gets better, you have native slash commands, you get all of that out of the box, then you layer on things that are personalized and customized to you, and then you're at the very top. If anything ever changes, the majority of your foundation is built on your operating system anyway.

### The layered architecture philosophy

### Investing in your Claude Code ecosystem

**17:11** · Everything else is a luxury that you're adding on. So, you're investing in your cloud code ecosystem on your computer, focusing on making the best skills, slash commands, and processes possible.

**17:20** · And if something were to ever happen to this layer, it wouldn't be the end of the world as it would if you had an open claw full setup with a full structure of all your different microservices and prompts and skills that are tailored to that one specific framework. Now, I initially teased you with my war room, but how would you go about designing something like this? So the cross-section of what the war room looks like is you have your browser and in the browser you have something running on local host which is your local server on your computer. We then use something called a websocket. This creates a live connection between your browser and all of these microservices and we use this medium called Pipcat which is an open-source voice agent orchestration framework. Now, I'll go deeper into what Pipcat is and how it works on the next slide, but for now, you can just think of it as your overall server where everything related to voice is managed.

### War Room architecture breakdown

### What is Pipecat

**18:14** · And behind the scenes, if we ever need to assign a task to a sub agent, like you saw me go from voice to a Telegram message handled from that same conversation, it's basically spinning up a mini cloud code and executing via the SDK subcomands using our existing agents. And in terms of the speech to speech, speech to text or whatever it is that you end up choosing, you can use something like Deepgram Graham, Cartisia, or Gemini Live. Now, if you want the leanest stack possible and probably the cheapest, you can use Gemini Live and you would use Pipcat to manage the entire infrastructure. So, it's not just voice, you can do voice and not have to use the tool calling from Gemini and maybe do your own tool calling using your version of Cloud Code that you can spawn on demand. Now, if some of this is going over your head, I'm going to have a series of resources for you to be able to read through and better understand what might be the best fit for you. Now, like I said, I'm going to doubleclick on Pipcat just because it's very malleable and versatile for all kinds of ways to interact with voice. Another alternative could be LiveKit. But in terms of Pipcat, I like it because it is open source, so it's hackable and malleable. And basically what happens is you have something called the transport which is a fancy word for basically your microphone input into your browser. Then this goes to multiple stations. So you have let's say six stations. One of them could be speech to text. The other would be text to speech assuming that you don't have a language model in between to manage that on its own. And then you have the transport on the output side to go from input to speaker output and go through that loop to allow you to have that back and forth conversation. So if you think of different assets from the conversation as an envelope, all Pipcat is doing behind the scenes is just labeling each envelope of what you said, what Cloud Code replied when it seems to be time to route a request to a different agent. And it's infinitely malleable, like I said. So you can keep adding different envelopes and Pipcat's job is to just manage which envelope is going to which destination. And this whole managing process really comes down to three main rules. You asked the question, does what Mark said contain anything around everyone, team or status update? Then it looks like we should route it to this specific agent. Does it start with an agent name prefix?

### Pipecat frames and envelopes

### Three routing rules

**20:28** · Meaning, did I call the communications agent like I did at the start by name?

**20:33** · If so, it's very explicit. Did you pin a specific file or did you manipulate the JSON in a particular way? So, we always route certain requests to certain agents. It becomes more malleable and you can add as many or as few rules as you want. Now, I could spend way more time diving into each nook and cranny of how this build is set up, but again, I will provide you enough blueprints, structures, some information documents that you can sift through, or let's be real, your LLM can sift through to see if setting up something like this makes sense for you. And like I did in the first video, I'll also drop a very large prompt that you can feed into Cloud Code to allow you to go back and forth and decide on designing your version of this infrastructure. With the models we have now, you could probably get up and running in less than an hour. And trust me, if you're a business owner and you're looking for the perfect solution to manage your cloud code while you're on the go and you do have something like a portable laptop or a Mac Mini, this setup will absolutely destroy something like an OpenClaw, assuming they're not using open source models. And with that, hopefully this inspires you on what's possible. just using your existing cloud code subscription, layering on top whatever memory services, voice services, or any service that really caters to your needs. Now, if you want my personal system that I've constantly been working on and all of my members have continually been raving about, then you'll definitely want to check out the first link in the description below so you can do a one-click clone of my system, set it up, and be up and running in less than half an hour. And for the rest of you, if you want to figure this out on your own, again, you'll find all the goodies, the blueprints, etc. in the second link in the description below, completely free. Happy building and I'll see you in the next