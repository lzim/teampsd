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
Test ability to build on existing LucidChart knowledge by adding integration to GitHub forked TeamPSD repo. Think of the average use - don't use pro account. Test if I can teach my self - link GitHub forked repo and LucidChart. Prototype of LucidChart & GitHUb for Team PSD continuous integration to improve the Team PSD 2.0 workflow.

# Problem & Hypothesis for Solution

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
     

- **Resources & Assumptions**:  
- **Resources**
### 1. MS Teams > Design > Persona 
### 2. Prototyping Wiki - instructions &  develop/refine hypotheses
### 3. [Map](https://app.lucidchart.com/documents/view/66445ce8-04fd-44e7-920c-d429aa25d441)

- **Assumptions**:
Clarify all - to make sure users can create, edit/update a LucidCharts flow-maps at scale and asynchronously.

### 1. User pain points
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

**Persona Privacy**
The MVP hypothesis testing process relies on the personas - but we have a **substantial problem** of needing to keep the persona details **private** to accomodate for **candor** but having some **perona maps** on LucidChart.


### 2. Mental models

3. Use your **GitHub** branches to **_prototype_** with other users. 
	- **Prototypes are handled with pull-requests to other users repos.** 
	- _Which users are testing asynchronously and in parallel, whether they can use your instructions to establish bidirectional GitHub <> Lucid Charts?_
	- **Jane and Debbie** need to be oriented next week on this, _have you prototyped enough with the existing **user persona library** to be ready to expand to these users?_

4. Since we want to make sure that all users can update their Lucid Charts in a style consistent way **your prototyping must account for user learning:**
	- Review your **concurrent video think aloud protocol observation** to refine user instructions for doing so are clear
	- Ideally since we’re at the end of week 2, you aim to be clear about the **80/20 approach that the team will learn over the new couple weeks, so that everyone can make an effective, continuous integrated GitHub/Lucid Chart contributions themselves.**

### Process 
- The process of linking LucidChart maps and GitHub needs to be made within issues or pull requests - using published links provided by LucidChart 
- Guidance on LucidChart (https://www.lucidchart.com/blog/lucidchart-for-github) and GitHub recommended  the [LucidChart Connector information](https://github.com/marketplace/lucidchart-connector)  
## Process for Proposed LucidChart & GitHub Integration and MVP 
- [ ] Fork TeamPSD Repo
- [ ]  Go to GitHub market place and use GitHub app for integration labelled [LucidChart Connector](https://www.lucidchart.com/pages/integrations/github) and follow prompts to install & configure 
- [ ] Within your forked repo create an issue to follow the process of linking LucidChart maps and GitHub within issues or pull requests - using the published links provided by LucidChart 
- [ ] Configuration for this forked repo did work

## Within TeamPSD 
- [ ] Attempted the process of adding the published links provided by LucidChart to an issue on TeamPSD Repo
- [ ] Realize that the configuration did work for this Repo

## Overall Solution for TeamPSD
- [ ] Individual team members need to configure their branched repo to be able to insert published LucidChart links in their GitHub Issues and pull requests.

## Entire Team Solution 
### Step 1 - Log in to GitHub
### Step 2 Got to Market Place & Search for LucidChart
![image](https://user-images.githubusercontent.com/54862187/81884965-2f31c500-954e-11ea-913d-9c91c33c5155.png)
### Step 3 Select Configure Access to your forked TeamPSD repo

## Guidance for TeamPSD Users
## Generating Published Links in LucidChart
- [ ] **Open** a LucidChart document of interest
- [ ] Select **Share**
- [ ] Select **Advanced**
- [ ] Select **Publish**
- [ ] Select **Generate Publish Link**
- [ ] Copy **Published Link** by selecting the **blue paperclip** and paste link into GitHub Issue or pull request


Want to contribute? Great!

