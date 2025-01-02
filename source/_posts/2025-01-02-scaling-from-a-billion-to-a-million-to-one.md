---
title: Scaling from a Billion to a Million to One
---

When I started [LangWatch](https://langwatch.ai), I had a crystal clear development vision for it in mind, I had been through it all, from starting my first business and entangling myself in code so messy I couldn’t move any longer (and therefore losing money and sleep), to working on a consultancy with perfect TDD, pairing and couldn’t-be-more-refactored codebase (sleeping, oh, so well!), to incredibly messy code again this time done by more senior devs (sleeping ok but wait, this actually moves about the same speed and makes way more money??), to then having to migrate this same codebase to an actual well-written one to cut the fires (check it out more [Designed v Evolutionary Code](https://rchaves.app/designed-v-evolutionary-code/)).

All this learning allowed myself to see a path to that deliciously sweet spot: maximizing speed and flexibility, without ever shooting myself in the foot; maximizing the short term, with no cost to the medium and long term; global scale and zero overengineering at the same time; tryna find that blackswan for the startup phase as soon as possible, without having to stop and migrate any architecture for scaling later.

So armed with a lot of dev experience, probability theory, and all there is, off I went, started building as a startup: Next.JS and Vercel, yes, get it up in 5 minutes, what database? Oh, Planetscale? Sure, MySQL then. Boring tech yes, that’s how you win. What about AI, the cool new tech part which is what the startup is all about? Python of course, don’t need to think for half a blink on it, just swim in favor. Tests? Only where it makes me code faster (yes, like data transformations, you actually code faster), and monitoring for the critical, none for the rest.

The goal is, everything that is easy to change later (a lot of the frontend for example), I don’t care, needs to stay flexible, this is where we keep buying our different lottery tickets, everything that will be hard to migrate later, needs to be done right from the get go. Rock solid foundation, flexible construction.

So this boring tech obviously scales to a billion, it’s proven. Vercel won’t, but that doesn’t matter, I can just move to AWS when time is right, and I don’t need to change anything about my app, it will still be TypeScript, MySQL, Python. But there is one piece of the puzzle that is no so obvious, we are mainly a monitoring tool, an LLM monitoring one, so where do we store the traces?

I went with ElasticSearch there. I already knew elastic, got annoyed with OpenSearch after-fork quirks (so definitively going for the no-longer-open-source one), and I knew that even though “oh, startup, just use Postgres for everything, you are overengineering”, those would be one of those big shoot-in-the-foot as soon as we needed a proper timeseries db, fast analytics, millions inserts and so on. One of the reasons it attracted me too was the vector search, so hot for AI, also on Postgres with an extension (and the reason I didn’t consider ClickHouse, didn’t know it could also do that at the time). Plus I needed a queue, went with Redis, no biggie, it will hold a lot, Kafka is too much, queues are easy to replace later.

Everything worked, and I built so fast, got the MVP working in no time, we went talking to leads, design partners. First design partner was very interest in analytics, made myself pretty happy with my elastic choice, we soon had snappy, colorful graphs, all kinds of filters, cut and dice the data all you want, all was good.

Then we went to talk to more companies, and they were like — but you are SOC2/ISO27001 compliant right? Where are your servers? It’s all GDPR in Europe right? Where is this OpenAI endpoint going to? We can only use Azure OpenAI, and only if that’s in Sweden

Okay shoot, is Vercel this? Is PlanetScale that? Where are my nodes on ElasticCloud? Azure give me startup credits please!

Okay, no worries, I have been preparing for this moment, I knew I’d have to move to something like AWS/Azure/GCP sooner or later, but damn second month in, that’s pretty soon. I actually started with GCP, because they gave way more credits, but turns out, the AI helping me writing infra code (and it was no Claude 3.5 back then) was actually way better when writing terraform for AWS and I had a way easier time with libraries available and so on. Again, boring tech wins.

So okay, all good, all in AWS now, all in Frankfurt Germany now, where all cloud providers are, Azure OpenAI in Sweden, Vanta is checking our compliance, yes, all encrypted, yes rest and transit I made sure, can we do business now?

“Wait, do you want me, to send my data, to your cloud? There ain’t no way”“But we are all in europe, all secure!”“There ain’t no way”“But ISO, SOC2, in transit too!”“Nope”So this was something that I really didn’t see comming. Companies have become more and more concerned about privacy on this past decade, sure, but AI accelerated that a lot, the fear of OpenAI training your data was at all time high at end of 2023/early 2024, and the high cloud bills and back-to-onprem movements made having onprem a must-have for any solutions dealing with AI data.

I’ve started with the premise of not shooting myself in the foot for scaling for billions, but when installing it for someone else, on someone else’s AWS/Azure/GCP account (that’s what onprem actually means mostly), they don’t need to scale to billions, just millions is enough.

This means that while I made the right architectural decisions — and I still stand by them — I didn’t exactly made the right infrastructure implementation decisions. For example, we were using AWS lambdas for the LLM evaluators, because then we can scale them forever and not care, but a lot of infra setup, config env vars and so were all hardcoded and scattered, cuz who cares right, it’s our own infra, we can clean it up later. But now I need to make it portable, and things like lambdas don’t make it portable, plus they don’t need that for millions, a server will hold it.

So we had to scale back, we had to make the setup easy, easy to move around, and easy to sell, procurement-wise. Again luckily, boring tech, mysql, redis, all available in all clouds, a great win, and then there was ElasticSearch… Well, wasn’t a problem, our main enterprise lead uses AWS, so that’s nice, bit the bullet and added compatibility with OpenSearch.

Wow, so nice, now everything, EVERYTHING lives on your AWS, all self-contained and self-managed, nothing gets in, nothing leaves, except for that OpenAI Azure endpoint which you configure yourself through the UI and I don’t touch it. Nice, that’s all packed up.

At this point I also migrated it from mysql to postgres because fuck it, planetscale is long gone, was already changing things anyway, and that one was actually super easy.

Coincidentally, around this time, some fuzz popped up again on social media about great progress on Postgres vector search support, plus I had my eyes on timescaledb, a time-series extension for Postgres, and I was like “fuuuuck, should I have listened? should I have just gone with Postgres-is-all-you-need? did I overengineer? me, so careful?”.

It would be perfect, managed Postgres is available on all clouds, so easy, so nice. I got away on AWS with OpenSearch, but GCP and Azure didn’t have a managed elastic, and we already had leads from those clouds on the door asking about onprem - but if they need to go to the marketplace to purchase additional components that could mean another added procurement hurdle.

But actually, the Postgres dream is not as easy as that. Those extensions are not natively supported, this means if you want them, you need to run your own Postgres!

Ohh no no no, this would be way worse! Having to manage backups? Uptime? No sir thank you we ain’t an infra company! Sure you could use TimescaleDB from the marketplace as well, but at this point OpenSearch is winning. Azure and GCP will require it either way for both options, but hey, I think that will have to be it. I was happy with being right on my first call.

Moving on, as product and business developed, we realized more and more of the inevitable: we are a dev tool after all, so we need to get support from the devs. It will never work long-term if we go just top-down, we need to go bottom up too, we need to give back to the community, that’s the only way devs will ever consider us, adopt, keep using.

Now, we were already an open-source, but we never really advertised it as much. As we focused more on it, we realized: we are at the wrong scale, again.

A dev, playing with the open-source project, don’t need to scale to millions, they don’t need full blown elasticsearch. They need to scale to one. They need to run it on their machine, and their machine might not have 16GB of RAM laying around for us just because. Docker Compose setup? Still a bit annoying. Do I really need a Redis queue? I’m sending just 2 messages.

We have to reduce the barrier as much as possible, ideally, you should be one `pip install` away from greatness.

Let’s see then, we can drop Redis for a local setup, that’s more than fine, we just call the worker async directly. Postgres? We can use SQLite instead, prisma should make it easy to be compatible with both. The Next.JS app I can pre-build and shove it inside the Python package, people will still need Node installed to run the server but I think that’s a fair assumption. But what about OpenSearch? That’s the irreductible bit.

No matter how you twist and turn, how many initialization configs you disable, OpenSearch/ES is a beast, heavy, takes long to start and eats up a lot of RAM, and I really really wouldn’t try to ship this without docker. So how can we make the `pip install` dream work? Luckily, we found a nice little thing called [quickwit](https://quickwit.io/). Quickwit is built for scale, but its rust-compiled binary can be downloaded for just ~80mb, it starts very fast AND it has an elasticsearch-somewhat-compatible API! Just what we need. Now it doesn’t support scripts or some complicated aggregations, but that’s fine, you don’t need it all on dev mode, and this is where we’re at right now.

We certainly came a long way, even though I think my early confidence is not without merits, portability was not something I had anywhere high on my list, but it was great to learn how heavily it counts. Thank you for reading, and now I’ll continue on my journey, of making LangWatch scale, to just one.