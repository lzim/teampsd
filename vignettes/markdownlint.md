---
title: "How to use TeamPSD Markdown Linter"
author: "TeamPSD"
date: "2020 May 21"
output: .md
---

This vignette describes the steps necessary to edit/add rules to  the `.markdownlint.yml` file in the root of the repository.

For a video, click [here](https://youtu.be/dhrLOyaFDSg).

Before beginning, let's **first start create a branch** to work off of within your repository, since you will need to initiate a pull request by the end of this guide. 

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

Start with the **rule number** within **quotation marks** followed by a **colon**, then  **space**, then type `True` to indicate that you are activating the rule.

Using **MD001 - Header levels should only increment by one level at a time.** for example:

`"MD001": True`

2) For rules with parameters:

Start with the **rule number** within **quotation marks** followed by a **colon**, **space**, 
then **left curly bracket**, space, followed by the **parameter name** within **quotation marks** and a **colon**, and then **space**.

Lastly, type in the **parameter option** within **quotation marks**, **space**, and ending the rule with the remaining **right curly bracket** to close off the brackets. 

Using **MD003 - Heading style.** for example:

`"MD003": { "style": "atx_closed" }`

3) Use a note to document and describe the rule:

To add a note, use `#` followed by a **space** and then the description of the rule to provide an easier way of identifying what the rule is tasked to lint for.

Using **MD003 - Heading style.** for example:

`# Heading style`

`"MD003": { "style": "atx_closed" }`

**Common Errors:** 
1. Keep in mind of spaces to be consistent within YAML/YML files.
2. Remember to add a **comma** at the end of the rule **UNLESS** your rule is the last rule in the overall list.

**Example:**

`# Unordered list indentation`

`"MD007": { "indent": 4 },`

`# Heading style`

`"MD003": { "style": "atx_closed" }`

## 3) Testing the markdownlint yaml to see if the rules have been applied by using a pull request.

1) Continuing to be in your branch, create a markdown file that tests the rules you added. 
2) At least one rule should purposefully pass and one rule should purposefully fail with respect to the rules you have chosen in the markdown file.
3) Create a pull request and you should notice a CI/Build near the bottom of the pull request where you could make a comment.
4) Then CI Build will complete the linting when you see that the build has failed by showing a red X.
5) Click on **details** on the right.
5) In the **search log**, type in your **markdown file name** to find it quickly within all the markdown files the linter is searching through.
6) Identify the rules the linter looked for and where it detected markdown mistakes that occured. 

If the build properly detected the rules that you purposefully wrote to fail and pass in your markdown file, then you have successfully added/edited the `.markdownlint.yml` with new/revised rules. 

You can then delete your test file and continue with your pull request to merge the `.markdownlint.yml` into the Master branch to implement the new linting rules.
