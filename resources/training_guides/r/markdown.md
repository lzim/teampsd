---
title: "Markdown Language"
author: "Team PSD"
date: "SP 2020_01_30"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

# Markdown Language

## Training Objectives:
Upon completion of this module, the learner will be able to:

1. Use pieces of Markdown code for basic formatting of text
2. Produce tables and graphics using Markdown
3. Understand the difference between the "Code View" and "Formatted View" of text when using Markdown


## Point of Contact: Stacey Park

## Full Instructions
TeamPSD uses Markdown, a markup language for simple formatting, across multiple workgroups and workflows including GitHub and OSF. We add the ".md" file extension to our file names in GitHub to change "Raw Code" into a formatted file using Markdown language. 

Pro Tip: When using Markdown in GitHub in "Edit" mode, you can switch between the "Code View" and the "Formatted View" by clicking on "Preview Changes" at the top left.  

<img src="https://help.github.com/assets/images/help/repository/edit-readme-preview-changes.png" height="250" width="400">

You can also see the "Code View" on a saved file, by clicking on "Raw" in the top right corner to see the "Code View" of the file.

<img src="https://ugotsta.files.wordpress.com/2015/07/github-raw-button.png" height="250" width="800">

Below are the markdown options you will most often use:  

### 1. YAML Header
A YAML header is used only at the top of every document, meaning for example, we DO NOT use this on issue cards but we DO use this on Learner SEE guides.
- The text coming after each section of the YAML header **must be contained within quotes ("text")** to format properly.
- In the author section, we will always put "TeamPSD". Oftentimes our work is a collection of the efforts and ideas of multiple team members past and present.
- In the date section, **DO NOT erase the previous person's record of name and date the file was worked on.** Instead, **add** your name and date in while still keeping the record of previous contributors to the document in the YAML header.
- The output section outlines all of the possible ways the document can be outputted in R. For more instructions on that, click here.

#### Code View: 
```
---
title: "Write a descriptive title here"
author: "Team PSD"
date: "add your name/initials and the date"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---
```

#### Formatted View: 
Look to the very top of this document.  

### 2. Carriage Return
In Markdown, if you use the "Enter" key alone, you will not get a carriage return (unlike MS Word for example). To create the "carriage return," you need to use two spaces after your text followed by the "Enter" key.  

#### Code View
```
Sentence 1. Followed by no carriage return.
Sentence 10.  
Followed by a carriage return.
```

#### Formatted View
Sentence 1. Followed by no carriage return.  
Sentence 10.  
Followed by a carriage return.


### 3. Bold
To bold a piece of text, use double asterisks (**) before and after the text with no spaces between the text and symbols.

#### Code View:
```
**This is how you bold text.** 
```

#### Formatted View:
**This is how you bold text.** 

### 4. Italicize
To italicize a piece of text, use single asterisks (*) or an underscore (_) before and after the text with no spaces between the text and symbols.

#### Code View:
```
*You can italicize text like this.*  
_Or you can italicize like this._
```

#### Formatted View:
*You can italicize text like this.*  
_Or you can italicize like this._


