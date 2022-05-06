# Track Issues & Features

## Create Issue/Feature cards [click maps in progress]

Click map would explain process [here](https://github.com/lzim/teampsd/issues/new/choose)

## Maintaining Cards [flow map in progress]

Flow map to maintain your issue/features cards as they get worked on.

We will wait for these flow maps until Branching MVP is tested:
[Track a bug] might change
[Track a feature] might change.

Previous Issue Card Flow Map:
![Issue Card Flow Map](https://user-images.githubusercontent.com/59668647/88049640-5ab2cc00-cb0a-11ea-89a0-a09d13d4761d.png)

## Use Markdown

### Write Markdown

Cheatsheet will go here

### Use Markdown Files

#### Add a Markdown File

#### Go to a Markdown File

#### Edit a Markdown File

## Use GitHub Branches

![Use GitHub Branches Workflow](https://user-images.githubusercontent.com/30132017/96189366-30985c80-0ef5-11eb-9053-22a43cae8103.png)

![ ](https://app.lucidchart.com/invitations/accept/1b9df299-b33f-4509-be32-9603ec343a3c)

GitHub branches are used to provide continuous integration of multiple versions of a repository.  Branches also control versions of a file and trigger automatic review and quality control actions to ensure files meet team standards.  See [Working with Branches](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-branches#working-with-branches) for more information.

## Submit a Feature

- No direct-to-master branch commits are allowed.
- A feature branch will merge with the Quality Assurance (QA) branch before being pushed to Master.
- The QA branch is a protected branch that requires mandatory reviews before changes can be merged with Master.
- In extremis and with approval, a feature branch may be directly pushed to the Master branch in circumstances where the QA branch is tied up with another feature branch.

### Create a Feature Branch

![fig1_create_branch](https://user-images.githubusercontent.com/30132017/96189916-38a4cc00-0ef6-11eb-8c0a-a185af535367.png)

1. With the “<> Code” tab selected, click the button named “master” in the upper left of the directory.
2. A dropdown will appear with a listing of all branches currently active in the repository.  A check indicates the branch that is active.
3. In the “Find or create a branch . . . “ field, enter the name of your branch using this format:  “feature-my_new_branch”  The word “feature” will trigger automatic workflows when you commit the branch. Use lowercase letters and an underscore “_” between words. After the word “feature” provide up to a 4-word short description of what the feature addresses.
4. When the “Commit” button is clicked, the word “feature” will trigger automatic quality control actions.  The results of these actions can be reviewed in the actions tab of GitHub.

### Edit a Feature Branch

1. To edit a feature branch, navigate to the “<> Code” tab and click the button named “master” in the upper left of the directory.
2. A dropdown will appear with a listing of all branches in the repository.
3. Click on the desired feature branch in the list.
4. Navigate to the target file from the directory.
5. Edit the target file within this branch.
6. When edit is complete, commit the file back to this feature branch.
7. The commit will trigger quality control actions that can be reviewed in the actions tab.

### Push a Feature Branch

![fig2_new_pull_req](https://user-images.githubusercontent.com/30132017/96190320-e2845880-0ef6-11eb-9b8c-ce576d517e62.png)

1. To push an updated file or files from a feature branch to the QA branch, the user must open a Pull Request.  Note: Opening a pull request can be done when a file is committed to a branch using the commit dialogue, or the user can navigate to the “Pull requests” tab.
2. Navigate to the “Pull requests” tab.
3. Click the green “New pull request” button on the right-hand side of the page.
4. Review the “Comparing changes” dialogue very carefully (see image below).
5. Ensure the base branch indicates “QA.”  If it does not, click on the button and select correct branch.
6. Ensure the pushed branch is the desired feature branch.

![fig3_compare_changes](https://user-images.githubusercontent.com/30132017/96190324-e4e6b280-0ef6-11eb-80c1-111fd7b5f226.png)

## Run Quality Assurance

![fig4_rerun_quality assurance](https://user-images.githubusercontent.com/30132017/96191290-9f2ae980-0ef8-11eb-89e7-02866b24d303.png)

1. The QA branch is a protected branch, which means it cannot complete the merge unless all conflicts and errors are cleared and the assigned reviewers have signed off on the changes.
2. When a feature branch is pushed to the QA branch, quality assurance actions will automatically run and list out any findings under the Actions tab.
3. The user checks for errors in this tab, and corrects any findings.
4. The user can re-run the quality checks from the actions tab by clicking the "Rerun jobs" button on right hand side of screen (see figure above).

## Use a "Find and Replace" Branch

GitHub FNR feature branch is a specialty branch that is used to find desired words or short strings and replace them automatically throughout documents in the repository.  The FNR action can be limited to a file, a director or the whole repository by modifying instructions in the FindReplace.yml file found in the .github/workflows directory.

### Configure the FindReplace.yml Action File

Below is an explanation on how to configure the find and replace function.

![Configure the FindReplace.yml Action File](https://user-images.githubusercontent.com/30132017/97484653-40149e00-1916-11eb-879f-2d9154c46cc8.png)

1. Select the FindReplace.yml file and place in "edit" mode.
2. Update line 53 with the desired word, acronym or string within in the quotation marks.
**PRO TIP:** Do not leave extra spaces before or after words, unless you want the search to include the space immediately before or after a search string. For example, the search term "Session 1" will find "Session 1", "Session 10" and all instances where the number "1" is found, even if it is in the number "10."  To limit the search, place a space immediately after the "1" like this "Session 1 " and that will limit the search to "1" only.
3. Update line 54 with the replacement term in quotation marks.
4. To limit a search to an updated file or directory, remove the appropriate hash mark (#) from the line of code that provides the needed search constraint.
5. Navigate to the upper left of the window and select the green "Start commit" button. Select the "Commit directly to Master branch" radio button and click the green "Commit changes" button.

### Create a "Find and Replace" (FNR) Branch

1. Navigate to the code tab.
2. Click on the branch button and expose the branch dropdown menu.
3. In the "Find or create branch" field, enter the name of your find and replace branch using this convention:  fnr-findterm_replaceterm.  For example, if "session 1" was the find term, and "Session X " was the replace term, it should read "fnr-session_1_session_x."
4. Press enter and navigate to the "Actions" tab.  Here the action will report how many terms were found and replaced (see images below). For a line-by-line review of changes, open a pull request.

**Open action tab and review action status**
![Open action tab and review action status image](https://user-images.githubusercontent.com/30132017/97486613-ea8dc080-1918-11eb-9df4-33f726d358ae.png)

**Open pull request comparing FNR branch to master**
![open pull request comparing FNR branch to master image](https://user-images.githubusercontent.com/30132017/97486927-61c35480-1919-11eb-9bae-915b5d086e55.png)

**Compare changes**
![compare changes image](https://user-images.githubusercontent.com/30132017/97487072-99ca9780-1919-11eb-8ef6-41ecd1eda678.png)

## Update a Bookdown File Using the "gh-pages" Branch

To support the publication of a bookdown manual, a special branch is required named "gh-pages" branch.  This branch contains the markdown files that are editable and are automatically compiled by an bookdown publication action, when a feature branch is merged with the gh-pages branch. Follow the steps below to edit a bookdown manual.

1. Navigate to the "gh-pages" branch.
2. In the "Find or create a branch" field, enter a feature branch using the following convention: feature-gh-pages_chapter_action. For example, an update to chapter 9 might look like this, "feature-gh-pages-ch9_update" This will clue reviewers that the action will merge with gh-pages after review.
3. Navigate to the "feature-gh-pages_*"
4. Edit the desired file.
5. Commit the file to the same branch.
6. Open a pull request to merge with the gh-pages branch.  This will trigger the spell checker, link checker and markdown style checkers and signal reviewers that a check is needed.
7. Navigate to the Actions tab to resolve any issues found by the linters.
8. After review, the reviewer will merge the branches.  This will trigger the bookdown publishing action to publish the updated manual.

## Update a Model File Using the Dev, Test and Master Branches

_Please note:  Vensim cannot run in actions associated with web-based GitHub. All edits and file conversions must be run on a client machine with associated license. Batch files can be run to save time, but these outputs must be produced on a licensed client and pushed to origin via a client git such as GitHub desktop._

If a user desires to update a model, they must push the update in three versions, .mdl (Vensim readable format), .vmfx (Vensim binary) and .xmile (SD standard) to the DEV branch (see figure below). The push will trigger an action that will deploy the model files to their respective locations. As the model moves through development and test, the associated model files will deploy incrementally to associated Epicenter projects (i.e., Dev branch merges with the Test branch, files deploy to Epicenter test project; when the Test branch merges with Master branch, files deploy to Epicenter PROD projects). Upon merge with the Test or Master branch, the action will create a standardized .html System Dynamics Document file and deploy the file to the lzim/mtl/blue/mtl2.0_models folder.

![model update branch process image](https://user-images.githubusercontent.com/30132017/102918811-7f55fb80-443c-11eb-8ff6-82a90c90f887.png)

1. Navigate to the lzim/mtl Dev branch.  Ensure the branch is up-to-date with the Master branch.  If not, merge Master to Dev to bring it up to date.
2. From the Dev branch, update the desired .mdl model file. This can be done on a client by modifying the cloned file on a client using a licensed copy of Vensim (recommend Vensim version 8.4).
3. When development is complete, save .mdl, .vmfx and .xmile versions of the file.
4. Push modified files to origin and note changes in comments field.
5. When development activities are concluded, open a pull request to merge Dev with Test. Fix any errors and merge the two branches.
6. Upon merge to Test, the files will be deployed to the Forio Epicenter VA Sim UI Test Slow project.
7. Conduct user-acceptance testing.
8. When user acceptance testing is completed, open a pull request to merge Test with Master branch.
9. When reviewer have signed off, merge the Test branch to Master branch.
10. When Test is merged with Master, the action will deploy .vmfx file to Forio Epicenter VA Sim UI PROD project. The action will also execute the SD-DOC program and create an SD-DOC .html file and deploy to the lzim/mtl/blue/mtl2.0_model folder.

## Contribute to an R Notebook

Figure 1: Workflow for Quant group rnotebook contribution 

![quant_wg_qa_workflow.png](https://user-images.githubusercontent.com/60201706/111335906-fe209600-8631-11eb-820e-bf9f400f75f0.png)


**Step 1:** Under `Current Repository` select research.  click current branch then select `New Branch`


![github_desktop_select_repo.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/github_desktop_select_repo.gif?raw=true)


**Step 2:** Title your branch appropriately. Precede your branch name with grant name (e.g r21_load_r_libraries) and select `Master` as the base branch.

![quant_workflow_title_branch.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/quant_workflow_title_branch.gif?raw=true)


**Step 3:** On the menu bar, click on the `Repository` and select `Show in Finder` (Mac) or `Show in Folder` (PC) click on the project folder and then R project file.

![github_desktop_show_in_folder.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/github_desktop_show_in_folder.gif?raw=true)


**Step 4:** To edit/add an existing code chunk, navigate to the chunk and make appropriated edits (*Remember to include documentation*).

![github_edit_code_chunk.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/github_edit_code_chunk.gif?raw=true)


**Step 5:** Save your work and go back to Github Desktop. Click `fetch origin` and commit your changes. Remember to add a title and description of your commit. A good commit title would include name of code chunk edited/added, section title of the notebook or task name (e.g edit titles, added references,... ).


![github_desktop_commit_changes.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/github_desktop_commit_changes.gif?raw=true)




**Step 6:** Click `Push to Origin` then `Create Pull Request`. This will send you back to Github.

![github_desktop_create_pull_request.gif](https://github.com/lzim/teampsd/blob/master/resources/manual_gifs/github_desktop_create_pull_request.gif?raw=true)


**Step 7:** Follow the steps outlined in [Submit a Feature](#submit-a-feature) to submit your changes for review

## Reviewing pull requests

While reviewing the files in a pull request, you can leave individual comments on specific changes. After you finish reviewing each file, you can mark the file as viewed. This collapses the file, helping you identify the files you still need to review. A progress bar in the pull request header shows the number of files you've viewed. After reviewing the files you want, you will approve the pull request or request additional changes by submitting your review with a summary comment.


### Starting a review

5. Click **Start a review**. If you have already started a review, you can simply click **Add review comment**.
  ![Start a review button](https://github.com/github/docs/blob/main/assets/images/help/pull_requests/start-a-review-button.png?raw=true)
  
  

Before you submit your review, your line comments are _pending_ and only visible to you. You can edit pending comments anytime before you submit your review. To cancel a pending review, including all of its pending comments, scroll down to the end of the timeline on the Conversation tab, then click **Cancel review**.

![Cancel review button](https://github.com/github/docs/blob/main/assets/images/help/pull_requests/cancel-review-button.png?raw=true)


### Marking a file as viewed

After you finish reviewing a file, you can mark the file as viewed, and the file will collapse. If the file changes after you view the file, it will be unmarked as viewed.

2. On the right of the header of the file you've finished reviewing, select **Viewed**.
  ![Viewed checkbox](https://github.com/github/docs/blob/main/assets/images/help/pull_requests/viewed-checkbox.png?raw=true)

### Submitting your review

After you've finished reviewing all the files you want in the pull request, submit your review.

4. Select the type of review you'd like to leave:
  ![Radio buttons with review options](https://github.com/github/docs/blob/main/assets/images/help/pull_requests/pull-request-review-statuses.png?raw=true)
    - Select **Comment** to leave general feedback without explicitly approving the changes or requesting additional changes.
    - Select **Approve** to submit your feedback and approve merging the changes proposed in the pull request.
    - Select **Request changes** to submit feedback that must be addressed before the pull request can be merged.

