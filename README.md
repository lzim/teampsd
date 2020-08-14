<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/team_psd_logo_sm.png"
     height = "200" width = "600">  

## lzim/teampsd repository
lzim/teampsd is the main TeamPSD repository for general TeamPSD resources and workflow management including:
1. [TeamPSD Bookdown Manual](mtl.how/manual)
2. 4 kanban trackers for overall workflow management
    - [mtl.how/bugs](https://mtl.how/issues)
    - [mtl.how/features](https://mtl.how/features)
    - [mtl.how/manuscripts](https://mtl.how/manuscripts)
    - [mtl.how/documents](https://mtl.how/documents)
    
## TeamPSD repositories
TeamPSD manages 7 repositories across GitHub. Posting our work on GitHub enables transparency, reproducibility and team collaboration.
1. lzim/teampsd at [mtl.how/teampsd](https://mtl.how/teampsd): You are here! Public repository for maintaining resources and project management trackers for all TeamPSD members.

2. lzim/mtl at [mtl.how](https://mtl.how): Public repository containing all work related to the *Modeling to Learn* national quality improvement initiative including model files, learner See guides, facilitator Say guides, and cheatsheets for each of the 12 sessions of the program.

3. teampsd/sim at [insert link](): Public repository for managing simulation models and 

4. lzim/research at [mtl.how/research](https://mtl.how/research): Private repository for TeamPSD research code.

5. lzim/mtl_team_tracker at [mtl.how/team_tracker](https://mtl.how/team_tracker): Private repository for *Modeling to Learn* facilitators to access all resources needed for facilitation in one place as well as track team specific progress and information.

6. ecmo/teampsd/research at [insert link](): Private repository in the VA GitHub Enterprise for the TeamPSD research pipeline.

7. ecmo/teampsd/operations at [insert link](): Private repository in the VA GitHub Enterprise for the TeamPSD operations pipeline.
    

## Branches
TeamPSD uses branches to collaborate on work without impacting our production environment otherwise known as the master branch.

For details on what branches are and how they are used please read the GitHub documentation here: [About Branches](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-branches).


### master:
The master branch contains the production ready content on the repository and is always stable and ready for use.

Contributions are added to the master branch after moving through the [feature](#feature) and [qa](#qa) branches; following the TeamPSD development cycle outlined [here](link-to-teampsd-manual-dev-test-prod-cycle).


### gh-pages:
The gh-pages branch contains the markdown files that are being compiled in the TeamPSD Manual available at [mtl.how/manual](mtl.how/manual). Treated as a production branch like master moving through the same [feature](#feature) and [qa](#qa) development cycle.

These files are treated as chapters in the manual and are kept separate from the other files in the Team PSD repository.


### feature:
The feature branches are used for developing new content or making changes to existing materials.

Instead of committing directly to the master branch, team members create a new branch every time they start work on a new feature. Feature branches should have names that describe the contribution being made.

Feature branches enable team contributions to the project without disruption to the master branch.

For details on creating a feature branch and moving through the development cycle are outlined [here](link-to-teampsd-manual-dev-test-prod-cycle).

### qa:
Before a feature can be merged into master it must go through review in the qa branch. This branch is used for testing contributions to make sure they integrate and meet the Team PSD standards.

The details and requirements for moving into and through the qa branch are outlined [here](link-to-teampsd-manual-dev-test-prod-cycle).


