---
title: "LucidChart GitHub Integration MVP"
author: "Rita Hitching"
date: "RH May 18 2020"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default   
---


<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  


# LucidChart and GitHub MVP for Continuous Integration


**Objective of MVP of LucidChart and GitHub** 
Test ability to build on existing LucidChart knowledge by adding integration to GitHub forked TeamPSD repo. Think of the average use - don't use pro account. Test if I can teach my self - link GitHub forked repo and LucidChart. Prototype of prototype **LucidChart & GitHub** continuous integration to improve the Team PSD 2.0 workflow. Final prototypes can be **added by pull-requests to other users repos**.   

## Problem & Hypothesis for Solution

### Team PSD pain points include:
- Being able to orient themselves to the workflow of TeamPSD and the need for documentation to support this.
- Need for companion visual guides / maps to orient TeamPSD users to the workflow. 
- Current approach is labor and cost intensive - process involves manual updates to LucidChart documents every time changes are made to the TeamPSD documentation.

### Possible Solution 
- Team currently uses LucidChart as the platform of chooice to design visual representations of our workflow and platforms.
- Several users manually create maps that are used to enhance documentation within TeamPSD.
- The process is currently cumbersome and inconsistent. We have developed basic templates with suggeted guidance of colors and shapes - but the process remains inconsistent and out of date.
- We need to update in real time changes to documentation and TeamPSD guides that rely on the use of LucidChart maps to orient users (e.g. ZenHub).
- We currently use GitHUb for all documentation and are using existing resources to compile a TeamPSD manual.
- A possible MVP prototype that integraties our two platforms GitHub and LucidChart for updating documentation guides and training manuals would relieves the team's pain point of real time updates. 

### Research Solution in GitHub Market Place
- Research on GitHub and LucidChart plaftorms suggested that documentation integration indicates that LucidCharts maps can be updated in real time in GitHub by multiple users concurrently.

### User-Centered Hypotheses
Guiding MVP learning/development an _iterative design process across the team_ to avoid rework with a focus of the [_Pareto Principle_](https://betterexplained.com/articles/understanding-the-pareto-principle-the-8020-rule/) **80/20 rule** in parallel with everyone else’s **distributed** prototyping work.


<img src = "https://github.com/ritahitching/teampsd_hitching_sandbox/blob/master/resources/design/lucidchart/lucidchart_github_ci_process.png" height = "600" width = "600">
     

### Resources & Assumptions: 

#### Resources
### 1. MS Teams > Design > Persona 
### 2. Prototyping Wiki - instructions &  develop/refine hypotheses
### 3. [Map](https://app.lucidchart.com/documents/view/66445ce8-04fd-44e7-920c-d429aa25d441)
#### Assumptions & Pain Points
Clarify all - to make sure users can create, edit/update a LucidCharts flow-maps at scale and asynchronously.
**Documentation**
- Have a need for up to the minute documentation - latest version - that supports TeamPSD members
- Want a way to update documentation that is in real time without manual changes to each document that has a link to a map
- Want TeamPSD members to be able to make contributions themselves to a map and have those changes be reflected in relevant documentation
**Scale**
- Need to scale the use of maps to contribute to documentation and to orient users by having all users know how to make a map and bring it to GitHub. 
_ Currently users don't know how to make maps and how to bring them into GitHub
_ Users that know how to make maps - are not using a consistent approach and it leads to frustration and re-work. Issues include:
(i)    Need consistent look and feel maps on GitHub (colors, fonts, choice of process, etc.).
(ii)  Currently multiple templates on LucidChart - unsure which to use.
(iii) Maps have (a) inconsistent naming conventions and organization (this will be more and more problematic with links)
(iv)  Connector symbol are incorrect in many maps - need to standardize the process - leading to mistakes
(v)   Maps are not brand consisten or use logo appropriately.
(Vi)  Naming of process is inconsistent - no convention and/or organization (will worsen when links need to use)
**Considerations & Persona Privacy**
The MVP hypothesis testing process relies on the personas - but we have a **substantial problem** of needing to keep the persona details **private** to accomodate for **candor** but having some **perona maps** on LucidChart.
**Current Personas**
- [ ] busy_forward_thinking
- [ ] fast_learner_need_for_transparency
- [ ] independent_guidance_when_needed
- [ ] integration_language_expert
- [ ] detailed_documentation_needed_recent_github_devotee
- [ ] efficient_value_added_highly_standardized
- [ ] multistretch_standardize


**Mental Models**
Using the existing **user persona library**
- Prototype with current personas in mind
- Expand the current personas to include **Jane and Debbie** next.
**Account for Learning**
- Prototyping must account for user learning - how to become comfortable with LucidChart to a level that enables creation of maps and adding them to GitHub
- Include **commensurate video think aloud protocol** to refine instructions for different user personas.
- Aim that everyone can make an effective, continuous integrated GitHub/Lucid Chart contributions themselves by end of May.


## Cognitive Interview & Screen Casting
**CTA Think ALoud**
Test ability to build on existing LucidChart knowledge by adding integration to GitHub forked TeamPSD repo. Think of the average use - don't use pro account. Test if I can teach my self - link GitHub forked repo and LucidChart. Prototype of prototype LucidChart & GitHub continuous integration to improve the Team PSD 2.0 workflow. Final prototypes can be added by pull-requests to other users repos.

**Problem & Hypothesis for Solution**: Team PSD pain points include: Being able to orient themselves to the workflow of TeamPSD and the need for documentation to support this. Need for companion visual guides / maps to orient TeamPSD users to the workflow. Current approach is labor and cost intensive - process involves manual updates to LucidChart documents every time changes are made to the TeamPSD documentation.

**Hypothesis**: Team & I need to scale up the use of flow maps to improve user documentation. CTA Prototype Video on Youtube
CTA Prototype for Persona on MS Teams.  CTA Prototype for Persona - Need Detailed Documentation:

**Week 2 & Day 1**:
Trying to implement the LucidChart & GitHub integration myself.
Unsure how the process is going to work - seems simple - but not sure
Need to have links that update in real time - maps that open - not hyper links
Suggestions from Marketplace of a connector to solve the pain point.

**Week 2 & Day 2**:
Found a connector and implemented it - no working solution that meets my needs
Unsure if connecting on LucidChart also connects on GitHub
Not all able to see all the repos
Not able to create issues in own repo
Links to LucidChart remain - no map presenting itself.

**Week 2 & Day 3**:
Problems persist - no solution that seems to be effective.
Discussed with others and watched videos and read documentation
Created a new repo and was able to generate issues - able to paste a link but maps not opening
Played around with repo and making it private enabled the links to be displayed.
Error occurred when repo was made public
Not sure how current prototype is going to work for members that are using public repos

**Week 2 & Day 4**:
Contacted LucidChart for support and send several emails and screen shots of errors.
They provided some guidance but were unsure of the true functionality of the connector they have on marketplace.
Changes made to a map are not reflected within the published link - problem remains unsolved in part.

**Recording prototype video**:
By recording realized that the links take a long time to open and that changes are not reflected rapidly enough.
Need to consider these hurdles in light of the personas on the team (e.g. busy_pi)

**Week 3 & Day 5**:
Peristent issues with maps updating in real time and reflecting changes made on LucidChart in GitHub. Contacted GitHub support again. 
Recorded several videos on how to use LucidChart to make:
### 1. a flow map using an existing template
### 2. creat ia new document without a template
### 3. using a document to generate a template
