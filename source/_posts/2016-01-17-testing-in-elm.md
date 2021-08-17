---
title: Testing in Elm
---

**May 19: update to Elm 0.17**
**Nov 21: update to Elm 0.18**

Elm is a great language with an awesome compiler, basically, if your code compiles, the chances are that it has zero runtime exceptions.

But, although your code will run, you must also assure that it behaves as you expect, ensuring things that the compiler won't. We can go even further, with fuzz testing, but more on that later.

Testing with elm-test
---------------------

[**ElmTest**](https://github.com/elm-community/elm-test) is the unit test library for Elm, let's use that. First, create a new project:

mkdir test-example\
cd test-example\
elm package install

This will create the **elm-package.json** file with information about your project.

Previously, this article explained how to setup your tests, but now there is a JavaScript CLI for elm-test that made the setup easier than ever.

Install **elm-test**:

```bash
npm install -g elm-test
```

Then the init command should set up everything for you:

```bash
elm test init
```

And just like that, you are ready to run the tests:

```bash
elm test
```

You should see:

```bash
elm-test
--------

Running 7 tests. To reproduce these results, run: elm-test --seed 1509338799

↓ Sample Test Suite
↓ Unit test examples
✗ This test should fail - you should remove it

Failed as expected!
```

Now go and fix that. You can also get better flow by running the tests in watch mode with `elm test --watch`

Tree structure
--------------

The init command already created the tree structure and some example specs for you, it should look like that:

```bash
.
├── elm-package.json
├── src
└── tests
    ├── Main.elm
    ├── Tests.elm
    └── elm-package.json
```

The **Main.elm** file is the one that includes all your other tests to be ran.

You should also have noted that it created a second **elm-package.json** inside the tests folder. This is a good practice in order to have your test dependencies separated from your source dependencies.

Writing Tests
-------------

Let's look at the first part of **tests/Tests.elm** examples:

```elm
module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String


all : Test
all =
    describe "Sample Test Suite"
        [ describe "Unit test examples"
            [ test "Addition" <|
                \() ->
                    Expect.equal (3 + 7) 10
            , test "String.left" <|
                \() ->
                    Expect.equal "a" (String.left 1 "abcdefg")
            , test "This test should fail - you should remove it" <|
                \() ->
                    Expect.fail "Failed as expected!"
            ]
        ]
```

This has basically all you need for writing elm unit tests. Tests are composed of a `describe` which join a list of `tests`, which only have one expectation each.

As you can see in the first line `module Test`, this is just an elm module like any other. You can rename it if you want. Also, you can nest `describe` statements. So, it is easy to split your tests to match your `src` structure and then join them all together with a final `describe`. Try it!

Fuzz Testing
------------

ElmTest also comes with a great feature which is [Fuzz Testing](https://en.wikipedia.org/wiki/Fuzz_testing), also known as [property-based tests](http://blog.jessitron.com/2013/04/property-based-testing-what-is-it.html), [generative tests](http://www.pivotaltracker.com/community/tracker-blog/generative-testing), or [QuickCheck-style tests](https://en.wikipedia.org/wiki/QuickCheck).

The problem is that with simple unit tests you usually give just a few examples to test the output, and you can forget to test some case. With fuzz testing you can generate about 100 different inputs to check if your function fits for all the cases.

For testing with fuzz, you'll need a **fuzzer**, which is something that produces random values. **ElmTest** already comes with some for generating random **lists**, **ints**, **strings**, and others. You can use them like this:

```elm
all : Test
all =
    describe "Fuzz Sample Test Suite"
       [ describe "Fuzz test examples, using randomly generated input"
            [ fuzz (list int) "Lists always have positive length" <|
                \aList ->
                    List.length aList |> Expect.atLeast 0
            , fuzz (list int) "Sorting a list does not change its length" <|
                \aList ->
                    List.sort aList |> List.length |> Expect.equal (List.length aList)
            , fuzzWith { runs = 1000 } int "List.member will find an integer in a list containing it" <|
                \i ->
                    List.member i [ i ] |> Expect.true "If you see this, List.member returned False!"
            , fuzz2 string string "The length of a string equals the sum of its substrings' lengths" <|
                \s1 s2 ->
                    s1 ++ s2 |> String.length |> Expect.equal (String.length s1 + String.length s2)
            ]
    ]
```

Use BDD Style
-------------

So, I've been testing my JavaScript code for a good amount of time now, and I really like the way your tests in something like [chai](https://github.com/chaijs/chai) or [jasmine](https://jasmine.github.io/) ends up being very descriptive and idiomatic, so I've created the [**elm-test-bdd-style**](https://github.com/rogeriochaves/elm-test-bdd-style)on top of **elm-test.**

It is basically just some alias really, but it does help writing the specs.

To use that, install with elm package:

```
cd tests
elm package install rogeriochaves/elm-test-bdd-style
```

Now if you import **ElmTestBDDStyle**, you can use **it** instead of test, and **expect ... toBe** instead of `|> Expect`. I've also removed the need for passing a function when not fuzz testing.

So we can rewrite out **Tests.elm** like this:

```elm
module Tests exposing (..)

import Test exposing (..)
import Expect exposing (..)
import Fuzz exposing (list, int, tuple, string)
import String
import ElmTestBDDStyle exposing (..)


all : Test
all =
    describe "Sample Test Suite"
        [ describe "Unit test examples"
            [ it "can add things" <|
                expect (3 + 7) to equal 10
            , it "gets the first letter" <|
                expect "a" to equal (String.left 1 "abcdefg")
            , it "fails - you should remove it" <|
                fail "Failed as expected!"
            ]
        , describe "Fuzz test examples, using randomly generated input"
            [ fuzz (list int) "Lists always have positive length" <|
                \aList ->
                    expect (List.length aList) toBe atLeast 0
            , fuzz (list int) "Sorting a list does not change its length" <|
                \aList ->
                    expect (List.sort aList |> List.length) to equal (List.length aList)
            , fuzzWith { runs = 1000 } int "List.member will find an integer in a list containing it" <|
                \i ->
                    expect (List.member i [ i ]) toBe true "If you see this, List.member returned False!"
            , fuzz2 string string "The length of a string equals the sum of its substrings' lengths" <|
                \s1 s2 ->
                    expect (s1 ++ s2 |> String.length) to equal (String.length s1 + String.length s2)
            ]
        ]
```

It is a little more readable in my humble opinion.

Where to go next
----------------

There are some other toolings for help with elm testing, for example [elm-testable](https://github.com/avh4/elm-testable) allows you to test Effects and Tasks, [elm-webdriver](https://github.com/lorenzo/elm-webdriver) allows you to control selenium with elm for writing end-to-end tests, and [lobo](https://github.com/benansell/lobo) is an alternative elm-test runner.

There is also the `#test` channel on [elm's community slack](http://elmlang.herokuapp.com/) were you will find help to test your elm code and also people willing to improve elm testing tooling.

Conclusion
----------

We now have all the tools we need to build a fully tested Elm code, this combined with Elm powerful compiler will make it very hard for any bugs to pass by.

Although we don't have all the tools purely on Elm right now, we can use some JavaScript or even other languages tooling to help with the development like I showed. For end-to-end tests for example you can also use [Capybara](http://jnicklas.github.io/capybara/) or [WebdriverIO](http://webdriver.io/) which are great tools.

If you got yourself interested on this, start playing with Elm today, and help us improve our tooling.

Feedbacks will be received with love ❤

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}