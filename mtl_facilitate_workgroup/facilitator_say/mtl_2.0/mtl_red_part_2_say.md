---
title: "MTL Red Part 2 - Facilitator Say"
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

[<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_how_red.png"
     height = "175" width = "290">](#.)  

# MTL Red Part 2

Hello! I'm __________ and I'm __________.
### Today we're modeling to learn how to calculate team parameters.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#.) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#.) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We reviewed the HF, Diag, Enc and SP tabs in Team Data to find a patient and a team trend. We logged in to mtl.how/data and looked at the two team folders: data_ui and team_data_table. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_4_viz_diag.gif)](#.)|  [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We will examine calculated team parameters for CC, MM, PSY, AGG, and SP. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session3_data_ui_params.gif)](#.)|

<!-- Learning Objectives Icon --> 
[<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/>](#.)

## Learning Objectives
### After this session, you will be able to:

1.	Describe the parameters that are calculated by the *MTL* Data User Interface for Care Coordination (CC), Medication Management (MM), Psychotherapy (PSY), Aggregate Mix of Services (AGG) and Measurement Based Stepped Care and Suicide Prevention (SP).

2.	Test your expectations against calculated overall team statistics for CC, MM, PSY, AGG, and SP.

3.	Apply your clinical expertise to translate learnings from the *MTL* Data UI into team decisions.


# In-session Exercise (30 minutes)

## Let's get started! 

**Who would like to "drive" today?** [Recommend the Team Lead]

### Navigate to the data UI at mtl.how/data. 
- Remember that this is on the VA's secure SharePoint site, so it works best with Internet Explorer or Edge.

- You'll log in with your VA credentials and you should have all the same permissions here as you do in general for your role in the VA.  
- Scroll down to your team folder. You should have two folders: data_ui and team_data_table. Click on the "data_ui" folder and open the Excel file. 

### Clicking the "Create Team Data Table" button produces a table of descriptive team data.


#### You already have a fresh Team Data Table file to work with in the team_data_table folder.

- It takes some time to generate a team data table for all modules using your team's data.

- On average (depending on the size of your team) it may take 15 minutes or so to generate a team data table. And, Microsoft Excel will be unresponsive until it is finished.

- This is a different table from the one you generated last time by selecting the clinics that make up your team and then clicking "Get *Patient Level* Data." 

- Data in this file are means, medians and percentages of key variables likely to influence the team's priorities for learning from *Modeling to Learn*.

- There are team data produced for each module of *Modeling to Learn*, each stored in its own tab:
   + Care Coordination (CC) - tab title *CCParams*
   + Medication Management (MM) - tab title *MMParams*
   + Psychotherapy (PSY) - tab title *PSYParams*
   + Aggregate mix of services (AGG) - tab title *AggParams*
   + Measurement Based Stepped Care and Suicide Prevention (SP) - tab title *SPParams*
   
- The patient cohort for each module is built by capturing all the unique patients who had a visit with the given team (from the user-supplied list of clinics/grids) within the correct encounter bin between 18 and 6 months ago.  From that set of clinics, patients, and CPT codes, the data query then fetches all visits, no matter how long ago or how recent. 
  - In order to capture parameters that should be time-bound, such as new patients per week, the query can use that single year (e.g. from the patient cohort, how many were new to the team in the year that was used to build the cohort? Because that patient count captures all new patients over the year, we can just divide by 52 to get an average new patients per week).  
  - For parameters that should not be time-bound, all the visits can be considered, so that some patients will correctly be fed into the model with many visits over years of engagement.

- We have already produced a team data table for you, but to do it yourself:

	- Select a set of clinics in **ClinicSelection tab** similar to what you did last session. In the future, you can pull up the same clinics used last time for creating the team data table by clicking on the gray "Get previous clinic list from Create Team Data Table file" button (Cell B4) to add them column A.
	- Additionally, if you want to produce team data for the **SP module**, click on the **SPReferrals tab**. Use this tab to select clinics that your team refers to/receives referrals from for the Suicide Prevention module. The data pull will track patients stepped up/down between your team and the one(s) you select. For example, if you are a GMH team, you would select "SMH" in the dropdown for "The clinics selected below that my team refers to are" and add the SMH clinics your team refers to in Column A. Once you have selected referral clinics in the **SPReferrals tab**, return to the "ClinicSelection" tab. 
	- Click on the module drop-down. You can choose any module individually (CC, MM, PSY, AGG, SP), all modules without SP, or all modules including SP. If you are choosing "SP" or "all with SP", make sure to do the previous steps using the **SPReferrals tab**.
	- Click on "Create Team Data Table".
	- If you included SP in the module selection, three pop-ups will appear for the three possible care settings (GMH, SMH, PC/PCMHI) to indicate the threshold for minimum gap in patient care required for subsequent visit to be considered a new care episode. *In general for the (GMH or SMH or PC/PCMHI) setting, how long of a gap in patient care is required for the subsequent visit to be considered a new care episode? Set the threshold below in weeks. The default threshold is 39 weeks (9 months).*
	- The team_data_table file you generate will automatically be saved into the team_data_table folder. Regardless of the module selection you make, the team_data_table file will include all five module tabs and labels, but will populate zeroes ("0") for all parameters of  modules that were **not** selected.
	
- Navigate back to your team folder at mtl.how/data. Click on the "team_data_table" folder and open the Excel file to find the team data table already produced for you.
 
### 1. Select a module for review 

   + To show what data are used to tailor each *MTL* module to your team.
[Choose a module]  

   + *CCParams*: Key variables of interest in CC may include median engagement in weeks, appointment supply in appointments per week, return visit interval in weeks, starting rate in patients per week, and new patient wait times.  

   + *MMParams*: Key variables of interest in MM may include median engagement in weeks, appointment supply in appointments per week, return visit interval in weeks, starting rate in patients per week, and slots allocation percent for providers with and without an X waiver.  

   + *PSYParams*: Key variables that can be explored in PSY include median engagement duration and engagement after the patient's first 3 months measured in weeks, appointment supply by service type (AUD, DEP, OUD, PTSD) within 3 months, and return visit interval after 3 months in weeks. 
   
   + *AggParams*: Key variables in AGG include median engagement in weeks, appointment supply by service type, return visit interval in weeks, new patient start rate (mean), and service proportions from team data.  

   + *SPParams*: In SP, key variables of interest may include high risk flag rates, engagement times before ending treatment in a specific setting, engagement time before stepping down or up between care settings, wait times, and the ratio of high to low symptom patients in each setting.  

  Check out the different modules that are highlighted in the team data on the screen. As we review, we will use the mouse to highlight key team data variables.  

- Find a variable that is important to your team. Look at how the variable is estimated in the table. Notice the units.  

- Where can you find even more detailed information about your team data? In each of these Params tabs, you can find more detailed information about your team data. 

- Check out the two columns to the right of the numerical data [show with mouse]. Let’s explore these two columns.
	This column [highlight column] gives the description or definition of the variable. 
	This column [highlight column] contains additional details about how individual patient data are extracted and used to calculate your team’s historical trends.  

### 2. Select a second module for review.

- Check out the last 2 columns, to the right of the numerical data.  
	This column [highlight column] gives the description or definition of the variable.  
	This column [highlight column] contains additional details about how individual patient data are extracted and used to calculate your team’s historical trends.  

- Find a variable that is important to your team. How is it estimated in this table? What are its units?  

-  Where can you find even more detailed information about your team data?  
    + You can click on the “DataNotes” tab for a breakdown of how the patient cohort is defined, which CPT codes are used to define each service, and the patient engagement patterns (for the Psychotherapy module).  

### 3. Are there any team data table values you would like to explore in the team data UI?

-  If so, which ones? Open the data UI to examine your question.  

### 4. Does the team see any values in the team data that seem to vary significantly from expectations?

- If so, what is it surprising? 

- Does the estimation definition (second to last column, text in red) help you to interpret the variable value?  

### 5. Does the team see any values in the team data that fit your expectations about high priority team needs?

- If so, what are you noticing? 

- In what ways does the team data fit with your day-to-day clinical practice in your team?
  
### That's it for _Modeling to learn_ how to calculate team parameters. Next is our Done/Do review.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#.) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#.) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data)  We examined team parameters for CC, MM, PSY, AGG, and SP. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session3_data_ui_params.gif)](#.) |  [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) Find something in the team data table and consider its implications for team decisions. [![](https://raw.githubusercontent.com/lzim/teampsd/master/resources/gifs/mtl_menu.gif)](#.)|

### DO demo

1. We encourage you to look around in the team data table before next time. Test whether you can find a piece of data you decide to look for. Just take a minute, if you can, to become familiar with the format and content of the data table. 

2. Remember, you can click through the Params tabs, one for each module, to dig into the details of how each parameter is calculated in the text columns to the right of the numerical data.   

## Until next time, thank you for _Modeling to Learn_!
