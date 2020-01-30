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

## Point of Contact: Stacey

## Full Instructions
TeamPSD uses markdown language across multiple workgroups and workflows including GitHub and OSF.
Markdown is a markup language that allows for simple formatting. 

At any point in time, when working in GitHub, you can switch between the "code view" to the "formatted view" by clicking on "preview changes" at the top.  

<img src="https://help.github.com/assets/images/help/repository/edit-readme-preview-changes.png" height="250" width="400">

Below are the formatting needs you will most often encounter:  

### 1. YAML Header
A YAML header is used at the top of every document, meaning we DO NOT use this on issue cards but we DO use this on Learner SEE guides.
- The text coming after each section of the YAML header **must be contained within quotes ("text")** to format properly.
- In the data section, **DO NOT erase the previous person's record of name and date the file was worked on.** Instead, **add** your name and date in while still keeping the record of previous contributors to the document in the YAML header.
- The output section outlines all of the possible ways the document can be outputted. To output the document in one of these other formats, click here.

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
To bold a piece of text, use double asterisks (**) before and after the text with no space.

#### Code View:
```
**This is how you bold text.** 
```

#### Formatted View:
**This is how you bold text.** 

### 4. Italicize
To italicize a piece of text, use single asterisks (*) or an underscore (_) before and after the text with no space.

#### Code View:
```
*You can italicize text like this.*  
_Or you can italicize like this._
```

#### Formatted View:
*You can italicize text like this.*  
_Or you can italicize like this._


### 5. Headers
Headers are created by using hashtags (#) with an increasing number of hashtags used to create smaller and smaller headers. Before the relevant piece of text, add hashtag(s) and a space.  

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
To create numbered lists, use numbers followed by a period with a carriage return per numbered item.
To create multiple levels, in the list add 3 spaces before the number for each new level.

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
To create numbered lists, use dashes followed by a carriage return per bullet item.
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

### 8. Images
To add images, make sure that the image has a "place" that the code can "speak to." 
For example, in GitHub when adding an image to a document, the image needs to exist somewhere on the Internet (often in another place on GitHub), but it **CANNOT** exist within the folders of your computer. The Internet cannot "communicate" to your computer to look for and render the image.  

You can use Markdown formatting for images or the HTML image tag. The benefit of the HTML image tag is the ability to specify the height and width of the image. You can find the link to the image needed for the code by navigating to the image, then copy + paste the link at the top of the webpage. 

#### Code View:
```
Markdown format - ![](include the link to the image here - i.e. https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png)  

HTML image tag - <img src="include the link to the image here i.e. https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png" height="100" width="500">    
```

#### Formatted View:
![](https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png)  
<img src="https://github.com/lzim/teampsd/blob/master/resources/logos/modeling_to_learn_sm.png" height="100" width="500">
      

### 9. Task Lists
You can create task lists that you can "check off" (either by manually putting an "x" between the brackets or by clicking on the square box that the code produces in the formatted version.  

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
Where


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
- [ ] Exercise 1: (describe task here)     
Completed on: ________________ with _________________________ 

- [ ] Exercise 2: (describe task here)        
Completed on: ________________ with _________________________  

#### Supervised 
- [ ] Supervised 1: (describe task here)        
Completed on: ________________ with _________________________  

- [ ] Supervised 2: (describe task here)        
Completed on: ________________ with _________________________  
