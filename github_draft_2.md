## Track Issues & Features

### Create Issue/Feature cards [click maps in progress]

Click map would explain process [here](https://github.com/lzim/teampsd/issues/new/choose)

### Maintaining Cards [flow map in progress]

Flow map to maintain your issue/features cards as they get worked on.

We will wait for these flow maps until Branching MVP is tested:
[Track a bug] might change
[Track a feature] might change.

Previous Issue Card Flow Map:
![](https://user-images.githubusercontent.com/59668647/88049640-5ab2cc00-cb0a-11ea-89a0-a09d13d4761d.png)

## Use Markdown
### Write Markdown
Cheatsheet will go here.

### Use Markdown Files
#### Add a Markfown File 
#### Go to a Markdown File
#### Edit a Markdown File

## Use GitHub Branches

![](https://user-images.githubusercontent.com/30132017/96189366-30985c80-0ef5-11eb-9053-22a43cae8103.png)

![](https://app.lucidchart.com/invitations/accept/1b9df299-b33f-4509-be32-9603ec343a3c)

GitHub branches are used to provide continuous integration of multiple versions of a repository.  Branches also control versions of a file and trigger automatic review and quality control actions to ensure files meet team standards.  See [Working with Branches](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-branches#working-with-branches) for more information.

### Submit a Feature
   - No direct-to-master branch commits are allowed.
   - A feature branch will merge with the Quality Assurance (QA) branch before being pushed to Master.
   - The QA branch is a protected branch that requires mandatory reviews before changes can be merged with Master. 
   - In extremis and with approval, a feature branch may be directly pushed to the Master branch in circumstances where the QA branch is tied up with another feature branch. 
   
#### Create a Feature Branch

![fig1_create_branch](https://user-images.githubusercontent.com/30132017/96189916-38a4cc00-0ef6-11eb-8c0a-a185af535367.png)

1. With the “<> Code” tab selected, click the button named “master” in the upper left of the directory.
2. A dropdown will appear with a listing of all branches currently active in the repository.  A check indicates the branch that is active.
3. In the “Find or create a branch . . . “ field, enter the name of your branch using this format:  “feature-my_new_branch”  The word “feature” will trigger automatic workflows when you commit the branch.  Keep a few things in mind:
   - Use lowercase letters and an underscore “_” between words.
   - After the word “feature” provide up to a 4-word short description of what the feature addresses. 
4. When the “Commit” button is clicked, the word “feature” will trigger automatic quality control actions.  The results of these actions can be reviewed in the actions tab of GitHub.

#### Edit a Feature Branch

1. To edit a feature branch, navigate to the “<> Code” tab and click the button named “master” in the upper left of the directory.  
2. A dropdown will appear with a listing of all branches in the repository. 
3. Click on the desired feature branch in the list.
4. Navigate to the target file from the directory.
5. Edit the target file within this branch.
6. When edit is complete, commit the file back to this feature branch.  
7. The commit will trigger quality control actions that can be reviewed in the actions tab.

#### Push a Feature Branch

![fig2_new_pull_req](https://user-images.githubusercontent.com/30132017/96190320-e2845880-0ef6-11eb-9b8c-ce576d517e62.png)

1. To push an updated file or files from a feature branch to the QA branch, the user must open a Pull Request.  Note:  Opening a pull request can be done when a file is committed to a branch using the commit dialogue, or the user can navigate to the “Pull requests” tab.
2. Navigate to the “Pull requests” tab. 
3. Click the green “New pull request” button on the right-hand side of the page.

![fig3_compare_changes](https://user-images.githubusercontent.com/30132017/96190324-e4e6b280-0ef6-11eb-80c1-111fd7b5f226.png)

4. Review the “Comparing changes” dialogue very carefully.
5. Ensure the base branch indicates “QA.”  If it does not, click on the button and select correct branch.
6. Ensure the pushed branch is the desired feature branch.  

### Run Quality Assurance

![fig4_rerun_qa](https://user-images.githubusercontent.com/30132017/96191290-9f2ae980-0ef8-11eb-89e7-02866b24d303.png)

1.  The QA branch is a protected branch, which means it cannot complete the merge unless all conflicts and errors are cleared and the assigned reviewers have signed off on the changes. 
2.  When a feature branch is pushed to the QA branch, quality assurance actions will automatically run and list out any findings under the Actions tab. 
3.  The user checks for errors in this tab, and corrects any findings.  
4.  The user can re-run the quality checks from the actions tab by clicking the "Rerun jobs" button on right hand side of screen (see figure above). 

### Use a "Find and Replace" Branch
GitHub FNR feature branch is a specialty branch that is used to find desired words or short strings and replace them automatically throughout documents in the repository.  The FNR action can be limited to a file, a director or the whole repository by modifying instructions in the FindReplace.yml file found in the .github/workflows directory. 

#### Configure the FindReplace.yml Action File
Below is an explanation on how to configure the find and replace function.

![image](https://user-images.githubusercontent.com/30132017/97484653-40149e00-1916-11eb-879f-2d9154c46cc8.png)

1.  Select the FindReplace.yml file and place in "edit" mode.
2.  Update line 53 with the desired word, acronmn or string within in the quotation marks.  
**PRO TIP:** Do not leave extra spaces before or after words, unless you want the search to include the space immedately before or after a search string. For example, the search term "Session 1" will find "Session 1", "Session 10" and all instances where the number "1" is found, even if it is in the number "10."  To limit the search, place a space immediately after the "1" like this "Session 1 " and that will limit the search to "1" only.   
3.  Update line 54 with the replacement term in quotation marks.
4.  To limit a search to an updated file or directory, remove the appropriate hash mark (#) from the line of code that provides the needed search constraint.
5.  Navigate to the upper left of the window and select the green "Start commit" button. Select the "Commit directly to Master branch" radio button and click the green "Commit changes" button.

#### Create a "Find and Replace" (FNR) Branch
1. Navigate to the code tab.
2. Click on the branch button and expose the branch dropdown menu.
3. In the "Find or create branch" field, enter the name of your find and replace branch using this convention:  fnr-findterm_replaceterm.  For example, if "session 1" was the find term, and "Session X " was the replace term, it should read "fnr-session_1_session_x."
4. Press enter and navigate to the "Actions" tab.  Here the action will report how many terms were found and replaced (see images below). For a line-by-line review of changes, open a pull request.

**Open action tab and review action status**
![image](https://user-images.githubusercontent.com/30132017/97486613-ea8dc080-1918-11eb-9df4-33f726d358ae.png)

**Open pull request comparing FNR branch to master**
![image](https://user-images.githubusercontent.com/30132017/97486927-61c35480-1919-11eb-9bae-915b5d086e55.png)

**Compare changes**
![image](https://user-images.githubusercontent.com/30132017/97487072-99ca9780-1919-11eb-8ef6-41ecd1eda678.png)

#### Update a Bookdown File Using the "gh-pages" Branch.
To support the publication of a bookdown manual, a special branch is required named "gh-pages" branch.  This branch contains the markdown files that are editable and are automatically compiled by an bookdown publication action, when a feature branch is merged with the gh-pages branch. Follow the steps below to edit a bookdown manual.

1.  Navigate to the "gh-pages" branch.
2.  In the "Find or create a branch" field, enter a feature branch using the following convention: feature-gh-pages_chapter_action. For example, an update to chapter 9 might look like this, "feature-gh-pages-ch9_update" This will clue reviewers that the action will merge with gh-pages after review.
3.  Navigate to the "feature-gh-pages_*" 
4.  Edit the desired file.
5.  Commit the file to the same branch.
6.  Open a pull request to merge with the gh-pages branch.  This will trigger the spell checker, link checker and markdown style checkers and signal reviewers that a check is needed.
7.  Navigate to the Actions tab to resolve any issues found by the linters.
8.  After review, the reviewer will merge the branches.  This will trigger the bookdown publishing action to publish the updated manual to gh-pages.






















