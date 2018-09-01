---
title: "TeamPSD GitHub Guide"
author: "Stacey Park"
date: "August 31, 2017; Updated August 31, 2018"
output:
  github_document: default
  html_document: default
  ioslides_presentation: default
  slidy_presentation: default
---
<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  
# Facilitate Workgroup

# TeamPSD GitHub Guide  

### **Basics of GitHub**  
You can go through the quick guide in the link below. It will teach you about repositories, branches, commits, and opening/merging pull requests.  
https://guides.github.com/activities/hello-world/

### **Style**
We use R Markdown format for syntax and style which you can refer to here (ADD HYPERLINK). Use a human and computer readable format to name files, meaning all lowercase, underscores, and dates (as necesary) with a name that will be meaningful to whoever reads it. For other style guidelines on TeamPSD materials, please refer to (HYPERLINK)  

### **Creating and Editing Files**  
1. To create files, choose the branch or folder you want and click "Create New File."  
2. To view the file's code, simply click "Raw" in the top right corner of the file, next to "Blame" and "History."  
3. To view comments that you/others have added, you can click on "History" and then check for an "ellipses" symbol. This symbol indicates that a comment has been added to the commit. To see the comment, click on the ellipses. 
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_5.gif)  

### **Uploading Files**  
To upload files, choose the branch or folder you want and upload the file. The file will be named as it was in your computer, so make sure to give the file a name according that is simple and reflective of its contents to anyone that reads the file name.  

### **Downloading Files**  
Files cannot be downloaded individually - you have to download the entire branch.  You can find the green "Download" button on the main page of each branch.

### **Creating and Editing Branches**
1. Open up the specific file you want to edit.  Create a new working branch and name it using all lowercase, no spaces (use underscores), and your initials - i.e. "facilitation_guide_sp".    
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_1.gif)  

2. Make sure you're in the branch you just created instead of the original branch.  Click the pencil icon to edit.  Edit the file and add comments on changes you made.  Click on "Commit".  
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_2.gif)  

### **Updating Branches**
Everytime you start a new work session, create a fresh branch from the master or create a pull request to sync new changes from the master to yours.  The "Base" branch should be your branch and the "Compare" branch will be "master"

### **Creating and Editing Pull Requests**
1. Go to "Pull Requests" and click on "New Pull Request". The "Base" branch should be "master".  The "Compare" branch will be the branch you created. Click on "Create a New Pull Request".  Add "Reviewers" and click on "TeamPSD" for the "Project section. Click on "Create Pull Request".   
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_3.gif)  

2. To add line specific comments, click on "Files Changed".  Hover your mouse in front of the specific line in question and a blue plus sign will appear.  Click on that and add your comment.  
![](https://raw.githubusercontent.com/lzim/teampsd/videos/github_workflow_4.gif) 

### **Pull Request vs. Issues**
Pull are for...
1. Simultaneous real-time editing up until that session with our learners in one location
2. Simultaneous editing acrosss the team
3. Ability to see formatted document and make direct edits, add line-specific comments, and discuss the document as a whole]  
*Do not create a pull request for uploading a non-markdown document (i.e. word or excel) to the master*

Issues are for...
1. Discussing questions and decisions across the team on an issue

### **Creating and Changing Folders**
Files can be created and moved in folders with use of the forward slash (/).  For example, "teampsd/mtl_facilitate/session1.rmd" means in the teampsd repository, there is a folder called "mtl_facilitate" with the file session1.rmd.  Likewise, to move "session1.rmd" to a different folder, simply click on the pencil icon/edit button on the file and change the file name by use of the Backspace button. For example, changing the pathway to "session1.rmd" to "teampsd/mtl_pilot/session1.rmd" moves the file to the "mtl_pilot" folder.  
*Tip: In order to prevent accidentally creating new folders, keep two tabs open - 1) one tab with the file to be moved; 2) second tab of the new location for the file. This way you can ensure the file pathway is accurate.*
