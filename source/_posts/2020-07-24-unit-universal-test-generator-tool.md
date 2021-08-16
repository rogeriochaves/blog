---
title: "Unit: universal test generator tool"
---

Do you know how to write tests? Cool! Can you write new test cases easily? Cool. But do you remember how did you set up the tests runner in your project? Me neither.

Once you learn, writing tests is pretty straightforward, and pretty  standard across all languages, you have a way to declare the test cases, either with `it "does something"` or `myTestCase()` and you assert with something like `expect(a).toBe(b)` or `assertEqual(a,b)`, so you can pretty much already test even in a language that is new to you. But how to set up, which test runner to choose and how to run them can vary a great deal.

I don't know about you, but every time I start a new project I find setting up all the boilerplate, build tools and pipeline the most boring part, I just want to jump into the code, and I never know what's worse: having to setup all this myself, or learning how to use an existing boilerplate from the internet and fighting it later. That's why I start simple, as simple as I can in the language at hand, with just a main file and no dependencies if possible, and add things as I need. Problem is, I like doing TDD, so I need to at least setup the minimal boilerplate to run the tests, and a first example to look at so I can copy-paste for next tests.

"I never remember how to write tests in python, let's copy from that old project again", "How do I setup rspec again? I think I'll just skip tests for this project", "I know jest is easy to install but I feel lazy to go to their website and read the getting started for the 10th time", "I'm starting to learn R, I wish I could write tests to it already, it would help me learn" --- those were all thoughts I had, that's why I created [unit](https://github.com/rogeriochaves/unit).

Unit is a CLI tool to setup and generate tests for all programming languages (if your language is not there pull requests are welcome ;)). Now there is only one command you need to memorize:

```bash
unit path/to/file
```

This file can be anything, file.rb, file.js, File.java, etc. Unit will try to identify the language, create a test file for it, add and setup the dependencies if needed and tell you the command to run it, for example:

```bash
$ unit app/user.py
Test file created! Run it now:

python -m unittest tests/test_user.py
```

Go to [github repo](https://github.com/rogeriochaves/unit) for instructions on how to install unit and all the languages supported. Feel free to open any issues there, feedbacks are very welcome.

Thanks for reading!

## Comments

{% blockquote @yourusername https://optional-link.com %}
If you'd like to add a comment, please [send a merge request adding your comment here](https://github.com/rogeriochaves/blog/edit/master/source/_posts/%%filename%%), copying this block as an example
{% endblockquote %}