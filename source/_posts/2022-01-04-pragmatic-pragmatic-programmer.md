---
title: The Pragmatic Pragmatic Programmer
---

## pragmatic
**/præɡˈmæt.ɪk/**\
*adjective*

1. solving problems in a sensible way that suits the conditions that really exist now, rather than obeying fixed theories, ideas, or rules - [Cambridge Dictionary](https://dictionary.cambridge.org/dictionary/english/pragmatic)
2. based on practical judgments rather than principles - [American Dictionary](https://dictionary.cambridge.org/dictionary/english/pragmatic)
3. relating to matters of fact or practical affairs often to the exclusion of intellectual or artistic matters : practical as opposed to idealistic - [Merriam-Webster](https://www.merriam-webster.com/dictionary/pragmatic)


Recently I started reading the book The Pragmatic Programmer, I had never read it before yet it influenced me so much, how? Simply by the title. The **Pragmatic** Programmer, such a cool concept. I've heard about this book left and right, it was a mandatory read once I got serious about software development, I heard people talking about "you have to be pragmatic here", or "those devs are pragmatic", this changed my mind when approaching the development of many software systems, yet for some reason I never got to actually read it, it has been sitting on my "To Read" list for a long long time until now.

So now I read it and it was... **disappointing**. Like very disappointing. Like "don't meet your heroes" kind of thing. The title "The Pragmatic Programmer" is so brilliant, yet they ruined it with the content.

My understanding of pragmatic is the same as the definitions given above, and it were those that I used to guide my thinking when taking pragmatic decisions. Not good practices, not dogmas, but foot on the ground, facing the harsh and cruel reality. The Pragmatic Programmer book is not about that, it's a dogmatic book.

## The Pragmatic Programmer: The Good Parts

The book actually have some very good and pragmatic points, I will start with those because I think they should have been the central idea of the book:

> **CRITICAL THINKING**
>
> The *last* important point is to think critically about what you read and hear. You need to ensure that the knowledge in your portfolio is accurate and unswayed by either vendor or media hype. Beware of the zealots who insist that their dogma provides the only answer—it may or may not be applicable to you and your project.
>
> Never underestimate the power of commercialism. Just because a web search engine lists a hit first doesn’t mean that it’s the best match; the content provider can pay to get top billing. Just because a bookstore features a book prominently doesn’t mean it’s a good book, or even popular; they may have been paid to place it there.

Critical Thinking, that's it, for me that's in the very core definition of what does it mean to be Pragmatic, don't be fooled by dogmas and hype, keep your foot on the ground.

Still for some reason they say it's the *last* important part (I don't know why it isn't the first topic on the book), and later they throw lots and lots of dogmas at you, without explaining the reasoning behind them, contradicting this very same paragraph.

They go further on *Critical Thinking* with some tips:

> **Ask the “Five Whys”**
>
> A favorite consulting trick: ask “why?” at least five times. Ask a question, and get an answer. Dig deeper by asking “why?” Repeat as if you were a petulant four-year old (but a polite one). You might be able to get closer to a root cause this way.
>
> [...]
>
> **What’s the context?**
>
> Everything occurs in its own context, which is why “one size fits all” solutions often don’t. Consider an article or book touting a “best practice.” Good questions to consider are “best for who?” What are the prerequisites, what are the consequences, short and long term?

Those are perfect, that's much of what I understand by being pragmatic.

Then, to close off the good parts of the book, on *Good-Enough Software*:

> The marketing people will have promises to keep, the eventual end users may have made plans based on a delivery schedule, and your company will certainly have cashflow constraints. It would be unprofessional to ignore these users’ requirements simply to add new features to the program, or to polish up the code just one more time. We’re not advocating panic: it is equally unprofessional to promise impossible time scales and to cut basic engineering corners to meet a deadline.

That's it, that's a Pragmatic *Programmer*, one that has to work within corporate constraints, one which has it's foot on the ground, that produces *Good-Enough* Software, because they know it's not possible to build the perfect system given real world contraints, nor to deliver on impossible deadlines.

## The Dogmatic Programmer

At the same time the book argues for *Good-Enough Software*, it argues for the broken window theory:

> Don’t leave “broken windows’’ (bad designs, wrong decisions, or poor code) unrepaired. Fix each one as soon as it is discovered.

This is already somewhat contradictory to the *Good-Enough Software* point made on the book just two topics later, but the worse is that it's actually based on a theory that was [already debunked](https://news.northeastern.edu/2019/05/15/northeastern-university-researchers-find-little-evidence-for-broken-windows-theory-say-neighborhood-disorder-doesnt-cause-crime/)

A lot of times the story of crime reduction in NY with the broken-window policy is used to back-up this, but a [quick read](https://www.quora.com/How-did-the-New-York-City-crime-rate-drop-in-the-1990s) shows you that this is a mere correlation, not causation, a change of police strategy to focus on the bigger crimes rather than on petty ones might have actually been much more effective, together with abortion legalization and many other candidates, nobody knows for sure.

The broken-window theory for code feels like a nice idea, but feeling is not enough, Dogmatic Programmers are gullible and like theories, but a True Pragmatic Programer is skeptical, and values scientific rigour (when possible).

## Dogmatic Programmer: gullible, does what feels right, following idealistic theories
## Pragmatic Programmer: skeptical, values scientific rigour (when possible)

Now, the (when possible) part is very important, and very pragmatic too, because to be honest, in software development that's rarelly possible. The more I learned about statistics and biases in those recent years, the more I realized that having a proper experiment to discover causality is an extremely hard thing, and in software development, basically impossible.

We cannot build thousands of the same systems, with thousands of developers and add just a small variation (say, broken-window policy) to do a proper [RCT](https://en.m.wikipedia.org/wiki/Randomized_controlled_trial) and see it's effect. We don't even know if static types are better than dynamic ones, [we have many studies](https://danluu.com/empirical-pl/), but all confounded or biased in a way or another.

Most of the times we have no choice, being pragmatic means you have to use what is practically available: subjective experiences, biased experiments, or even your favorite dogma when there is nothing left. Practically, you need to take a decision (or even decide to not take one), but keeping your skepticism if you want to be pragmatic, fix your foot on the ground.

In that vein, I will tell you a subjective experience I had that touches the broken-window theory, and I wrote about it on the blogpost [Designed v Evolutionary Code](https://rchaves.app/designed-v-evolutionary-code/). It's not that I'm against broken-window theory or that I'm in favor of it, it's just that **it depends**. I take the book's own advice of **What’s the context?** to give you an example of just two cases where it probably works and where it probably doesn't, following [Kent Back's 3X Theory](https://www.youtube.com/watch?v=FlJN6_4yI2A):

1. If you are in exploration mode, most of the code you produce has no value and you will throw away, you need to iterate faster, here broken windows are totally fine, you focus on the current biggest problem only, law of diminishing returns kicks in and fixing windows doesn't pay-off at all, intead you move quickly to the next biggest problem
2. If you are in extraction mode, on a huge system, even a single flaw can be cathastrophic and cost millions of dollars or lifes (you are under [power law](https://en.m.wikipedia.org/wiki/Power_law)), here you don't want to keep a single window broken, you want to try your best to be sure all tiny pieces are working as they should and hope for the best

A True Pragmatic Programmer is skeptical of stories and dogmas, but the book is not skeptical at all, it tries to convice you using anecdotes, comming from the authors' experience, without any depthness, cues for the possibility of being wrong, and sometimes not even a short explanation, for example:

> **Duplication with Data Sources**
>
> Many data sources allow you to introspect on their data schema. This can be used to remove much of the duplication between them and your code. Rather than manually creating the code to contain this stored data, you can generate the containers directly from the schema. Many persistence frameworks will do this heavy lifting for you.
>
> There’s another option, and one **we often prefer**. Rather than writing code that represents external data in a fixed structure (an instance of a struct or class, for example), just stick it into a key/value data structure (your language might call it a map, hash, dictionary, or even object).

So should I just trust your preference? It doesn't seem very pragmatic. And *why* do you even prefer that? There is not an explanation of the rationale whatsoever, where is the *Critical Thinking*? Where is the *Five Whys*?

Most of the times the book assume all conclusions are self evident, there are many more examples like that:

> you can discipline yourself to write software that’s good enough—good enough for your users, for future maintainers, for your own peace of mind. You’ll find that *you are more productive* and *your users are happier*. And you may well find that *your programs are actually better* for their shorter incubation.

Why?? I mean I'm obviously all in favor of shipping ealier (generally), but why does it make things better? I feel the authors could have done a way better job explaining how production is the real test to our systems, how real life is so complex that is impossible to predict all the variables,  like Nassim Taleb explains so well in Anti-fragile, so we have to be pragmatic, accept there is a lot of variables we don't know, and that it's cheaper to allow real-life to give us this feedback then upfront predicting them all, this is [why Agile works](https://rchaves.app/why-agile-works/) (but not always! Context matters)

> Your ability to learn new things is your most important *strategic* asset.

Why? And "strategic"? I thought this book was about being pragmatic (foot on the ground, present) not "strategic" (heads in the cloud, future)

> Treat English (or whatever your native tongue may be) as just another programming language. Write natural language as you would write code: honor the DRY principle, ETC, automation, and so on.

Why? Being DRY is actually terrible advice for natural language communication, people don't pay attention, people forget, you actually need to be repetitive sometimes.

> If you can’t find the answer yourself, find out who can. Don’t let it rest. Talking to other people will help build your personal network, and you may surprise yourself by finding solutions to other, unrelated problems along the way.

Tips tips tips, just tips, no pragmatism here.

---

Chapter 2 is titled "A Pragmatic Approach", and it starts with that, I kid you not:

> **A Pragmatic Approach**
>
> There are certain tips and tricks that apply at all levels of software development, processes that are virtually universal, and ideas that are almost axiomatic

So their *Pragmatic* approach is to bring us a chapter full of axioms, not to challenge them, but to tell us they are universal 🤯. Say what!? This is absolutely NOT pragmatic. I expect to find axioms on Clean Code, that's why I bought *that* book, not here, here I expected to find counter-axioms, cases of when you have to actually be pragmatic, take your head off the clouds and break those axioms when it makes *practical* sense. This chapter should really be called *A Dogmatic Approach*.

They continue:

> The world is full of gurus and pundits, all eager to pass on their hard-earned wisdom when it comes to How to Design Software.

And finally confess:

> And we, your gentle authors, are guilty of this too. But we’d like to make amends by explaining something that only became apparent to us fairly recently. First, the general statement:

Their "explanation", actually uses a dogma as an excuse (*Good Design Is Easier to Change Than Bad Design*), so it's circular. "I'm sorry we are not pragmatic and presenting you dogmas, but the reason is because of this dogma"

## You can repeat yourself

Topic 9 is called "DRY — The Evils of Duplication", this is the part of the book I have the biggest beef with. The authors treat repetion as pure evil, and don't make any arguments on when it could be good, it's not pragmatic at all, pure dogma.

In fact, I've used in the past sentences like "they decided to take the more pragmatic approach and copy-paste the code for this situation", so it bothers me that the book that takes pride in it's title wouldn't even consider this as a possible sentence.

Just to be clear, I did many terrible code duplications in the past, and it helped me a lot learning the DRY concept at the start of my programming carreer and removing many duplications, but unlike the authors, I know that DRY does not hold true everywhere, and many many times it causes unintended harm, as you can read in [Duplication is far cheaper than the wrong abstraction](https://sandimetz.com/blog/2016/1/20/the-wrong-abstraction) by Sandi Metz. It's not all black-and-white, a pragmatic programmer should know that.

## Dogmatic Programmer: Duplication is evil
## Pragmatic Programmer: It depends

They start with a code refactor example to try to make their point. This is the original code:

```ruby
def print_balance(account)
    printf "Debits: %10.2f\n", account.debits
    printf "Credits: %10.2f\n", account.credits
    if account.fees < 0
        printf "Fees: %10.2f-\n", -account.fees
    else
        printf "Fees: %10.2f\n", account.fees
    end
    printf " ———-\n"
    if account.balance < 0
        printf "Balance: %10.2f-\n", -account.balance
    else
        printf "Balance: %10.2f\n", account.balance
    end
end
```

So they do this refactoring:

```ruby
def format_amount(value)
    result = sprintf("%10.2f", value.abs)
    if value < 0
        result + "-"
    else
        result + " "
    end
end

def print_line(label, value)
    printf "%-9s%s\n", label, value
end

def report_line(label, amount)
    print_line(label + ":", format_amount(amount))
end

def print_balance(account)
    report_line("Debits", account.debits)
    report_line("Credits", account.credits)
    report_line("Fees", account.fees)
    print_line("", "———-")
    report_line("Balance", account.balance)
end
```

And they claim it a victory, apparently they removed most of the duplication.

What!? This is a terrible refactor, one function became four; it's way worse to read, now instead of reading just a bunch of plain `printf`s, easy to follow because it's a core function of the language, the reader needs to jump around functions and understand what the author meant; now instead of one function causing bugs you have 4 functions that can interact in weird ways causing weirder bugs; now if you want to change the format of just one like you need to add an if condition, a new method, or something, it actually violates their *Easier to Change* rule.

It does not work here because this code is so simple, this is the wrong example, on a full-fledge report some of those refactorings could actually make sense, you would probably have the logic and presentation separation already anyway, but giving the advice on this small piece of code actually makes things much worse, showing that they are not taking *context* into account, but just following DRY as a dogma.

Now there are many statements they make I'd like to comment on:

> The alternative is to have the same thing expressed in two or more places. If you change one, you have to remember to change the others, or, like the alien computers, your program will be brought to its knees by a contradiction. It isn’t a question of whether you’ll remember: it’s a question of when you’ll forget.

Conversely, if you have everything expressed in a single, centralized place and you need to change it you are **forced to remember all the places** that depend on that. This can take a long time, time which may not even pay off for the inconsistency. It could be that the place you "forgot" to change actually was not that important at all, like a page nobody visits, a feature no one uses. If it is important, you will notice it. Again it depends on context, I touch on this on the [Designed v Evolutionary Code](https://rchaves.app/designed-v-evolutionary-code/) post too.

Additionaly, no duplication at all can actually be pretty risky. Remember [left-pad](https://www.theregister.com/2016/03/23/npm_left_pad_chaos/)? Because everyone decided to not duplicate something that can be implemented [in 1 line of code](https://stackoverflow.com/a/13861999) pretty much all javascript deployments in the planet were broken for a day. When you have central critical pieces without any duplication, you increase the chances of bringing the whole system to it's knees, like [it happened many times recently with big tech](https://rchaves.app/our-microservices-are-not-antifragile/).

> DRY is about the duplication of knowledge, of intent. It’s about expressing the same thing in two different places, *possibly in two totally different ways*.

When I say duplication is good for resilience, some may think about server redundancy, but no, I really mean intent duplication, which the authors rejects. Why is "two totally different ways" necessarily a bad thing? Devs love redundancy of servers but despite duplication of code, problem is, having thousands of servers in hundreds of availability zones still won't prevent you from deploying a catastrophic commit.

If you think about it, different codebases doing the same thing is like redundancy for the overall system, for ideas, for bugs. There is a reason why evolution brought us so many different animals, which survive through different ways, there is a reason why we have anti-monopoly laws, causing different companies to do the same thing but in different ways, this way you get the chance that one of them is actually better than the other.

---

## Dogmatic Programmer: let’s make everything abstract, what if we need to switch databases?

## Pragmatic Programmer: we will never switch databases

On topic 11 - Reversibility, the authors go on about how we should decouple third-party services to keep our system flexible, and of course they give the classic example of the database switch:

> “But you said we’d use database XYZ! We are 85% done coding the project, we can’t change now!”

In practice there are not a lot of reasons for switching one relational database with another, and even if you do, it will probably not be crazy hard, SQL is very standardized (much easier to learn than the thousands of ORMs APIs we have), on a small codebase find and replace can do most of the trick. Even if a big codebase decides to switch, it will be incremental with a migration plan anyway, it will never be “just change a config on the ORM”. Now if the change is for a completely different way to store the data to some domain specific NoSQL, or replace those MySQL queues with Kafka, then probably your abstractions won’t hold anyway, you will need to change your architecture to really take advantage of it.

An abuse of “reversibility” causes for example Generic Cloud Usage, [from ThoughtWorks radar](https://www.thoughtworks.com/radar/techniques/generic-cloud-usage):

> We see organizations limiting their use of the cloud to only those features common across all cloud providers—thereby missing out on the providers' unique benefits. We see organizations making large investments in home-grown abstraction layers that are too complex to build and too costly to maintain to stay cloud agnostic.
>
> [...] which reminds us of the lowest common denominator scenario we saw 10 years ago when companies avoided many advanced features in relational databases in an effort to remain vendor neutral

## Give a random number

The book then goes to Estimating, on topic 15, which is perhaps the most debated point in software development. As usual, they start with a bad example:

> The Library of Congress in Washington, DC, currently has about 75 terabytes of digital information online. Quick! How long will it take to send all that information over a 1Gbps network? How much storage will you need for a million names and addresses? How long does it take to compress 100Mb of text? How many months will it take to deliver your project?

The last question is completely different from all the others, they are conflating estimations that have a super simple and linear models, where you can easily find all the variables, with a complex non-linear estimation where no good model exists. Deceiving the reader into thinking that estimating a software project is as easy and reliable as calculating bandwidth is an awful thing to do.

Then they go on some tips on how to improve your estimations, telling about building a model and breaking it in smaller pieces, they give a lot of focus on getting better at estimating, but the actual valuable thing is some communication tips in the middle, like saying weeks instead of days to convey less precision, and giving multiple range estimations instead of a point estimate.

## Dogmatic 1: believes on estimations, and that one day they they will get very good at it (this day never comes)
## Dogmatic 2: believes that estimations are never possible to get right anyway, so they are useless
## Pragmatic: manages expectations, not accuracy

You see, developers are actually not that bad on estimating, getting around 60% of the estimations right[[1]](https://www.uio.no/studier/emner/matnat/ifi/nedlagte-emner/INF5500/h09/undervisningsmateriale/estimation-error.pdf)[[2]](https://www.sciencedirect.com/science/article/pii/S0164121202000213), people hypothesize that developers are [good at estimating the median, not the mean](https://erikbern.com/2019/04/15/why-software-projects-take-longer-than-you-think-a-statistical-model.html). So the problem really is on the blowup factor: eventually something will get very wrong, and not even the most experienced estimator will be able to predict it, when that happens (and it does), expectations management skills is what really counts.

Considering that, the True Pragmatic Programmer is not in favor or against estimations: it’s just a tool, which they know is flawed (sometimes exponentially flawed), still sometimes the most available one to align teams more or less on what to do, or as a way to get others thinking more deeply about a feature, so they use it when useful, and avoid it (or just give a random number) when useless.

When someone says “the deadline is October” for a pragmatic programmer, they ask “why?” (those five whys mentioned by the book). More often than not I've found out that those are just self-inflicted deadlines: no client knows about this feature you want to launch, other teams are unaware, it wouldn’t really affect much anyone, it’s just politics or a random date someone came up with.

Other times, the deadline actually makes sense, maybe some other team depends on that for a pressing issue, or maybe there is a regulation change, and even though you might use some fancy tricks of iterative development to avoid that, sometimes is just easier to agree on a date and that’s it. Pragmatic.

---

Well I think that’s enough about the book, this post is too long already, but I hope I manage to convey the idea of what a pragmatic actually means, the definition that is closer to the dictionary one.

Thanks for reading! [Follow me on Twitter](https://twitter.com/_rchaves_), and drop a message there if you disagree or want to discuss about any of the points.

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}