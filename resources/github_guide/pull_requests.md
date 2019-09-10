<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  

# GitHub Pull Requests Overview

**TEAM PSD Pull Request Tutorial**
- **Understanding pull requests**, aka: *why it's important to sync your own branch with the master branch before you do any work on your own branch*, aka: *how to move from a self-oriented view (everyone needs to incorporate my work) to a team-oriented view (we all need to incorporate each others work in our own work - **in real time**).*

**In this example, even though I only made the 'lz_mtl_facilitate_pilot' branch yesterday afternoon...**

**...the branch I created named 'lz_mtl_facilitate_pilot' was 139 commits and 74 file changes behind the Team PSD Master branch this morning.**



**Open a New Pull Request *Before Working***

**When I open a pull request** and I see the **master branch** on the **LEFT**, what I am checking is whether I have made any changes on **my own branch** that aren't yet reflected in the **master**.  *In other words, if I don't open the pull request to sync any of my recently completed work with the master, the others on the team won't have my most recent work reflected in their branches*. See image 1 below, which shows the **master** on the **left**    (**master <- lz_mtl_facilitate_pilot**)

**When I open a pull request** and I see the **master branch** on the **RIGHT**, what I am checking is whether other TeamPSD members have made any changes on the **master** that aren't yet reflected in **my own branch.**  *In other words, if I don't open the pull request to sync with the master, I would working on outdated copies of files & file structures on my own branch*. See images 2 and 3 below, which shows the **master** on the **right**    (**lz_mtl_facilitate_pilot <- master**)


1. Image 1 shows **my own branch** has nothing new to offer the **master branch** (i.e., I haven't done any new work on my own branch that isn't already reflected in the TeamPSD master branch). So, I don't have any changes on my branch to pull into the master. 
![mybranch_has_nothing_new_for_master](https://user-images.githubusercontent.com/7454688/44948454-6ee46780-add2-11e8-8bed-fd9b2ffa2410.png)


2. But, if I click the blue link (shown above in image 1) to **try switching the base**, I see that **my own branch** that I created yesterday is way behind the **master** branch. Across the team, **139 commits** have been made to the master branch since I created my working copy of the **master** at **lz_mtl_facilitate_pilot.** So, *before I start working* I want to pull these changes fro the team in to my own branch so I'm working on the most current copy.
![mybranch_139commits_behindmaster](https://user-images.githubusercontent.com/7454688/44948461-a18e6000-add2-11e8-941c-bce962000e6e.png)


3. Or, if I select to view the **file** tab instead of the **commits** tab, I am 74 file changes behind the **master branch** on **my own branch**, which I can review **line by line** (green highlight means added edits, red highlight means removed edits). *That means, I really need to pull these changes from the master branch into my own branch before I start working to incorporate everyone's edits, changes, formatting, and avoid rework across the team!*
![mybranch_74filechanges_behindmaster](https://user-images.githubusercontent.com/7454688/44948524-8839e380-add3-11e8-8710-9ce99306e24d.png)


4. Note that in images 2 and 3 if I click the **green Create Pull Request** button it begins the opportunity to *discuss and compare the changes* across the team.


5. **At the end of my working session on my own branch**, when I create the **pull request** there are likely going be differences in both directions: **my own branch** to **master** (**master <- lz_mtl_facilitate_pilot**) and **master** to **my own branch**  (**lz_mtl_facilitate_pilot <- master**).
Most likely, I have been working, and others on the team have been working. If we were working on the same files, then creating the **pull request** begins the team process of *discussing and comparing the changes** across the team.  **So, be sure to leave some time for the pull request process, in case you need to review and discuss conflicts between your pull requests and others before you wrap-up your work session.**


*Hint 1* - **The surest way to make sure you are current with master** is to start your own fresh branch before you work. If you do so, there should be no edits in either direction in the beginning, but there are still likely to be differences on that new branch from the master when you wrap-up your work. ***So...it's cleaner and way easier to track if you have only one working copy (branch) you are using,** especially if there are outstanding pull requests from one of your branches that is being reviewed by the team.*

*Hint 2* - We want only active branches on the TeamPSD repository. So you should clean up old stale branches that you aren't using.


**Summary: We all need to *begin* and *end* all of our working sessions on our own branches by using pull requests. Pull requests are the way to stay consistently current 💯with everyone's work, as reflected by the master branch.  This helps us review, edit, format and collaborate in real-time with parallel workflows to avoid rework.** 

# mtl.how/teampsd vs. mtl.how Pull Request workflow
- TeamPSD respository is for our **"works in progress"** while the MTL.How repository has the **"best versions"** of our materials. 
- The two repositories cannot automatically "update" each other. Meaning, if anything is changed in one repository, **it has to manually be updated in the other repository.**
- Once a file has been fully updated via pull requests in mtl.how/teampsd, HQ will move the file over to the corresponding place in mtl.how.

**To Copy & Paste code, click on the "Raw" button in the top right.** After, create a regular pull request as outlined above to merge the changes.

![](https://static.packt-cdn.com/products/9781783553716/graphics/B03497_01_09.jpg)

**To access previous versions of a file:**
1. **Click on the "History" button at the top right.** This will show you a list of commits made to the file in that repository and you can trace it back to the version of your choice.

![](https://static.packt-cdn.com/products/9781783553716/graphics/B03497_01_09.jpg)

2. **Or, you can delete your branch and start a new branch from the most recent version on the master branch.**
- Click on "Branches" from the main repository page
![](https://help.github.com/assets/images/help/branches/branches-link.png)

- Look for the branch you want to delete and click on the trashcan icon next to it to delete.

![](https://www.wikihow.com/images/e/e8/Delete-a-GitHub-Branch-Step-4.jpg)





