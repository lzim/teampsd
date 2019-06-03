---
title: "MTL Session 02 - Facilitator Say"
author: "Team PSD"
date: "September 2018"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_live_sq_sm.png"
     height = "175" width = "290">  

# [MTL Live Session 02](https://github.com/lzim/teampsd/blob/master/mtl_facilitate_workgroup/mtl_live_guide/mtl_live_session02_see.Rmd "MTL Live Session 02")

Hello! I'm __________ and I'm __________. *Navigating to the Learner See Guide for Session 2 at mtl.how,* we see that
# Today we're modeling to learn how to check our patient data and team trends.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| <img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80"> **Done** | <img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90"> **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We identified our Team Vision, selected our Team Lead and set a standing team meeting time. We logged in to mtl.how/data to look at the splash page.| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We will select and review Team Data for _MTL_. |  

<!-- Learning Objectives Icon --> 
<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/> 

## Learning Objectives

### After this session, you will be able to:

1. Describe the decisions your team made in producing your team data table.  
2. Test out whether your expectations about team historical trends are displayed in the "viz" tabs.  
3. Apply your clinical expertise to identify new information about a team patient in the "data" tabs.  


<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90" style ="display: inline-block"/> 


## Let's get started!

As the graphic illustrates, we use the data UI to look back at team trends over the past two years - *what is*; and we will use the sim UI to look at team trends 2 years into the future to answer *what if* questions about different decisions the team could make.

## In-session Exercise (30 minutes): Patient data and team trends
<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/illustrations/data_ui_sim_ui.png">

1. The team data is stored on the VA’s corporate data warehouse site referred to as BISL, the Business Intelligence Service Line. We will refer to this as the BISL sharepoint splash page. The information in this data file is Protected Health Information (PHI). You should always save your data file back to SharePoint or places that are appropriate for PHI. If you're attaching a data file to an email, encrypt the file.

2. To navigate to the data user interface (data UI):  

  a.	Type mtl.how/data in your web browser. Internet Explorer works best for this resource.  

  b.	On the page titled “Select Your VISN”, click on your team’s VISN number.

  c.	On the page titled  “Select Your Facility”, click on the facility name for your team.
  
 ### :05 

3. Let's explore the information available in the BISL sharepoint splash page

  a. Once you have selected your facility name, a web version of Excel will open on your screen, showing charts from your facility's data.  
     
  b. On the right side of your screen you'll see a drop-down menu labeled VIEW. This is how you choose what would otherwise appear as tabs at the bottom of your Excel workbook. Click the down arrow to see the various worksheets available:  
      -  Control  - you can click on the cell next to the word "Station" and select your station number, then click "Get Clinic List"       -  ClinicSelection  - this is where you select the the clinics your team would like to include in your dataset  
      -  SPTransfers  - data about Suicide Prevention transfers  
      -  dataDiag - data about Diagnoses  
      -  dataHF - data about Health Factors  
      -  dataMeas - data about Measures or flag names  
      -  vizDiag - visuals or charts about Diagnoses  
      -  vizHF - visuals or charts about Health Factors  
      -  vizEnc - visuals or charts about Encounters, types of visits  
      -  visMeas - visuals or charts about Measures or flag names  
      -  CCParams - parameters for the *MTL* Care Coordination module
      -  MMParams - parameters for the *MTL* Medication Management module
      -  PSYParams - parameters for the *MTL* Psychotherapy module
      -  AggParams - parameters for the *MTL* Aggregate module
        
  d. What are the options for filtering and sorting the data: 
      - At present there are four tabs to use for filtering and sorting your team data.  
      - “Diag” is diagnostic data based on visits in the team clinic dataset you selected.  
      - “HF” is health factor data associated with those visits.  
      - When you filter to your clinic or division, you will see trends for the last two years.  

4. Your Team Data Folder - Scroll to your team folder at the bottom of the page. Open the data_ui folder and open your team data ui in Excel.
  a. Click on Control tab.  
  b. Click on the cell next to the word "Station" and click on your station number. If you have any issues with permissions, Team PSD can help you. 
  c. Click "Get Clinic List" and it will pull in clinics for your facility.

5. Go to the ClinicSelection tab. Use columns C-H to select the clinics that make up your team.
  a. You can sort by Clinic Name, Division Name, Physical Location, Primary and Secondary Stopcode.
  b. Or, if your team as designated provider clinics, you can select by provider name.
  c. Note that this will pull all clinics used in the last two years (including de-activated clinics). You can see the de-activated clinics in column I.
  d. Follow the instructions in **Box A2.** 
  e. After filtering, you can double-click on clinics to add them to column A, or you can highlight the clincis and click the gray "add all" button to add them to column A. 

6. We won't do this in today's session, but to view your individual patient data and trends, you will click on "Get-Patient-level Data."
  a. **When working with a team live, we will have already pulled a fresh data file to work with in a team's data folder.** 
  b. We will learn about the "Create Team Data Table for Sim UI" button in our next session.

7. Note that it takes some time to run a query from the data UI to the VA Corporate Data Warehouse. 
  a. Depending on the size of your team, it might take 15 minutes or so for the data UI to pull in a fresh set of team data, and Microsoft Excel will be unresponsive until it's finished this process.

8. Click to view the "viz" tabs, which show team trends.
  a. There are team trends for diagnoses, encounters, health factor data (e.g., suicide plans, evidence-based practice templates), and measures from mental health assistant.
  b. What stands out to you?
  c. What is most important to you to check out first?
  d. what is most surprising?

9. Click to view the "data" tabs, which show your team's individual patient information.
  a. Patients who have requested restricted access to their information have asterisks *******  
  b. Patient information correponds to the same categories as the team trends: diagnoses, encounters, health factor data (e.g., suicide plans, evidence-based practice templates), and measures from mental health assistant.  
  c. Providers can filter to find specific patients, or produce reports.  
  d. What **data** tab would you use to find out how many current patients on the team are engaged in a specific evidence-based psychotherapy? What column shows you the session number (EBP template) that the patient is on.  
  e. What **viz** tab would you use to see what the most common service encounters or visits are?  
  f. Are there services that have been increasing over time? Are there services that  have been descreasing over time?  
  g. With the team trends (viz) and team patient (data) information in the data UI, your team can efficiently use team meetings to focus on the interrelated issues of care coordination and team quality improvement.

### That's it for *Modeling to Learn* how to check our patient data and team trends. Next is our Done/Do review. 

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| <img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/done.png" height = "80" width = "80"> **Done** | <img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/do.png" height = "90" width = "90"> **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We selected the clinics that make up our team for the Team Data. | [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) Review the HF, Diag, Enc and SP tabs in Team Data to find a patient (zoom in) and find a team trend (zoom out). | 

### DO demo

1. We encourage you to look around in your team data before next time.  

2. Open the team data in Excel. 

3. Review the individual tabs to find an individual patient and a team trend. Look through the different tabs:
 + Health Factors (HF)  
 + Diagnostic (Diag)  
 + Encounters (Enc), and   
 + Suicide Prevention (SP)  

## Until next time, thank you for _Modeling to Learn_!
