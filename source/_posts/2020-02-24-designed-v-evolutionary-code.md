---
title: Designed v Evolutionary Code
---

When I started coding I didn't know any good practices, I just coded and coded and you can guess that the result was horribly hard to maintain and extend, I spent nights awake solving stupid bugs to meet stupid deadlines. That's awful, there should be a better way.

Then I entered college, and I learned software analysis with UML, service management with ITILv2, among others. Amazing! So if I plan my software in advance it will be perfect and I won't face the problems I was having before right? Wrong. It never worked, I kept developing poor systems.

Next I started working at ThoughtWorks, they taught me Agile, and I threw almost everything I learned at college away. Instead of planning everything in advance, we should just plan small things, one at a time, but it doesn't lead to crazy messy code like when I started because we ensure quality at each step, by using TDD, Pairing, Code Reviews, Refactoring, and so on.

In my project there we had a beautiful test suite pyramid, I saw zero bugs in production for the first 6 months. Honestly when I started I found it weird that people took days to deliver what I previously took hours, because of all this process, tests and refactoring, but they were surprisingly calm about it, following the plan one user story at a time, and after some weeks and months I could see how it paid off, how it was actually faster on the long run.

For many years that was it. It's solved, that's how we deliver software, it's settled, I don't need learn anything new. But then I joined Booking.com.

No tests, no merge requests, no pairing, huge perl codebase, code duplication, not enough refactoring. Are you crazy? I'm back at square zero, like when I learned to code, this doesn't work. **But it did**, it did work, user stories were delivered at more or less the same pace as on the previous environment I was, how was that possible?

How did this company even got to be this big was beyond me, until Kent Beck, father of TDD, on a similar experience at Facebook, solved the puzzle with his 3x theory: <https://www.youtube.com/watch?v=FlJN6_4yI2A>

I really recommend checking the video above, but here I'd like to focus more on the code.

## A Different way of Working

The way I compare the two different ways of working is by thinking one as Designed Code and the other as Evolutionary Code. Both of them have the goal to save time, both of them are produced by agile, but the result is very different.

On Designed Code you don't want to have bugs, you want strictly typed languages (like Elm, the language with [zero runtime exceptions](https://twitter.com/rtfeldman/status/961051166783213570)), a Test Pyramid, a well-though architecture and no tech debts, so that you are free to develop new features faster.

But guess what, those don't come for free, and there is an alternative way: Evolutionary Code. On Evolutionary Code you always focus on the next thing that will bring the system more value, always considering the law of diminishing returns. You don't guarantee that everything will work, instead you just release your code, measure where it fails, then you do the solution that solves 90% of the problems with the least effort, ad infinitum.

Basically on Evolutionary Code your code evolves not because you plan, but because the environment around it pushes it into certain directions.

## Language

