---
title: "MTL Red, Part 2 - Learner See"
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

[<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_how_red.png" height = "175" width = "290">](#.)


# MTL Red Part 2

# Today we're modeling to learn how to calculate team parameters.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#.) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#.) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We reviewed the HF, Diag, Enc and SP tabs in Team Data to find a patient and a team trend. We logged in to mtl.how/data and looked at the two team folders: data_ui and team_data_table. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session2_data_ui_4_viz_diag.gif)](#.)|  [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We will examine calculated team parameters for CC, MM, PSY, AGG, and SP. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session3_data_ui_params.gif)](#.)|

<!-- Learning Objectives Icon --> 
[<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/>](#.)

## Learning Objectives

1.	Describe the parameters that are calculated by the *MTL* Data User Interface for Care Coordination (CC), Medication Management (MM), Psychotherapy (PSY), Aggregate Mix of Services (AGG) and Measurement Based Stepped Care and Suicide Prevention (SP).

2.	Test your expectations against calculated overall team statistics for CC, MM, PSY, AGG, and SP.

3.	Apply your clinical expertise to translate learnings from the *MTL* Data UI into team decisions.

# In-session Exercise (30 minutes)

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
- In the future, if you would like to use the same clinic selections for pulling new parameters, you can select the "Get previous clinic list from Create Team Data Table file" arrow in Column B (Cell B4).

- If you want to produce a team data table for the **SP module**, click on the **SPReferrals tab**. Use this tab to select clinics that your team refers to/receives referrals from for the Measurement Based Stepped Care and Suicide Prevention module. The data pull will track patients stepped up/down between your team and the one(s) you select. For example, if you are a GMH team, you would select "SMH" in the dropdown for "The clinics selected below that my team refers to are" and add the SMH clinics your team refers to in Column A. Once you have selected referral clinics in the **SPReferrals tab**, return to the "ClinicSelection" tab. 

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/spreferrals_tabs.gif)](#DontLink)

- Click on the module drop-down to select the module you want and select "Create Team Data Table." You can generate a team data table for each of the modules individually, all the modules without SP (called "All without SP"), or all the modules with SP (called "All with SP"). - When you select a team data table option for specific modules, the team_data_table file you generate will have all five module tabs and labels, but will populate 0s for all other parameters that were **not** selected.

  - If you included SP in the module selection, three pop-ups will appear for the three possible care settings (GMH, SMH, PC/PCMHI) to indicate the threshold for minimum gap in patient care required for subsequent visit to be considered a new care episode. *In general for the (GMH or SMH or PC/PCMHI) setting, how long of a gap in patient care is required for the subsequent visit to be considered a new care episode? Set the threshold below in weeks. The default threshold is 39 weeks (9 months).*
  
  [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/three_pop_ups.gif)](#DontLink)

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

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#.) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#.) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data)  We examined team parameters for CC, MM, PSY, AGG, and SP. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/mtl_2.0/session3_data_ui_params.gif)](#.) |  [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) Find something in the team data table and consider its implications for team decisions. [![](https://raw.githubusercontent.com/lzim/teampsd/master/resources/gifs/mtl_2.0/mtl_menu.gif)](#.)|
