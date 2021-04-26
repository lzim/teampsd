# gh-pages branch

This branch contains documents and resources for the Team PSD Manual.  
The rendered manual can be found [here](https://lzim.github.io/teampsd) or at https://mtl.how/teampsd_manual.

# How to Contribute to the TeamPSD Manual:

## 1.	Create a Feature branch from the GH-Pages Branch.
- Start by creating a feature branch with the beginning of the branch named "feature-gh-pages".
   - Example:  feature-gh-pages_chapter_11
![image](https://user-images.githubusercontent.com/59668647/109549842-59278a00-7a83-11eb-98ea-7618f2cf1f58.png)

## 2.	Create a new markdown file into the branch.
 
![image](https://user-images.githubusercontent.com/59668647/108415985-03c9be00-71e3-11eb-9087-f5f6e31df70a.png)

- Naming convention: chapter_(chapter # here)_(title of your chapter).md
    - Example: chapter_4_teampsd_monthly_process.md

- Note: If your chapter is very long, break down your markdown file into sectioned markdown files to easily find the section of the chapter you want to edit.
    - Example: chapter_4.3_teampsd_monthly_process_week_3.md

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

## 4. Add markdown file name in the "_bookdown.yml" file.

- The "bookdown.yml" prints out the manual in the order of the the markdown files listed in line 6 ```rmd_files:```.

- Add your markdown file name in the order of which the file should appear in the manual in line 6 within the brackets.
    - Make sure to include quotations around the file name and a comma, if needed.
 
![image](https://user-images.githubusercontent.com/59668647/109550554-4e212980-7a84-11eb-8923-ce123e12bab8.png)

This is a great way to check the formatting and output of your markdown file in the actual Manual before you hand off the review for QA Test.

## 5.	Check your file against the GH Actions by making a pull request to the GH-Pages master branch.
- Assign QA Test reviewers and check for a red X by each GH Action and read the output of where errors occurred.
   - Click on "Details" in the ActionChecker Action to be navigated to the Spell, Link, and Linter checkers.
![image](https://user-images.githubusercontent.com/59668647/109557953-a3156d80-7a8d-11eb-992a-fb4fdc489334.png)

![image](https://user-images.githubusercontent.com/59668647/109558194-f25b9e00-7a8d-11eb-80e4-91d4766314be.png)

- Once edits based on failed checks and feedback from reviewers have been implemented, merge the Feature branch into the GH-Pages branch.

## 6.	Publish your Chapter to master GH-pages branch.
Merge the Feature branch into GH-pages's master branch and double check that your chapter was published at https://mtl.how/teampsd_manual
