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

The book actually have some very good and pragmatic points, I will start with those because I think they should be the very central idea of the book:

> **CRITICAL THINKING**
>
> The *last* important point is to think critically about what you read and hear. You need to ensure that the knowledge in your portfolio is accurate and unswayed by either vendor or media hype. Beware of the zealots who insist that their dogma provides the only answer—it may or may not be applicable to you and your project.
>
> Never underestimate the power of commercialism. Just because a web search engine lists a hit first doesn’t mean that it’s the best match; the content provider can pay to get top billing. Just because a bookstore features a book prominently doesn’t mean it’s a good book, or even popular; they may have been paid to place it there.

Critical Thinking, that's it, for me that's in the very core definition of what does it mean to be Pragmatic, don't be fooled by dogmas and hype, keep your foot on the ground.

Still for some reason they say it's the *last* important part (I don't know why it isn't the first topic on the book), and later they throw lots and lots of dogmas at you, without explaining the reasoning behind them, contradicting this very same paragraph

They go further on the *Critical Thinking* topic with some tips:

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

This is already somewhat contradictory to the *Good-Enough Software* point made on the book just two topic latter, but the worse is that it's actually based on a theory that was [already debunked](https://news.northeastern.edu/2019/05/15/northeastern-university-researchers-find-little-evidence-for-broken-windows-theory-say-neighborhood-disorder-doesnt-cause-crime/)

A lot of times the story of crime reduction in NY with the broken-window policy is used to back-up this story, but a [quick read](https://www.quora.com/How-did-the-New-York-City-crime-rate-drop-in-the-1990s) shows you that this is a mere correlation, not causation, a change of police strategy to focus on the bigger crimes rather than on petty ones might have actually been much more effective, together with abortion legalization and many other candidates, nobody knows for sure.

The broken-window theory for code feels like a nice idea, but feeling is not enough, Dogmatic Programmers are gullible and like theories, but a True Pragmatic Programer is skeptical, and values scientific rigour (when possible).

## Dogmatic Programmer: gullible, does what feels right, following idealistic theories
## Pragmatic Programmer: skeptical, values scientific rigour (when possible)

Now, the (when possible) part is very important, and very pragmatic too, because to be honest, in software development that's rarelly possible. The more and more I learned about statistics and biases in those recent years, the most I realized that having a proper experiment to discover causality is an extremely hard thing, and in software development, basically impossible.

We cannot build thousands of the same systems, with thousands of developers and add just a small variation (say, broken-window policy) to do a proper [RCT](https://en.m.wikipedia.org/wiki/Randomized_controlled_trial) and see it's effect. We don't even know if static types are better than dynamic ones, [we have many studies](https://danluu.com/empirical-pl/), but all biased or possibly confounded in a way or another.

So many times we have no choice, being pragmatic means you have to use what is practically available: subjective experiences, biased experiments, or even your favorite dogma when there is nothing left. Practically, you need to take a decision (or even decide to not take one), but keeping your skepticism if you want to be pragmatic, fix your foot on the ground.

In that vein, I will tell you a subjective experience I had that touches the broken-window theory, and I wrote about it on the blogpost [Designed v Evolutionary Code](https://rchaves.app/designed-v-evolutionary-code/). It's not that I'm against broken-window theory or that I'm in favor of it, it's just that **it depends**. I take the book's own advice of **What’s the context?** to give you an example of just two cases where it probably works and where it probably doesn't, following [Kent Back's 3X Theory](https://www.youtube.com/watch?v=FlJN6_4yI2A):

1. If you are in exploration mode, most of the code you produce has no value and you will throw away, you need to iterate faster, here broken windows are totally fine, you only focus on the biggest problem, law of diminishing returns kicks in and fixing windows doesn't pay-off at all
2. If you are in extraction mode, on a huge system, even a single flaw can be cathastrophic and cost millions of dollars or lifes (you are under [power law](https://en.m.wikipedia.org/wiki/Power_law)), here you don't want to keep a single window broken, and hope for the best

A True Pragmatic Programmer is skeptical of stories and dogmas, but the book is not skeptical at all, it tries to convice you using short stories and anecdotes, comming from the authors' experience, without any depthness, cues for the possibility of being wrong, and sometimes not even a short explanation, for example:

> **Duplication with Data Sources**
>
> Many data sources allow you to introspect on their data schema. This can be used to remove much of the duplication between them and your code. Rather than manually creating the code to contain this stored data, you can generate the containers directly from the schema. Many persistence frameworks will do this heavy lifting for you.
>
> There’s another option, and one **we often prefer**. Rather than writing code that represents external data in a fixed structure (an instance of a struct or class, for example), just stick it into a key/value data structure (your language might call it a map, hash, dictionary, or even object).

So should I just trust your preference? It doesn't seem very pragmatic. And *why* do you even prefer that? There is not an explanation of the rationale whatsoever, where is the *Critical Thinking*? Where is the *Five Whys*?

Most of the times the book assume all conclusions are self evident, there are many more examples like that:

> you can discipline yourself to write software that’s good enough—good enough for your users, for future maintainers, for your own peace of mind. You’ll find that *you are more productive* and *your users are happier*. And you may well find that *your programs are actually better* for their shorter incubation.

Why?? I mean I'm obviously all in favor of shipping ealier (generally), but why does it make things better? I feel the authors could have done a way better job explaining how production is the real test to our systems, how real life is so complex that is impossible to predict all the variables,  like Nassim Taleb explains so well in Anti-fragile, so we have to be pragmatic and confess we don't know jack, making it clear why the base of Agile actually works (but not always! Context matters)

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

So their *Pragmatic* approach is to bring us a chapter full of axioms, not to challenge them, but to tell us they are universal. Say what!? This in my mind is absolutely non-pragmatic. I expect to find axioms on Clean Code, that's what I bought *that* book, not here, here I expected to find counter-axioms, cases of when you have to actually be pragmatic, take your head off the clouds and break those axioms when it makes *practical* sense. This chapter should really be called *A Dogmatic Approach*.

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

Additionaly, no duplication at all can actually be pretty risky. Remember [left-pad](https://www.theregister.com/2016/03/23/npm_left_pad_chaos/)? Because everyone decided to not duplicate something that can be implemented [in 1 line of code](https://stackoverflow.com/a/13861999) pretty much all javascript projects in the planet were broken for a day. When you have duplication, you can change one thing at a time without risks of breaking the other duplicated pieces, and bringing the whole system to it's knees, like [it happened many times recently with big tech](https://rchaves.app/our-microservices-are-not-antifragile/).

To quote Nassim Taleb, "Redundancy is ambiguous because it seems like a waste if nothing unusual happens. Except that something unusual happens — usually. Nature is filled with "inefficient" redundancies. Animals have two lungs, two kidneys, and two testicles. Since one in a pair of organs can become disabled through disease or trauma, it pays to have a spare"

> DRY is about the duplication of knowledge, of intent. It’s about expressing the same thing in two different places, *possibly in two totally different ways*.

And why is this necessarily a bad thing? I have to bring up Taleb again, there is a reason why evolution brought us so many different animals, which survive through different ways, there is a reason why we have anti-monopoly laws, having different companies doing the same thing in different ways, this way you get the chance that one of them is actually better than the other.

To be continued...

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}