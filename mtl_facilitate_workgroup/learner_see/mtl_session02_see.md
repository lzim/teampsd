---
title: "MTL Session 2 - Learner See"
author: "Team PSD"
date: "SP Oct 16, 2019 | RH Jan 24 2020, |AP Feb 5, 2020 | RH March 2 2020"
release: "MTL 1.8"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

[<img src = "https://github.com/lzim/teampsd/blob/master/resources/title_slides/mtl_s02_data_ui_title.png"
     height = "270" width = "590">](#DontLink)  
**Disclaimer**: If you are a self-directed learner, then some of the details in the guides may not apply to you. These guides were developed for facilitated *Modeling to Learn* Live team meetings.
# MTL Live Session 02

# Today we're modeling to learn how to check our patient data and team trends.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#DontLink) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#DontLink) **Do** |
| --- | --- |  
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/teampsd_style/teampsd_logo/va_team_psd_logo_sq_sm.png" height = "75" width = "100">](mailto:mtl.info@va.gov) [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We identified our Team Vision, selected our Team Lead and set a standing team meeting time. We logged in to mtl.how/data to look at the splash page.  [<img src="https://raw.githubusercontent.com/lzim/teampsd/master/resources/gifs/data_ui_login.gif" height="200px" width="350px"/>](#DontLink)  | [<img src= "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height= "75" width= "110"/>](http://mtl.how/data) We will select and review Team Data for _MTL_. [<img src= "https://raw.githubusercontent.com/lzim/teampsd/master/resources/gifs/session2_data_ui_2.gif" height="200px" width='400px'/>](#DontLink)|  
 
<!-- Learning Objectives Icon --> 
[<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/>](#DontLink) 

## Learning Objectives

1. Describe the decisions your team made in producing your team data table.

2. Test out whether your expectations about team historical trends are displayed in the "viz" tabs.

3. Apply your clinical expertise to identify new information about a team patient in the "data" tabs.


# In-session Exercise (30 minutes)
[<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/illustrations/data_ui_sim_ui.png">](#DontLink)

## *MTL* on BISL

### 1. Using an Internet Explorer browser, go to mtl.how/data. First select your VISN and then select your facility.
[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/data_ui_login.gif)](#DontLink)

### 2. Explore the information available in the BISL Sharepoint splash page.
[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/data_ui_splashpage.gif)](#DontLink)

- Click on the View dropdown. What View options are there and what do they mean? Hints:
  - Count: Aggregate Data for Viz trends
  - Data: Sortable report of data
  - Diag: Diagnostic data 
  - Enc: Encounter types of visits
  - HF: Health Factors data related to visits
  - Meas: Measures or flag names
  - Viz: Visualization of trends  

- What filtering options are available? 
  - Filter to your clinic or division to see trends for the last two years.

## Your Team Data Folder

### 3. Scroll to your team folder at the bottom of the page. Open the data_ui folder and open your data_ui file in Excel.
- Select your station using the control tab. If you have any issues with permissions, TeamPSD can help you.
- Click "Get Clinic List" and it will pull in clinics for your facility.
[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_1.gif)](#DontLink)

### 4. Go to the ClinicSelection tab. Use columns C-H to select the clinics that make up your team.
- You can sort and filter by Clinic Name, Division Name, Physical Location, Primary and Secondary Stopcode.
- Or, if your team has designated provider clinics, you can select by provider name.
- Note: This will pull all clinics used in the last two years (including de-activated clinics: denoted by "ZZ"). You can see the de-activated clinics in column I.
- Follow the instructions in **Box A2.** 
- After filtering, click Add All. Fine-tune your selections by double-clicking on the clinic name in column A (to remove) or column C (to add).

### 5. To view your team patient data and your team trends, click "Get-Patient-level Data." We will not do this in-session today.
- **You already have a fresh data UI file to work with in your team data folder.** 
- We will learn about the "Create Team Data Table for Sim UI" button in our next team meeting.

### NOTE: It takes some time to run a query from your team data UI to the VA Corporate Data Warehouse. 
- On average (depending on the size of your team) it may take 15 minutes or so for your team data UI to pull in fresh data, and Microsoft Excel will be unresponsive until the data UI has finished pulling in your data.

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_2.gif)](#DontLink)

### 6. Click to view the "viz" tabs, which show team trends.
- There are team trends for diagnoses, encounters, health factor data (e.g., suicide plans, evidence-based practice templates), and measures from Mental Health Assistant.
- What stands out to you?
- What is most important to you to check out first?
- What is most surprising?

[![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_4_viz_diag.gif)](#DontLink)

### 7. Click to view the "data" tabs, which show your team's individual patient information.
- Patients who have requested restricted access to their information have asterisks (****) in Columns F & G. If you are a VA provider, you can still identify patients from Column H.
- Patient information corresponds to the same categories as the team trends: diagnoses, encounters, health factor data (e.g., suicide plans, evidence-based practice templates), and measures from Mental Health Assistant.
- Providers can filter to find specific patients, or produce reports. 
- What **data** tab would you use to find out how many current patients on the team are engaged in a specific evidence-based psychotherapy? What column shows you the session number (EBP template) that the patient is on?
- What **viz** tab would you use to see what the most common service encounters or visits are?
- Are there services that have been increasing over time? Are there services that have been descreasing over time?

## With the team trends (viz) and team patient (data) information in the data UI, your team can efficiently use team meetings to focus on the interrelated issues of care coordination and team quality improvement.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80">](#DontLink) **Done** | [<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90">](#DontLink)) **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We confirmed the clinics that make up our team for the Team Data. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_2.gif)](#DontLink)| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) Review the HF, Diag, Enc and SP tabs in Team Data to find a patient (zoom in) and find a team trend (zoom out). Log in to mtl.how/data and look at the two team folders: data UI and team data. [![](https://github.com/lzim/teampsd/blob/master/resources/gifs/session2_data_ui_4_viz_diag.gif)](#DontLink)|

