---
title: Our microservices are not antifragile
---

The two terms that got more popular in recent years, and as I started reading about antifragility, I noticed some issues in the way we do software nowadays.

The microservices architecture is a very resilient architecture, when a service has an outage the other ones can keep going about their business, very nice, except if they are critical services. If a critical service goes down, everything goes down.

It's an old practice from software developers to want to remove duplication, and see it as a good thing. Services facilitate that, boundaries are very nicely drawn, many other services can integrate with a unified API, from all different products or even different companies. You can provide new features to everybody else at once, and bugfixes too, much better right? Yes, but you also expose everybody to the same risk at once, and if something catastrophic happens, it may be catastrophic for everybody at once too

This became more clear with recent outage from Facebook, where Instagram, WhatsApp and Facebook Messenger all had an outage at the same time [[1]](https://www.theverge.com/2021/3/19/22340405/instagram-whatsapp-facebook-messenger-down-outage); or the recent Google outage, taking out YouTube, Gmail and most of their other services due to a failure in a centralized authentication system [[2]](https://www.theguardian.com/technology/2020/dec/14/google-suffers-worldwide-outage-with-gmail-youtube-and-other-services-down); or the AWS outage, disrupting a big chunk of the internet [[3]](https://www.theverge.com/2020/11/25/21719396/amazon-web-services-aws-outage-down-internet) and even some door bells [[4]](https://eminetra.com.au/people-cant-vacuum-or-use-their-doorbell-because-amazons-cloud-servers-are-down/74505/) because a single service was down (Amazon Kinesis for data processing). When big tech fails, everybody fails. Centralization creates fragility.

What's the alternative? To build multiple solutions for the same problem. Redundant services, ideally with distinct architecture and technologies. There is no reason you need to centralize Facebook, WhatsApp and Instagram all in the same service when even for the user they look like different companies. Except, it's very hard to argue with business against this "waste" and "inefficiency".

![](../img/antifragile.gif)

_The Hydra, symbol of antifragility. It doesn't have a single resilient head, but many redudant ones, when you cut it you get two more to grow and make the Hydra stronger_

One could argue that because services have 99% uptime, an outage of a couple hours like that would still be cheaper than the cost of building multiple systems to do the same thing, and that they came back stronger from this incident, which is a trait of antifragility. This is true, but what I'm worried about is possible catastrophes, something you cannot recover from.

Say, for example, that a bug on the central authentication service leaks all user credentials, from everybody (happened many times before [[5]](https://haveibeenpwned.com/), with increasing impact over the years), this is not something you can recover, the harm is done. If you had one authentication for each service, the impact would have been limited. It's okay to have separate users for separate products, to sync data only when you need it, you are doing your users and their privacy a favor. Occasional frequent outages is better than rare but huge ones.

This is not an intrinsic problem of microservices, as it's not really a rule of microservices that you should have a single service for a single use case, but it's the current natural direction, as developers and business are keen to eliminate duplication as much as possible. And to be honest, microservices are already much more antifragile than monoliths, by allowing services to loosely communicate, use different technologies and practices, we already limit a lot the impact of an issue, while also learning and improving from the variance between them. Let's just not fool ourselves and forget that we still have some pieces missing to this puzzle, and that the risks of huge centralization at scale will eventually bite us in the butt.

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}