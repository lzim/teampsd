 
 ---
title: "TeamPSD GitHub Guide"
author: "Rita Hitching"
date: "April 27, 2020"
output:
  github_document: default
  html_document: default
  ioslides_presentation: default
  slidy_presentation: default
---

<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  


# TeamPSD GitHub Guide for Level 1-5 headers 


### **Style**
1. We use R Markdown format for syntax and style for all TeamPSD documents - [guide available](https://rmarkdown.rstudio.com/).  
2. The style and content within TeamPSD documents accomodates for human and computer readable format to name files, meaning all lowercase, underscores, and dates (as necesary) with a name that will be meaningful to whoever reads it. 
3. Other style guidelines on TeamPSD materials 

### **Checklist Editing Exisitng Team PSD Files for Consistent Header Style**  
1. Open up the specific file you want to edit.  
2. Create a new working branch and name it using all lowercase, no spaces (use underscores), and your initials - 

i.e. "facilitation_guide_sp".    
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_1.gif)  

2. Make sure you're in the branch you just created instead of the original branch.  Click the pencil icon to edit.  Edit the file and add comments on changes you made.  Click on "Commit".  
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_2.gif)  

### **Creating and Editing Pull Requests**
1. Go to "Pull Requests" and click on "New Pull Request". The "Base" branch should be the original branch (most likely "master").  The "Compare" branch will be the branch you created. Click on "Create a New Pull Request".  Add "Reviewers" and click on "TeamPSD" for the "Project section. Click on "Create Pull Request".   
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_3.gif)  


 
 Checklist for how to review existing resources to conform to a consistent TeamPSD style and standard use of Markdown for the manual
 Define how to use a Level 1-5 headers in a standard way
 YAML will be removed when knitted and Level 1 Header needs to be the first item in each of the documents
 NOTE: Consitent w/the #hqhuddle week of 4/20/2020 we'll keep YAML headers in the GitHub original source material, they are removed when knitting using .Rmd 
 Review of the specific documents that are in the manual (between Rita, Jenn, Jane, & Debbie).
 Team PSD members can use an RProject for knitting "teampsd_bookdown.rproj"
 Ultimately, we we also add the bookdown RProject to Team PSD in "teampsd_manual" folder.
