---
title: "TeamPSD GitHub Guide"
author: "Jennifer Li"
date: "July 2020"
output:
  github_document: default
  html_document: default
  ioslides_presentation: default
  slidy_presentation: default
---

# GitHub 
TeamPSD's main platform for project tracking is GitHub + the extension of [ZenHub](https://chrome.google.com/webstore/detail/zenhub-for-github/ogcgkffhplmphkaahpmffcafajaocjbd?hl=en-US) for project management. 

We :heart: GitHub for sharing the same commitment and values in having a free and open science workflow. 

## GitHub Repositories

### Non-VA Repositories

1. [lzim/teampsd](https://mtl.how/teampsd) (Public)
This repository contains TeamPSD resources and track the work that the team uses internally (i.e. Bookdown, document_team, depend_products, etc.)
2. [lzim/mtl](https://mtl.how/) (Public)
This repository supports *Modeling to Learn* and contain the content in describe_learners, detail facilitators, and SIM/Model Code.
3. lzim/sim (Public)
This repository supports the *Modeling to Learn* Simulation User Interface plaform, Forio Epicenter, & and model files from Vensim DSS. 
4. [lzim/research](https://github.com/lzim/mtl_code) (Private)
This repository holds the analysis for the (R01, IIR, R21) and disseminate science.
5. [lzim/mtl_team_tracker](https://mtl.how/mtl_team_tracker) (Private)
This repository is used by VA Clinicians and *Modeling to Learn* Co-facilitators to track team progression.

### VA Enterprise Repositories

6. "va/mtl" (operations pipeline)
This repository stores the operations code used to support *Modeling to Learn* teams.
7. "va/research" research pipeline)
This repository holds the backend code that needs to stay internal for our grants.

### Workflow
![teampsd_2 0_organization_workflow](https://user-images.githubusercontent.com/59668647/88051957-5d172500-cb0e-11ea-9e8a-d343e293d6d3.png)

## Basics of GitHub 
To go through a quick overview on repositories, branches, commits, and opening/merging pull requests, click [here](https://guides.github.com/activities/hello-world/).

For a glossary of GitHub terms, click [here](https://docs.github.com/en/github/getting-started-with-github/github-glossary).

## Style
We use R Markdown format for syntax and style which you can refer to here (ADD HYPERLINK). Use a human and computer readable format to name files, meaning all lowercase, underscores, and dates (as necesary) with a name that will be meaningful to whoever reads it. 

We will update with links to style guides.

## ZenHub for Project Management
Our team uses the GitHub Google Chrome extension, [ZenHub](https://chrome.google.com/webstore/detail/zenhub-for-github/ogcgkffhplmphkaahpmffcafajaocjbd?hl=en-US), for project management.

#### ZenHub Flow - Issue Card

To create an issue card, begin [here](https://github.com/lzim/teampsd/issues/new/choose) and follow the flow to create and maintain your issue card. 
![Zenhub Flow my version to learn](https://user-images.githubusercontent.com/59668647/88049640-5ab2cc00-cb0a-11ea-89a0-a09d13d4761d.png)

## Files
### Create and Edit Files

1. To create files, choose the branch or folder you want and click "Create New File."  
2. To view the file's code, simply click "Raw" in the top right corner of the file, next to "Blame" and "History."  
3. To view comments that you/others have added, you can click on "History" and then check for an "ellipses" symbol. This symbol indicates that a comment has been added to the commit. To see the comment, click on the ellipses. 
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_5.gif)  

###  Upload Files
To upload files, choose the branch or folder you want and upload the file. The file will be named as it was in your computer, so make sure to give the file a name according that is simple and reflective of its contents to anyone that reads the file name.  

### Download Files
Files cannot be downloaded individually - you have to download the entire branch.  You can find the green "Download" button on the main page of each branch.

## Branches
### Create and Edit Branches

1. Open up the specific file you want to edit.  Create a new working branch and name it using all lowercase, no spaces (use underscores), and your initials - i.e. "facilitation_guide_sp".    
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_1.gif)  

2. Make sure you're in the branch you just created instead of the original branch.  Click the pencil icon to edit.  Edit the file and add comments on changes you made.  Click on "Commit".  
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_2.gif)  

## Pull Requests
### **Create and Edit Pull Requests**

1. Go to "Pull Requests" and click on "New Pull Request". The "Base" branch should be the original branch (most likely "master").  The "Compare" branch will be the branch you created. Click on "Create a New Pull Request".  Add "Reviewers" and click on "TeamPSD" for the "Project section. Click on "Create Pull Request".   
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_3.gif)  

2. To add line specific comments, click on "Files Changed".  Hover your mouse in front of the specific line in question and a blue plus sign will appear.  Click on that and add your comment.  
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_4.gif) 
