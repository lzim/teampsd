# GH-Pages Branch

This branch contains documents and resources for the Team PSD Manual.  The
rendered manual can be found [here](https://lzim.github.io/teampsd).

# How to Contribute:

## 1.	Create a Feature branch from the GH-Pages Branch
- Start by creating a feature branch with the beginning of the branch name with "feature-".
![image](https://user-images.githubusercontent.com/59668647/108416486-9702f380-71e3-11eb-8b1f-9a56e6221e4d.png)

## 2.	Add a markdown file into the Feature branch.
 
![image](https://user-images.githubusercontent.com/59668647/108415985-03c9be00-71e3-11eb-9087-f5f6e31df70a.png)

- Naming convention: chapter_(chapter # here)_(title of your chapter).md

Example: chapter_4_teampsd_monthly_process.md

- Note: If your chapter is very long, break down your markdown file into sections to easily find the section of the chapter you want to edit.

Example: chapter_4.3_teampsd_monthly_process_week_3.md

## 3.	Edit/format your markdown file.

Heading Rules

- Header 1: Title of Chapter
- Header 2: Main Sections of the Chapter
- Header 3 (hidden unless Header 2 is clicked on in the manual): Sub-level for the main section.
- Header 4 (hidden within the content of Header 3): Use to further indicate additional sections/sub-headings within a chapter.

Example:
- Header 1: Team PSD 2.0 Monthly Process
- Header 2: Week 3: Review User Results of MVP
- Header 3: 4.3.1 Create Screencast Video
- Header 4: 4.3.1.1 Instructions

![image](https://user-images.githubusercontent.com/59668647/108416518-aaae5a00-71e3-11eb-8ca0-29b7121bb139.png)
![image](https://user-images.githubusercontent.com/59668647/108416726-f6f99a00-71e3-11eb-8f67-631894b8ab63.png)

## 4.	Check your file against the GH Actions by making a pull request to the QA branch.
- Assign QA Dev reviewers and check for a red X by each GH Action and read the out of where errors occurred.
- Once the reviewers have given feedback, merge the Feature branch into the QA branch.


## 5.	Assign QA Prod from QA branch
- Make the changes/feedback you received from both the GH Actions and reviewers from the Feature branch. 
- Once you are done, you are now in QA Prod.
    - Create a pull request from the QA branch to the Master branch and assign QA Prod reviewers for a final review.
- If there is still feedback to incorporate make the final changes and ensure your QA Prod reviewer checks off the changes before pushing the edits to the Master branch.

## 6.	Publish your Chapter to Master branch.

