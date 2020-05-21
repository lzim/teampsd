---
title: "How to use TeamPSD Markdown Linter"
author: "TeamPSD"
date: "2020 May 21"
output: .md
---

This vignette describes the steps necessary to edit/add rules to  the `.markdownlint.yml` file in the root of the repository.

For a video, go to this link: https://youtu.be/mPaXA1DlIlk

## 1) Built-in rules for Markdownlint
Let’s first look at and understand the rules that are pre-baked into Markdownlint here at David Anson's repository, who is the creator of Markdownlint:
https://github.com/DavidAnson/markdownlint/blob/master/doc/Rules.md

1) How to read the Rules.md

Let's take a look at the first rule, **MD001 - Header levels should only increment by one level at a time**.

We can see that there are sections broken down as **tags**, **aliases**, and a **description and code snippets** of examples related to the rule.

The tags and aliases are to help us find the rule we are looking for where we are at the home page of David Anson's Markdownlint repository: https://github.com/DavidAnson/markdownlint

The **description** and **code snippets** describe and show you the definitions of what the rule is attempting to scan for and address.

2) If we look at another rule, let's look at **MD003 - Heading style**.

In addition to the **tags**, **aliases**, **description**, **code snippets**, there is an additional section called **parameters**.

Within parameters, we see the main parameter being `style` and then choices regarding the parameter style such as:

`"consistent", "atx", "atx_closed", "setext", "setext_with_atx", "setext_with_atx_closed"; default "consistent"`

The **description** and **code snippets** also show you the definitions and how each of the parameters look like.

## 2) Convention for adding or editing rules

1) For rules without parameters:

Start with the **rule number** within **quotation marks** followed by a **colon** and then type `True` to indicate that you are activating the rule.

Using **MD001 - Header levels should only increment by one level at a time.** for example:

`"MD001": True`

2) For rules with parameters:

Start with the **rule number** within **quotation marks** followed by a **colon** and 
then **curly brackets** with the **parameter name** within **quotation marks** followed by a **colon**.

Lastly, type in the **parameter option** in **quotation marks** all within the **curly brackets**.

Using **MD003 - Heading style.** for example:

`"MD003": { "style": "atx_closed" }`

## 3) Testing the markdownlint yaml to see if the rules have been applied by using a pull request.

1) Create a markdown file that tests the rules you added. 
2) At least one rule should purposefully pass and one rule should purposefully fail with respect to the content in the markdown file.
3) Create a pull request and you should notice a CI/Build near the bottom of the pull request where you could make a comment.
4) Then CI Build will complete the linting when you see that the build has failed by showing a red X
5) Click on **details** on the right.
5) In the **search log**, type in your **markdown file name** to find it quickly within all the markdown files the linter is searching through.
6) Identify the rules the linter looked for and where it detected markdown mistakes that occured. 

If the build properly detected the rules that you purposefully wrote to fail and pass in your markdown file, then you have successfully added/edited the `.markdownlint.yml` with new/revised rules. 

You can then continue with your pull request to merge the `.markdownlint.yml` into the Master branch. 


# Hester's Formatting:
---
title: "Creating new linters"
author: "Jim Hester"
date: "`r Sys.Date()`"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Creating new linters}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

This vignette describes the steps necessary to create a new linter.

A good example of a simple linter is the `assignment_linter`.
```r
#' @describeIn linters checks that '<-' is always used for assignment
#' @export
assignment_linter <- function(source_file) {
  lapply(ids_with_token(source_file, "EQ_ASSIGN"),
    function(id) {
      parsed <- source_file$parsed_content[id, ]
      Lint(
        filename = source_file$filename,
        line_number = parsed$line1,
        column_number = parsed$col1,
        type = "style",
        message = "Use <-, not =, for assignment.",
        line = source_file$lines[parsed$line1],
        linter = "assignment_linter"
        )
    })
}
```

Lets walk through the parts of the linter individually.

## Writing the linter ##
The first two lines add the linter to the `linters` documentation and export it
for use outside the package.

```r
#' @describeIn linters checks that '<-' is always used for assignment
#' @export
```

Next we define the name of the new linter.  The convention is that all linter
names are suffixed by `_linter`.
```r
assignment_linter <- function(source_file) {
```

Your linter will be called by each top level expression in the file to be
linted.

The raw text of the expression is available from `source_file$content`. However it is
recommended to work with the tokens from
`source_file$parsed_content` if possible, as they are tokenzied from the `R`
parser. These tokens are obtained from `parse()` and `getParseData()`
calls done prior to calling the new linter. `getParseData()` returns a `data.frame`
with information from the source parse tree of the file being linted. A list of
tokens available from
[r-source/src/main/gram.y](https://github.com/wch/r-source/blob/ff1bca2f21aba271d428474f00494eece5c36dd3/src/main/gram.y#L293-L307).

`ids_with_token()` can be used to search for a specific token and return the
associated id.  Note that the `rownames` for `parsed_content` are set to the
`id`, so you can retrieve the rows for a given id with
`source_file$parsed_content[id, ]`.

```r
lapply(ids_with_token(source_file, "EQ_ASSIGN"),
  function(id) {
    parsed <- source_file$parsed_content[id, ]
```

Lastly build a `Lint` object which describes the issue.  See `?Lint` for a
description of the arguments.

```r
Lint(
  filename = source_file$filename,
  line_number = parsed$line1,
  column_number = parsed$col1,
  type = "style",
  message = "Use <-, not =, for assignment.",
  line = source_file$lines[parsed$line1],
  linter = "assignment_linter"
  )
```

You do not have to return a Lint for every iteration of your loop.  Feel free
to return `NULL` or empty lists() for tokens which do not need to be linted.
You can even return a `list` of `Lint` objects if more than one Lint was found.

## Writing linter tests ##
The `linter` package uses [testthat](https://github.com/hadley/testthat) for
testing. You can run all of the currently available tests using
`devtools::test()`.  If you want to run only the tests in a given file use the
`filter` argument to `devtools::test()`.

Linter tests should be put in the
[tests/testthat/](https://github.com/jimhester/lintr/tree/master/tests/testthat)
folder.  The test filename should be the linter name prefixed by `test-`, e.g.
`test-assignment_linter.R`.

The first line in the test file should be a line which defines the context of the text (the linter name).
```r
context("assignment_linter")
```

You can then specify one or more `test_that` functions.  Most of the linters use the same default form.
```r
test_that("returns the correct linting", {
```

You then test a series of expectations for the linter using `expect_lint`.
Please see `?expect_lint` for a full description of the parameters.

I try to test 3 main things.

1. Linter returns no lints when there is nothing to lint. e.g.

```r
expect_lint("blah", NULL, assignment_linter)
```

2. Linter returns a lint when there is something to lint. e.g.

```r
expect_lint("blah=1",
  rex("Use <-, not =, for assignment."),
    assignment_linter)
```

3. As many edge cases as you can think of that might break it. e.g.

```r
expect_lint("fun((blah = fun(1)))",
  rex("Use <-, not =, for assignment."),
  assignment_linter)
```

It is always better to write too many tests rather than too few.

## Adding your linter to the default_linters ##
If your linter is non-project specific you can add it to `default_linters`.
This object is created in the file `zzz.R`.  The name ensures that it will always run after all
the linters are defined.  Simply add your linter name to the `default_linters`
list before the `NULL` at the end.

## Submit pull request ##
Push your changes to a branch of your fork of the
[lintr](https://github.com/jimhester/lintr) repository, and submit a pull
request to get your linter merged into lintr!

