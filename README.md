<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/team_psd_logo_sm.png"
     height = "200" width = "600">  

# lzim/teampsd repository
lzim/teampsd is the main TeamPSD repository for general TeamPSD resources and workflow management. Other TeamPSD repositories are listed at the bottom of the page.

TeamPSD uses branches to collaborate on work without impacting our production environment, otherwise known as the master branch. For details on what branches are and how they are used, please read the GitHub documentation here: [About Branches](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-branches).

Following are the types of branches used in the lzim/teampsd repository:

**1. master branch**: The master branch (you are here) contains production-ready content and is always stable and ready for use. Revisions and new contributions are added to the master branch only after moving through the [feature](#feature) and [qa](#qa) branches according to the TeamPSD development cycle outlined [here](link-to-teampsd-manual-dev-test-prod-cycle). Files & folders in the master branch include the following:
  - [.github](https://github.com/lzim/teampsd/tree/master/.github): Contains templates for creating a new card in one of the 4 kanban trackers, and yaml files for deploying GitHub actions.
  - [ees_workgroup](https://github.com/lzim/teampsd/tree/master/ees_workgroup): Contains brochures and post-tests for EES accrediation. Everything in this folder will either be archived or moved to the *MTL* manual on the lzim/mtl repository.
  - [mtl_facilitate_workgroup](https://github.com/lzim/teampsd/tree/master/mtl_facilitate_workgroup): Contains guides and checklists related to *MTL* facilitation. Everything in this folder will either be archived or moved to the *MTL* manual on the lzim/mtl repository.
  - [qual_workgroup](https://github.com/lzim/teampsd/tree/master/qual_workgroup): Contains information on how to use R and RQDA for qualitative coding and RQDA projects. Everything in this folder with either be archived or moved to the TeamPSD manual.
  - [resources](https://github.com/lzim/teampsd/tree/master/resources): Contains how-to guides, cheatsheets, icons, etc. Everything in this folder will be integrated into either the *MTL* manual or TeamPSD manual.
  - [vignettes](https://github.com/lzim/teampsd/tree/master/vignettes): Contains any documentation and guides related to or using software packages.
        
**2. gh-pages branch**: The gh-pages branch contains the markdown files that are being compiled in the TeamPSD Manual available at [mtl.how/teampsd_manual](https://mtl.how/teampsd_manual). It is treated as a production branch (like master), moving through the same feature and qa development cycle.
  - All files in this branch are in markdown format and are treated as chapters in the manual.
  - These files are separate from the other files in the TeamPSD repository.

**3. feature branch**: The feature branches are used for developing new content or making changes to existing materials. Feature branches enable team contributions to the project without disruption to the master branch.
  - Instead of committing directly to the master branch, team members create a new branch every time they start work on a new feature. 
  - Feature branches should have names that describe the contribution being made.
  - Details on creating a feature branch and moving through the development cycle are outlined [here](link-to-teampsd-manual-dev-test-prod-cycle).

**4. qa branch**: Before a feature can be merged into master, it must go through review in the qa, or quality assurance, branch. This branch is used for testing contributions to make sure they integrate properly and meet the Team PSD standards.
  - Details and requirements for moving into and through the qa branch are outlined [here](link-to-teampsd-manual-dev-test-prod-cycle).

    
# TeamPSD repositories

| **Name** | **Link** | **Brief Description**
| --- | --- | --- |
| lzim/teampsd | [mtl.how/teampsd](https://mtl.how/teampsd) | You are here! Public repository for maintaining resources and project management trackers for all TeamPSD members. |
| lzim/mtl | [mtl.how](https://mtl.how) | Public repository containing all work related to the *Modeling to Learn* national quality improvement initiative, including model files, learner See guides, facilitator Say guides, and cheatsheets for each of the sessions of the *MTL Blue* and *MTL Red* programs. |
| teampsd/sim | [insert link]() | Public repository for managing simulation models and Epicenter simulation user interface code. |
| lzim/research | [mtl.how/research](https://mtl.how/research) | Private repository for TeamPSD research code. |
| lzim/mtl_team_tracker | [mtl.how/team_tracker](https://mtl.how/team_tracker) | Private repository for *Modeling to Learn* facilitators to access all resources needed for facilitation in one place and to track team-specific progress and information. |
| epmo/mtl_research | [https://github.ec.va.gov/EPMO/mtl_research](https://github.ec.va.gov/EPMO/mtl_research) | Private repository in the VA GitHub Enterprise account for the TeamPSD research pipeline. |
| epmo/mtl_operations | [https://github.ec.va.gov/EPMO/mtl_operations](https://github.ec.va.gov/EPMO/mtl_operations) | Private repository in the VA GitHub Enterprise account for the TeamPSD operations pipeline. |
    
