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

![image](https://user-images.githubusercontent.com/30132017/96189366-30985c80-0ef5-11eb-9053-22a43cae8103.png)

GitHub branches are used to provide continuous integration of multiple versions of a repository.  Branches also control versions of a file and trigger automatic review and quality control actions to ensure files meet team standards.  See [Working with Branches](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-branches#working-with-branches) for more information.

### Submit a Feature
   - No direct-to-master branch commits are allowed.
   - A feature branch will merge with the Quality Assurance (QA) branch before being pushed to Master.
   - The QA branch is a protected branch that requires mandatory reviews before changes can be merged with Master. 
   - In extremis and with approval, a feature branch may be directly pushed to the Master branch in circumstances where the QA branch is tied up with another feature branch. 
   
#### Create a Feature Branch

![fig1_create_branch](https://user-images.githubusercontent.com/30132017/96189916-38a4cc00-0ef6-11eb-8c0a-a185af535367.png)
fig1_create_branch

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
fig2_new_pull_request
1. To push an updated file or files from a feature branch to the QA branch, the user must open a Pull Request.  Note:  Opening a pull request can be done when a file is committed to a branch using the commit dialogue, or the user can navigate to the “Pull requests” tab.
2. Navigate to the “Pull requests” tab. 
3. Click the green “New pull request” button on the right-hand side of the page.

![fig3_compare_changes](https://user-images.githubusercontent.com/30132017/96190324-e4e6b280-0ef6-11eb-80c1-111fd7b5f226.png)
fig3_compare_changes
4. Review the “Comparing changes” dialogue very carefully.
5. Ensure the base branch indicates “QA.”  If it does not, click on the button and select correct branch.
6. Ensure the pushed branch is the desired feature branch.  

### Run Quality Assurance

![fig4_rerun_qa](https://user-images.githubusercontent.com/30132017/96191290-9f2ae980-0ef8-11eb-89e7-02866b24d303.png)
fig4_rerun_qa
1.  The QA branch is a protected branch, which means it cannot complete the merge unless all conflicts and errors are cleared and the assigned reviewers have signed off on the changes. 
2.  When a feature branch is pushed to the QA branch, quality assurance actions will automatically run and list out any findings under the Actions tab. 
3.  The user checks for errors in this tab, and corrects any findings.  
4.  The user can re-run the quality checks from the actions tab by clicking the "Rerun jobs" button on right hand side of screen (see figure 4 above). 

#### Orientation Map 
#### Edit a Quality Assurance Branch
#### Test a Quality Assurance Branch
#### Merge a Quality Assurance Branch
