---
title: Why Agile Works
---

A lot is discussed on how to do agile, if a given company or framework even is agile, if you should use sprints or not (you shouldn’t), if agile can scale, etc. On those discussions, the [agile manifesto](https://agilemanifesto.org/) is routinely brought up with those famous four lines:

> Individuals and interactions over processes and tools \
> Working software over comprehensive documentation \
> Customer collaboration over contract negotiation \
> Responding to change over following a plan

We have so many layers on top of "agile" nowadays that people talk about it without considering or even knowing about the existence of the agile manifesto, leading to a lot of BS. It’s much better when the agile values are brought up, the discussion becomes much more productive.

Those four sentences are now an unchallenged way to better develop software in general - surely enough, after over 20 years they proved their value empirically - but why is it that they make so much sense? I’m not looking for anecdotes but trying to actually understand the reasoning behind it, the core value behind the agile manifesto values, and I think I found the answer, on Nassim Taleb’s Incerto series.

Taleb argues that many things in the real world are too chaotic to be fully understood, he criticizes a lot economists, for example, for claiming to be able to understand and predict such a complex thing as the economy, pointing that they actually turn out to be more wrong than right. He argues that we should focus not on trying to understand and predict all uncertainty, but rather work *considering* there will always be uncertainty and risk

This is also the biggest realization of the agile manifesto authors, that **software development**, just like the real world, the human body or the economy, **is too damn complex to be fully predicted, written down or systematized**.

Then they went on to write four very down-to-earth guidelines, naming things we do day to day, like processes, tools, documentation, contracts and plans, but pushing us **away from the default approach of trying to understand everything and predicting the future, towards the more flexible and uncertainty thinking**

To clarify on what I mean by "away from default approach": even if nobody is teaching "waterfall" project management, I believe most on the right side of the agile values is the natural direction people tend to take when problems arise, so it requires a manifesto to weight to the other side.

For example "over processes and tools". It is common for people to want to fix problems by introducing a process or a tool that will streamline the work and allegedly reduce mistakes. "Did an employee steal from the company? Let’s now always require manager approvals so that can’t happen again", "Did a human error happen here? We could introduce a checklist form so nothing is forgotten again", "People are not giving feedbacks to each other? Let’s make them use this tool with very specific text boxes guiding them to the perfect feedback process". I’ve seen suggestions like this popping up from very well-intended people many times, with clear benefits on the short term, but causing more harm then good down the line. Everyone that worked on a big corp knows that bureaucracy only tends to grow - even though nobody is really a bureaucracy lover - this is just the natural direction, so it requires a push in the other direction to balance things out.

The suggestion is then to give more weight to "Individuals and interactions" instead, but why is that? This is because our processes and tools, just like our systems, are rigid: as soon as you encounter an edge case the process can’t handle it breaks - and in complex systems edge cases are not the exception, they are the norm. Humans are the flexibility of the system, the oil to our corporate machine. A lot of what is communicated on a natural human interaction cannot be written down in forms or in a process, it would require thousands, millions of them. Those approvals you are now requiring might slow down the whole process, costing more than the eventual stealing; the checklist could be blocking some legitimate decisions to leave something out; the standardized feedback process might actually be harming a lot of people that struggle with the style, being unable to adapt it to their team and peers. Of course we can and should keep improving the processes and tools and try to fit everyone, but at some point the cost of customization does not pay off, instead, it’s much more effective if we leverage individuals and interactions natural nuances and flexibility to tame the complexity of things such as software development.

> Logic excludes - by definition - nuances, and since truth resides exclusively in the nuances, it is "a useless instrument for finding Truth in the moral and political sciences". […]
>
> Things are too complicated to be expressed in words; by doing so, you kill humans.
>
> – Nassim Taleb - Antifragile

Next is "Working software over comprehensive documentation", which could also be interpreted as "empirical over theoretical". Let me try and make the connection to the main point: software development is just too complex so we embrace uncertainty instead. Traditionally, we try to do the best brainstorm with stakeholders, document everything, plan the architecture with hundreds of diagrams and so on in hope to build the perfect system. After a long time building it, when we put it out we always discover it is far from perfect, we find out we got the requirements wrong, the needs wrong, and many bugs show up, no matter how much paper trail you left behind. People get scared, so they default to putting even more effort in upfront design, I saw it happening quite many times.

Mother Nature on the other hand took a different approach: it didn't carefully designed its creatures, but rather got (random) ideas out there and let the environment show what works and what doesn't, that's how it got where it is, with such advanced creatures and the ability to always survive and evolve. Just like Mother Nature, the real world is ruthless, the users, the market and everyone else touching our software will quickly point the flaws in our design with brutal honesty, even if by accident, and this is the most powerful feedback we can leverage. Production is the best QA there is. The solution for creating a perfect system then is not to design a perfect system, but to put an imperfect system out there earlier, aka working software, and let the best feedback mechanism we have do its work naturally.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">A QA engineer walks into a bar. Orders a beer. Orders 0 beers. Orders 99999999999 beers. Orders a lizard. Orders -1 beers. Orders a ueicbksjdhd. <br><br>First real customer walks in and asks where the bathroom is. The bar bursts into flames, killing everyone.</p>&mdash; Brenan Keller (@brenankeller) <a href="https://twitter.com/brenankeller/status/1068615953989087232?ref_src=twsrc%5Etfw">November 30, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The "comprehensive documentation" part is sometimes also interpreted not as the UML you wrote before development in old waterfall projects, but docs written during or after development, comments, wikis and diagrams on how pieces of the system works. It regularly becomes a point of discussion in the manifesto, as it is considered a good virtue that your whole system is well documented even in agile environments, common sense tells you that the more detailed the better, but there is actually a diminishing return here. In a complex system, you can’t actually document everything (nevermind keeping it up to date), there are so many nuances and intricacies that are simply too hard to convey in written text, with other means such as human interactions (or like pair programming) being much more effective. And it’s all fine, you don’t actually need devs to know how everything works to be able to build stuff on top of it

> As with so many programming management problems, the technical memorandum problem gets worse nonlinearly as size increases. With 10 people, documents can simply be numbered. With 100 people, several linear sequences will often suffice. With 1000, scattered inevitably over several physical locations, the _need_ for a structured workbook increases and the _size_ of the workbook increases. How then shall the mechanics be handled? […]
>
> We quickly decided that _each_ programmer should see _all_ the material, i.e., should have a copy of the workbook in their office.
>
> Of critical importance is timely updating. The workbook must be current. This is very difficult to do if whole documents must be retyped for changes. In a looseleaf book, however, only pages need to be changed. We had available a computer-driven text-editing system, and this proved invaluable for timely maintenance. Offset masters were prepared directly on the computer printer, and turnaround time was less than a day. The recipient of all these updated pages has an assimilation problem, however. When they first receives a changed page, they want to know, "What has been changed?" When they later consult it, they want to know, "What is the definition today?"[…]
>
>Our project had not been under way six months before we hit another problem. The workbook was about five feet thick! If we had stacked up the 100 copies serving programmers in our offices in Manhattan's Time-Life Building, they would have towered above the building itself. Furthermore, the daily change distribution averaged two inches, some 150 pages to be interfiled in the whole. Maintenance of the workbook began to take a significant time from each workday […]
>
> D. L. Parnas of Carnegie-Mellon University has proposed a still more radical solution. His thesis is that the programmer is most effective if shielded from, rather than exposed to the details of construction of system parts other than their own.
>
> – Frederick P. Brooks Jr. - The Mythical Man-Month

If you got the point already, it should be clear that "Customer collaboration over contract negotiation" just follows the same rationale of the previous ones. In a software factory developing software projects, when things go wrong (and they always do), people go back to review what was actually agreed in the initial contract. This is a mistake because we know by now that software development is too complex, to think you would been able to have predicted the future back then. Still people decide to honour the contract, at the end, the customer is angry because the developer didn’t built what they wanted, and the developer is angry because of all the wasted effort.

I'm guilty of have fallen in the same trap in the past, when, after loosing quite some money (and sleep) in a software project, I tightened even more the rules of the contracts in the next projects, basically saying that the customer could no longer change their minds during the duration of the projects, helping me reducing the deadlines overrun. The result was useless software being delivered to unhappy customers, with deadlines still being broken, everyone was miserable, except the contract.

The core issue is the same as the previous one, just like you cannot have processes that models the whole of a complex system, and you cannot design all the details of a complex system upfront, you can’t also predict what needs to be built exactly, when it will be done, and all the problems that may happen to write it down in a contract. Tightening the contract is a loosing game for a software project, rather, a more flexible contract that makes few guarantees about *how, what or when*, while harder to get signed, give a lot of room for navigating the complexities of software development, allowing much closer customer collaboration with better feedback loops and change of plans, thus making the customer happy - and happy customers don't sue you.

Let me repeat the core value behind agile again: software development is too damn complex, move away from trying to capture all the variables, and embrace the strategies to move in face of uncertainty

Last but definitely not least, "Responding to change over following a plan". This is probably the value agile is most remembered for, in a sharp contrast to waterfall detailed plans. It should also be the most clear example of the point I’m trying to make - predicting the future is definitively the most complex thing there is.

As much self-evident as this may seem nowadays, it still must be stated. Lots of people still believe that the more detailed plan you have the better you can control your future. Since early age we hear that "you got to know where you are going", "you got to have a plan for your future", from grown-ups and pseudo-intellectuals - even though if you ask, none of them planned to be where they are right now, life just happened.

> The rational flanêur is someone who, unlike a tourist, makes a decision at every step to revise his schedule, so he can imbibe things based on new information, what Nero was trying to practice in his travels, often guided by his sense of smell. The flâneur is not a prisoner of a plan. Tourism, actual or figurative, is imbued with the teleological illusion; it assumes completeness of a vision and gets on locked into a hard-to-revise program, while the flâneur continuously - and, what is crucial, rationally - modifies his targets as he acquires information. […]
>
> The error of thinking you know exactly where you are going and assuming you know _today_ what your preferences will be _tomorrow_ has an associated one. It it the illusion of thinking that _others_, too, know where they are going, and the they would tell you what they want if you just asked them.
>
> – Nassim Taleb - Antifragile

Predicting the future is so hard, that with time you learn that even projects considered classic waterfall fits, such as construction, actually miss deadlines and have to adapt and change details of the plan *all* the time, with a growing impact as the complexity of the world increases:

> But the puzzle was that such underestimations did not seem to exist in the past century or so, though we were dealing with the very same humans, endowed with the same biases. Many large-scale projects a century and a half ago were completed on time; many of the tall buildings and monuments we see today are not just more elegant than modernistic structures but were completed within, and often ahead of, schedule. These include not just the Empire State Building (still standing in New York), but the London Crystal Palace, erected for the Great Exhibition of 1851, the hallmark of the Victorian reign, based on the inventive ideas of a gardener. The Palace, which housed the exhibition, went from concept to grand opening in just nine months. […]
>
> The obvious is usually missed here: the Crystal Palace project did not use computers, and the parts were built not far from the source, with a small number of business involved in the supply chain. Further, there were no business schools at the time to teach something called "project management" and increase overconfidence. There were no consulting firms. The agency problem (which we defined as the divergence between the interest of the agent and that of his client) was not significant. In other words, it was a much more linear economy - less complex - than today. And we have more nonlinearities-asymmetries, convexities - in today's world.
>
> Black Swan effects are necessarily increasing, as a result of complexity, interdependence between parts, globalization, and the beastly thing called "efficiency" [...] The world is getting less and less predictable, and we rely more and more on technologies that have errors and interactions that are harder to estimate, let alone predict.
>
> – Nassim Taleb - Antifragile

Finally, I must make a note of the text after the values on the agile manifesto:

> That is, while there is value in the items on the right, we value the items on the left more.

I, like the manifesto, am not dismissing the value of having a plan, processes, contracts etc, it is merely a pushback to on things that may naturally creep in to give it some balance.

Understanding the reasoning behind why agile values work can hopefully give us answers to what is not covered by the manifesto. For example, does agile scale? Scaling increases complexity, as we saw agile is about reducing the management of complexity, so inevitably the more you scale, the less agile you become. If you look at how Mother Nature does it, it doesn’t scale, at least not how we do with companies, Nature has fairly horizontal hierarchy, there is no 5km tall animals, or animals managing thousands of other animals, or a single animal concentrating all the power. Instead, we have many small, independent creatures, managing small amounts of complexity each, which allows them to keep adapting and surviving together, Nature is agile.

Thanks for reading!