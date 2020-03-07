---
title: "MTL Session 3 - Learner See"
author: "Team PSD"
date: "March 2020"
release: "MTL 2.0"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

[<img src = "https://github.com/lzim/teampsd/blob/master/resources/title_slides/mtl_s03_teamdata_title.png"
      height = "175" width = "420">](#DontLink)      
**Disclaimer**: If you are a self-directed learner, then some of the details in the guides may not apply to you. These guides were developed for facilitated *Modeling to Learn* Live team meetings.

# MTL Live Session 03

# Today we're modeling to learn how to produce team data for simulation.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#DontLink) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#DontLink) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We reviewed the HF, Diag, Enc and SP tabs in the Team Data UI to find a patient and a team trend. We logged in to mtl.how/data and looked at the two team folders: data_UI and team_data_table. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session2_data_ui_4_viz_diag.gif)](#DontLink) **_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**|[<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim) We will produce our team_data_table for the _MTL_ simulation user-interface (sim UI) [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session3_data_ui_params.gif)](#DontLink)**_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**|

<!-- Learning Objectives Icon --> 
[<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/>](#DontLink)

## Learning Objectives

1. Describe your team trends over the last two years based on the estimates in the team data table.

2. Test out your understanding of how the team data is estimated through review of the descriptions and definitions. 

3. Apply your clinical expertise to consider the team trends in the data UI and team data table to identify team priorities for learning.


# In-session Exercise (30 minutes)
[<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/illustrations/data_ui_sim_ui.png">](#DontLink)

### When you click the "Create Team Data Table" button, it produces a table of descriptive team data.
- We will not do this in-session today. You already have a fresh Team Data Table to work with in your team team_data_table folder.

- Data are means, medians and percentages of key variables likely to influence the team's priorities for learning from *Modeling to Learn*
- There are team data produced for each module of *Modeling to Learn*
  - Care Coordination (CC)
  - Medication Management (MM)
  - Psychotherapy (PSY)
  - Aggregate team services (AGG)
  - Measurement-based stepped care and suicide prevention (SP)
  
- Select a set of clinics in **ClinicSelection tab** similar to what you did for the data UI. 
- If you want to produce a team data table for the **SP module**, click on the **SPReferrals tab**. Use this tab to select clinics that your team refers to/receives referrals from for the Measurement Based Stepped Care and Suicide Prevention module. The data pull will track patients stepped up/down between your team and the one(s) you select. For example, if you are a GMH team, you would select "SMH" in the dropdown for "The clinics selected below that my team refers to are" and add the SMH clinics your team refers to in Column A. Once you have selected referral clinics in the **SPReferrals tab**, return to the "ClinicSelection" tab. 

- Click on the module drop-down to select the module you want and select "Create Team Data Table."

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/spreferrals_tabs.gif)](#DontLink)

**_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**

#### New for _MTL_ 2.0
- The "SPTransfers" tab is now called "SPReferrals."

- "Create Team Data Table for Sim UI" is now called "Create Team Data Table."

- In the future, if you would like to use the same clinic selections for pulling new parameters, you can select the "Get previous clinic list from Create Team Data Table file" arrow in Column B (Cell B4).

- You can now generate a team data table for all the modules without SP (called "All without SP" in the dropdown next to the "Create Team Data Table" button), or all the modules with SP (called "All with SP" in the dropdown next to the "Create Team Data Table" button).

- The team_data_table file you generate will automatically be saved into the team_data_table folder. Regardless of the module selection you make, the team_data_table file will include all five module tabs and labels, but will populate zeroes ("0") for all parameters of  modules that were **not** selected.

	- If you include SP in the module selection, three pop-ups will appear for the three possible care settings (GMH, SMH, PC/PCMHI) to indicate the threshold for minimum gap in patient care required for subsequent visit to be considered a new care episode. *In general for the (GMH or SMH or PC/PCMHI) setting, how long of a gap in patient care is required for the subsequent visit to be considered a new care episode? Set the threshold below in weeks. The default threshold is 39 weeks (9 months).*

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/three_pop_ups.gif)](#DontLink)

For *MTL* 1.7 click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md).

### 1. Select a module for review
- Find a variable that is important to your team. How is it estimated in this table? What are its units?
- Where can you find even more detailed information about your team data?
- Check out the last two columns. What is the difference between these two columns?

### 2. Select a second module for review 
- Check out the last two columns. 
- Find a variable that is important to you team. How is it estimated in this table? What are its units?
- Where can you find even more detailed information about your team data?

### 3. Are there any team data table values you would like to explore in the team data UI?
- If so, which ones? Open the data UI to examine your question.

### 4. Does the team see any values in the team data that seem to vary significantly from expectations?
- If so, what is surprising? Does the estimation definition (second to last columnn, text in red) help you to interpret the variable value?

### 5. Does the team see any values in the team data that fit your expectations about high priority team needs?
- If so, what are you noticing? In what ways does the team data fit with your day-to-day clinical practice in your team?

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session3_data_ui_params.gif)](#DontLink)

**_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#DontLink) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#DontLink) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim) We produced team data table for the MTL simulation user-interface (sim UI). [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session3_data_ui_params.gif)](#DontLink) **_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**|  [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_menu.png" height = "75" width = "110">](http://mtl.how/menu) Find something in the team data table and complete the mtl.how/menu (behind VA firewall) to prioritize your needs. Responses are confidential. [![](https://raw.githubusercontent.com/lzim/teampsd/master/resources/gifs/mtl_2.0/mtl_menu.gif)](#DontLink)**_MTL_ 2.0. For _MTL_ 1.7, click [here](https://github.com/lzim/mtl/blob/master/release_1.7/mtl_session03_see.md)**|