### 5. Headers
Headers are created by using hashtags (#) with an increasing number of hashtags used to create smaller and smaller headers. Before the relevant piece of text, add hashtag(s) followed by a space before the text.  

#### Code View:
```
# This is a Level 1 Header. 
## This is a Level 2 Header.
### This is a Level 3 Header.
#### This is a Level 4 Header.
```

#### Formatted View:
# This is a Level 1 Header. 
## This is a Level 2 Header.
### This is a Level 3 Header.
#### This is a Level 4 Header.

### 6. Numbered Lists
To create numbered lists, use numbers and a period followed by a space before the text, with a carriage return per numbered item. To create multiple levels, in the list add 3 spaces before the number for each new level.

#### Code View:
```
1. Item 1
2. Item 2
3. Item 3
   1. Item 3a
   2. Item 3b
      1. Item 3b-1
      2. Item 3b-2
```

#### Formatted View:
1. Item 1
2. Item 2
3. Item 3
   1. Item 3a
   2. Item 3b
      1. Item 3b-1
      2. Item 3b-2  
      

### 7. Bulleted Lists
To create numbered lists, use dashes followed by a space before the text, with a carriage return per bullet item.
To create multiple levels, in the list add 3 spaces before the number for each new level.  

#### Code View:
```
- Item 1
- Item 2
- Item 3
   - Item 3a
   - Item 3b
      - Item 3b-1
      - Item 3b-2
```

#### Formatted View:
- Item 1
- Item 2
- Item 3
   - Item 3a
   - Item 3b
      - Item 3b-1
      - Item 3b-2

### 8. Links & Images
To hyperlink a piece of text, put the linked text in brackets ([]) and the link in parentheses ( () ).

To add images, you can either use Markdown formatting (![]()) or the HTML image tag (<img src="" height="" width="">). The benefit of the HTML image tag is the ability to specify the height and width of the image. You can find the link to the image needed for the code by navigating to the image on your browser, then copy + paste the link at the top of the webpage. 

Finally, to create a hyperlinked image, combine the code for hyperlinking text and the HTML image tag([<img src="" height="" width="">]()). 

#### Code View:
```
Hyperlink text  
[insert text here](insert link here - i.e. https://github.com)

Add image  
Markdown format - ![](include the link to the image here - i.e. https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png?raw=true)  

HTML image tag - <img src="include the link to the image here i.e. https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png?raw=true" height="100" width="500">    

Hyperlink image  
[insert HTML image tag here - i.e. <img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_live_sq_sm.png" height="175" width="290">](https://github.com/lzim/mtl/blob/master/session03/s03_learner/mtl_session03_see.md)
```

#### Formatted View:

Hyperlink text  
[insert text here](https://github.com)

Add image  
Markdown format - ![](https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png?raw=true)  

HTML image tag - 
<img src="https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png?raw=true" height="100" width="500">

Hyperlink image  
[<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_live_sq_sm.png" height="175" width="290">](https://github.com/lzim/mtl/blob/master/blue/session03/s03_learner/mtl_session03_see.md)

      

### 9. Task Lists
You can create task lists with boxes that you can "check off". To "check off" the boxes, either manually put an "x" between the brackets or click on the square box that the code produces in the formatted version.  

#### Code View:
```
- [x] Task 1
- [x] Task 2
- [x] This is a complete item
- [ ] This is an incomplete item
```

#### Formatted View:
- [x] Task 1
- [x] Task 2
- [x] This is a complete item
- [ ] This is an incomplete item

### 10. Tables
You can create tables by assembling a list of words and dividing them with hyphens - (between the top header row and the rest of the table), and then separating each column with a pipe |.  

Make sure that there are the same number of columns created in each row as the maximum number of columns needed. For example, if you use 3 pipes to create 4 columns toward the middle of your table, every row in the table needs 3 pipes (regardless of whether each cell has text or not) for the table to properly format.  

#### Code View:
```
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column
```

#### Formatted View:
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column


### 11. Username @mentions
You can ping someone in any issue or pull request in the comments thread. We use this when we are discussing an item back and forth across several team members or if you need to alert them to a specific issue. You can ping someone by using the @ symbol followed by someone's GitHub username (with no spaces).  

Be careful that you are pinging the correct person. Many people have similar names across GitHub and you can inadvertently ping the wrong person in the world with the same name, if you are not using the exact username for the intended person.  

#### Code View:
```
@staceypark
```

#### Formatted View:
@staceypark

### 12. Cross-referencing Issues
You can cross-reference issues in any issue or pull requests in the comments thread. We use this function to ensure that issues that are related to each other in terms of dependency or may have related conversations that are split are "cross-referenced" to each other. To "cross-reference" an issue, use a single hashtag (#) followed by the issue number (with no spaces).  

#### Code View:
```
#605
```

#### Formatted View:
#605


#### Common Mistakes:
1. Double check that you've used the correct number of spaces for the type of formatting you want to do.
2. If links are involved in the code, double check the link and make sure it still works.
3. Double check that you are using two spaces between sentences to create a carriage return.

## Training Record:
#### Practice
###
- [ ] Exercise 1: In the space below, create a section of text with:
1. Level 2 header of any text 
2. 3 sentences of any text each separated by a carriage return and numbered as a numbered list.
3. Sentence 1 should be formatted as a task list item and the box should be checked off. The text of Sentence 1 should be both bolded and italicized.
4. Sentence 2 should have one sub-item of any text that is indented one level.
5. Sentence 3 should be followed by two bulleted items of any text.

Completed on: ________________ with _________________________ 

- [ ] Exercise 2: In the space below, create a 2 by 2 table with:  
1. Top left and right quadrants should be bolded text of your choice.
2. Bottom left and right quadrants should have any image found in mtl.how/teampsd.
3. The image in the bottom left quadrant should hyperlink to mtl.how/demo.
4. The image in the bottom right quadrant should hyperlink to mtl.how/team.

Completed on: ________________ with _________________________  

#### Supervised 
- [ ] Supervised 1: (describe task here)        
Completed on: ________________ with _________________________  

- [ ] Supervised 2: (describe task here)        
Completed on: ________________ with _________________________  
