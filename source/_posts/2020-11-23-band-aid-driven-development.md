---
title: Band-aid Driven Development
---

When you do agile you don’t want to have silos, people learned long ago that having a separate UX team, then a frontend team, then a backend team, does not work well, ideally you want to split your product not by technical division, but by business area or product, and the team should be able to deliver new features, end-to-end

You can think this as a horizontal and vertical divisions, horizontal layers are like infra, backend, frontend, UX, and you can lay one on the top of the other, like a pie. Now, when you cut this pie you will want a vertical slice of it, not a horizontal one.

Nevertheless, as systems grow more and more complex, and you still need new features that crosses all those systems, it becomes pretty impossible for a single team to vertically own everything of it.

I will use one example I’ve been through: payments. We had to implement a new payments solution on a marketplace product, which involved many systems such as the shopping UI, pay-in, accounting and pay-out, you can see those as technical layers, and we needed to go through all of them. Each one of those is complex enough to require domain-specific knowledge, so it’s owned by a separate team. It would be very hard to split those people in more vertical teams, this technical division at some point of complexity makes sense.

All those systems needed new developments in order for the new flow to work, but since each is owned by a separate team, how do we do this? If we build one piece after the other then this would be quite waterfall, and bring all the problems waterfall has with it, lots of rework, bad feedback loop, communication problems, etc. We can ask each of those teams to develop it in parallel, but this doesn’t make things much better, at the end each team may have a ready system, but they actually do not talk well with each other, they don’t account for problems you only see during integration, communication is still poor. This, in fact, was what happened on the project I was.

My team specifically was tasked with implementing the UI part, as all the other parts were “ready”, although nobody knew for sure because we never integrated, teams had already moved on to other priorities. As we started to integrate, we noticed some problems, so we changed to instead of focusing on the UI bit, our priority number 1 became the integration of all the systems, end-to-end.

My excellent colleague Ivan Trapeznikov came with a genius idea: let’s just band-aid everything! We don’t care if things are not working properly, we just want to see at least *something* working end-to-end. To do that, instead of thinking of all possibilities, we focused only on one use case, only the most important happy path: customer puts credit card number and partner is paid out. No invalid credit card, no rejected transactions, no failed configuration, we can worry about those things later.

So on we went, and found many problems along the way, like the credit cards encrypting system was missing an extra field, what did we do? We hardcoded the field from a card we had and deployed it production. Parameters missing? Data not in correct format? Just hardcode it. Payment notification is not returning the expected status? Just pretend it was, deploy and… done! Wherever the flow stopped, we band-aided it so it could keep going.

After many band-aids we finally had something “working”. Of course only under a flag, with controlled test users, in a very specific scenario, but at least all systems were talking, end-to-end. Teams realized they were actually not “ready” as they thought they were. Then, because we kept track of all the band-aids, we could actually see which ones were more impactful or risky and needed to be fixed first, those are things you cannot find when focusing on development of a single thing at a time.

The band-aid approach worked really well, we manage to prioritize and fix things, removing the band-aids one by one, by collaborating with other teams and bringing their focus back to this flow until it was, actually, ready, which for me it means being used by real users in production.

One big advantage of this approach rather than fixing all integration issues at the end is that we can flag blockers early on, reducing the time the team would be idle or changing focus waiting for some other team’s development, reducing feedback cycle and risk to build upon integrations that don’t work (the earlier you find a problem, the cheaper it is to fix), leading to less wasted effort and a better time-to-market.

Today I still advocate for always trying to think in any project how could you go end-to-end first as much as possible. As a follow up, to achieve that from the start of the project and reduce the need for band-aids, an idea I like a lot is splitting stories using the hamburger method, I recommend the reading:

https://gojko.net/2012/01/23/splitting-user-stories-the-hamburger-method/

Cheers!

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}