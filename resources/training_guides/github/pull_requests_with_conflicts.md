<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  

# Pull Requests with Conflicts

In this example, I manually resolved conflicts in two files *by accepting all the text in order to avoid any possible deletion of work across the team*.

**THE TWO FILES:**
**1. mtl_facilitate_workgroup/mtl_facilitate_pilot/day2/session3_mutual learning_activity.rmd**
**2. mtl_facilitate_workgroup/mtl_facilitate_pilot/day2/session6_in_session_activity.rmd**

*NOTE: I decided to keep all text to avoid loss of work.*

**1. I could see I was 26 commits ahead, and 42 commits behind master on my lzim branch:**
![screen shot 2018-09-02 at 2 59 46 pm](https://user-images.githubusercontent.com/7454688/44961426-efd05b80-aec5-11e8-8554-45dc39ac6115.png)

2. I selected **compare and pull request**, to start the pull request and noted the changes I made on my branch.
![screen shot 2018-09-02 at 3 07 46 pm](https://user-images.githubusercontent.com/7454688/44961427-efd05b80-aec5-11e8-9420-c4c8942ef49b.png)

3. I received this notification that my branch had conflicts to resolve. I clicked the **blue link** to use the **web editer** to resolve conflicts.
![screen shot 2018-09-02 at 3 07 56 pm](https://user-images.githubusercontent.com/7454688/44961428-f068f200-aec5-11e8-86ac-dab84c6bbfc1.png)

4. The web editor showed me two conflicts in one file, and one conflict in the other **See the files listed on the left, and the red 'conflicts' text on the right. I can toggle to view the text itself**
![screen shot 2018-09-02 at 3 08 06 pm](https://user-images.githubusercontent.com/7454688/44961429-f068f200-aec5-11e8-992a-68ae6213e31a.png)

5. Googling for help on this showed me that **I should manually edit to the text I want between the two files.** When I **delete the lines <<<<<<< master** GitHub knows it has been reviewed. And, then I can **click the button on the upper right 'resolve conflicts'**
![](https://cloud.githubusercontent.com/assets/7321362/21116820/fd64b010-c06b-11e6-9dd3-a827e299c5bf.gif)

6. The differences are accepted by  by deleting the **<<<<<<< master** text. And I see the **green check mark on the left** and and so I select the **green 'commit merge'** button.
![screen shot 2018-09-02 at 3 34 02 pm](https://user-images.githubusercontent.com/7454688/44961431-f068f200-aec5-11e8-8ccf-bf6c00cff82e.png)

7. Find additional help and details on **deleting the conflict markers <<<<<<<, =======, >>>>>>>**  here: https://help.github.com/articles/resolving-a-merge-conflict-on-github/