A strong type system will force you to solve every tiny possible issue, making you spend a while fighting with the compiler (anyone who played with Rust knows what I'm talking about). This gives a great feeling of safety, but some of those issues may actually never be a problem in real life, or rare enough that the business can afford while you spend your time on a bigger user pain.

That's why I'd say Evolutionary Code matches better with interpreted languages, and it is better if it doesn't try to fake safety at runtime. For example, if you have JavaScript (not Typescript!):

```javascript
function trackClick(name) {
  if (!name) throw "track needs a name";

  ga.track(name);
}
```

Nothing guarantees that the code will be inside a try/catch, so do you really want to break your application just because a Google Analytics tracking didn't work? No, you let it run. You should only throw/panic/die when it's dangerous or impossible to continue, otherwise let it burn. There is a reason why JavaScript allows you to [sum object with array](https://www.destroyallsoftware.com/talks/wat), there is a reason why `==` compares number with string, it is all so your code can keep working, even if by accident. If you cannot get real safety from your language don't try to fake it, embrace the speed boost of running without protections, fail fast and fix your code accordingly.

Likewise, when you are doing Designed Code, and you have all of the required boilerplate in place, and still get a `NullPointerException` in your face it breaks your heart. It's easier when you can either fully trust or fully not trust the system, when its in the middle it just causes more uncertainty and stress.

## Code Changes

When your system grows complex, a Designed Code will have a single source of truth for the business logic, with a well architected system. So when you need to make a change on it, you have the advantage to be sure that all your system is in sync.

But this also means that a change on one place will break many others, so you are forced to fix everywhere, which can take you a long time.

On Evolutionary Code it's common to end up having lots of duplicated code, this causes you to take a long time to keep all system in sync. On the other hand you can change one place at a time without disrupting others, prioritizing the most important ones (you will forget some, but hey, maybe they were not important anyway).

When you just go with the wind, and don't refactor often, its also common to see some God Classes show up. Those are files with 10k+ lines of code, functions with 30 parameters, accumulating responsibility of basically everything. You cannot kill it, it's too important, you also cannot avoid it because a big part of the code goes through there, so what you do when you need to add new functionality to it? You do the minimum possible.

Like the human body, it's very risky to do interventions in complex systems that we don't fully understand, so like a doctor we just do an incision as small as possible. In Evolutionary Code it's common to create simple functions, with simple code (just ifs and for loops, no magic), that does one thing only (hey, that's a good pattern!), you can test it, you can trust it, then you just do the smallest incision in the God Class to call your new small function.

Designed Code doesn't have this problem, but it doesn't mean it's faster to add new code. Understanding a very engineered code also takes a lot of time, figuring out where your code should be in the middle of all those AbstractFactories, which Interfaces to use, reading docs and figuring out what was the team thinking when they developed a certain architecture takes time. Or, to be more up-to-date, figuring out how your new feature fits in between those five microservices takes time.

In general, Evolutionary Code tends to not have much abstractions, just basic syntax, so it's easier to read, but you need to read lots of it. On the other hand Designed Code tends to have more abstractions, so you need to read less, but it's not simple, you have to understand well those abstractions.

## Tests

When you are doing Designed Code tests are essential, you need to know your system is fully working according to the specs. When you are doing Evolutionary Code monitoring is essential, you need to grab every piece of feedback you can from production to evolve your code accordingly. Resistant vs resilient.

Tests are good for regression, it's great if you are doing incremental changes and you can have an early feedback of everything that broke, so you don't need to later stop your development process to fix a bug in production. But if business decides to do a major shift, then you have not only to change a big chunk of your codebase, but also a big chunk of your tests, you cannot count with the regression guarantee anymore, and it can actually slow you down.

In Evolutionary Code tests and TDD are still very useful, when it helps you to develop faster, but not very useful as a regression suite. When you are writing Evolutionary Code, instead of running the whole system you build some unit tests or scripts to help you develop the new feature, but it's common that after a while those tests will start breaking, with no real impact to the customer, causing people to ignore it on the CI. Other times things move so fast that the feature is no longer relevant so the test can simply be deleted. In this world you rely more on monitoring and data to understand what is working well and what isn't, fixing and improving accordingly.

Likewise, Code Reviews can help you catch bugs that you wouldn't have seen otherwise, but at the same time they delay integration and getting feedback from production, maybe the bugs you catch and optimizations you did on the review will actually not help in production while the ones you didn't causes a major issue.

## Which to Choose?

It depends.

I really don't want you to read this and decide that one way or the other is better. The whole point is that I've seen both working, I now personally believe that Evolutionary Code can help us better on the Explore and Expand phases mentioned by Kent Beck, while Designed Code can help us better on the Extract phase, or on highly regulates environments.

I also think that peace of mind is absolutely important for something you will be doing 40 hours a week, and Designed Code can help you better there. But also, only now I notice how we can get comfortable with incremental changes and stop doing major shifts, which can be crucial for big companies to stay relevant and for startups to grow.

Thanks for reading!

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}