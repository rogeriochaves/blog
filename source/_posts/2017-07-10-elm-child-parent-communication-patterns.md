---
title: "Child-Parent Communication in Elm: OutMsg vs Translator vs NoMap Patterns"
---

When your app Elm start growing, you will want to break it apart in smaller pieces to be able to scale. I covered this in another blogpost: [Structured TodoMVC example with Elm](https://medium.com/@_rchaves_/structured-todomvc-example-with-elm-a68d87cd38da).

Part if this scaling eventually involves the need of sending a Msg from a module to its parent, like when navigational buttons on a specific view need to send a message to the top-level Router.

After some time I started noticing 3 different patterns for handling this, and I refactored Elm TodoMVC to all those different approach [in this repository](https://github.com/rogeriochaves/structured-elm-todomvc) so you can compare them side by side.

The OutMsg Pattern
==================

I believe Folkertdev was the first one I saw to write about child-parent communication in Elm, [his blogpost](http://folkertdev.nl/blog/elm-child-parent-communication/) explains this approach pretty well.

But, to summarize, you basically return an extra value in your update function. So instead of returning this:

```elm
(Model, Cmd Msg)
```

You return this:

```elm
(Model, Cmd Msg, OutMsg)
```

Then, the parent update function is responsible for handling those. This way the child doesn't need to know anything about its parent, but the parent needs to know about its child's OutMsgs.

I've implemented [TodoMVC using this approach](https://github.com/rogeriochaves/structured-elm-todomvc/tree/outmsg). But if you want to check a real-world scale of this, Richard Feldman implemented the [elm-spa-example](https://github.com/rtfeldman/elm-spa-example) this way.

Another example that uses this approach is [elm-datepicker](http://package.elm-lang.org/packages/Bogdanp/elm-datepicker/3.0.2/DatePicker).

The Translator Pattern
======================

The Translator Pattern is very similar to the OutMsg one, but instead of the parent knowing about child's Msgs types, it is the parent that passes which Msgs will be generated, via a translator. Alex Lew explains his approach much better [here](https://medium.com/@alex.lew/the-translator-pattern-a-model-for-child-to-parent-communication-in-elm-f4bfaa1d3f98).

Basically you have a translator which is a record like this:

```elm
type alias TranslationDictionary msg =
  { onInternalMessage: InternalMsg -> msg
  , onPlayerWin: Int -> msg
  , onPlayerLose: msg
  }
```

I've also implemented [TodoMVC using this approach](https://github.com/rogeriochaves/structured-elm-todomvc/tree/translator), and I believe [elm-autocomplete](http://package.elm-lang.org/packages/thebritican/elm-autocomplete/latest) is also a good example.

The [elm-parent-child-update](https://github.com/panosoft/elm-parent-child-update) is a library the helps you with child-parent update which seems to follow this pattern.

The NoMap Pattern
=================

This is something I noticed I was doing. The basic idea is to avoid doing `Cmd.map` and `Html.map`, so instead everybody needs to speak the same language, in other words, your update and view functions will need to return the top-level `Msg` type.

With this you will probably have Msgs like `MsgForLogin`, `MsgForRouter`, etc, so in your View you'd do something like:

```elm
button [ onClick (MsgForLogin SignUp) ] []
```

This is how I first [refactored TodoMVC](https://github.com/rogeriochaves/structured-elm-todomvc/tree/nomap-domain), in fact, first time I saw OutMsg I didn't understood the reason for it, cause I was not mapping my Msgs.

Check out [lightning-talk-app](https://github.com/ckoster22/lightning-talk-app) for a bigger example with this approach. Also, this app seems to follow [Kris Jenkins' way of structuring Elm apps](http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html), which favors this approach as he separates the Msgs types in a Types.elm file.

The [elm-taco](https://github.com/ohanhi/elm-taco) library kinda uses a mix of OutMsg and NoMap patterns by having a top-level "taco" which you can send messages to.

Observations and Comparisons
============================

While researching and refactoring for those patterns, I noted somethings, which can be advantages or disadvantages depending of your needs:

-   On NoMap, the parent's update function keeps about the same as your app grows, while on OutMsg and Translate the parent's update function may get very big, as you need to handle each child's OutMsg ([example](https://github.com/rtfeldman/elm-spa-example/blob/5b86773553d8db2de21d569ee12305c8fb6d0601/src/Main.elm#L320))
-   On OutMsg and Translate the nested modules doesn't need to import anything from upper parents, making them more encapsulated, it would be easier to extract and publish some sub-module as a library for example
-   For NoMap to work your Msgs should live in a separate file from Update, or else you'll have a dependency loop. This is good cause force you to split things, but bad at the same time if you want to have a single file for each module (Home.elm, Login.elm, Router.elm)
-   In NoMap, it is easier to send Msgs anywhere else, but it might be harder to follow all the state changes caused by it.
-   As measured at the moment of this writing, for the TodoMVC refactors, the NoMap approach has 546 LOC, OutMsg 561 and Translator 612 if this matters to you
-   On NoMap you eventually need to use the `_` catch-all case to ignore Msgs from other places you don't want to handle, so there is less help from the compiler, it cannot tell what you are missing (thanks for @mordrax for pointing that out on [elm slack](http://elmlang.herokuapp.com/))
-   In OutMsg and Translator you can just look at the types or translators to discover which child-parent communications are needed, so the compiler can guide you implementing those, while on NoMap this communication is more implicit
-   The translator approach seems to be a good idea for giving your own Msgs to a external component, like [elm-autocomplete](http://package.elm-lang.org/packages/thebritican/elm-autocomplete/latest)
-   I found the translator pattern difficult to follow with harder to understand error messages from Elm compiler while building it
-   If you don't modify the `(Model, Cmd Msg)` standard you can use the fine [elm-return](http://package.elm-lang.org/packages/Fresheyeball/elm-return/latest) library
-   Some people consider not having `Html.map` as [a good practice](https://gist.github.com/rofrol/fd46e9570728193fddcc234094a0bd99#reusable-views-instead-of-nested-components) to avoid creating "components"
-   You can get a lot of benefit from mixing those approaches, for example, you could just avoid `Html.map` for views, while still use OutMsg for updates, or you could use NoMap only for the top-level Msgs, with OutMsgs down below, while rendering an external Translated component

Resources
=========

I believe Child-Parent Communication is often more importante when scaling and doing SPAs, that's why lots of stuff I found was reading this reddit thread about Scaling Elm Apps:

<https://www.reddit.com/r/elm/comments/65s0g4/resources_regarding_scaling_elm_apps>

Cheers!

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}