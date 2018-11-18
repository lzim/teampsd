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

# Today we're modeling to learn how to check our patient data and team trends.
Hello! I'm __________ and I'm __________ [Co-facilitators introduce themselves]. Today we're modeling to learn how to check our patient data and team trends.

### Looking at the Done/Do table in the Session 2 Learner See Guide at mtl.how:

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png" height = "80" width = "80"> **Done** | <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png" height = "90" width = "90"> **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We identified our Team Vision, selected our Team Lead and set a standing team meeting time. We logged in to mtl.how/data to look at the splash page.| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We will select and review Team Data for _MTL_. |  


### After this session, you will be able to:

<!-- Learning Objectives Icon --> 
<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/we_decided_learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/> 

## Learning Objectives

1. Describe the decisions your team made in producing your team data table.  
2. Test out whether your expectations about team historical trends are displayed in the "viz" tabs.  
3. Apply your clinical expertise to identify new information about a team patient in the "data" tabs.  

### Let's get started!

## In-session Exercise (30 minutes): Patient data and team trends

1. A word about *MTL* on BISL:

a. The team data is stored on the VA’s corporate data warehouse site referred to as BISL [Business Intelligence Service Line]. We will refer to this as the BISL sharepoint splash page. 

b. The information in this data file is Protected Health Information (PHI). Please save your data file back to SharePoint or places that are appropriate for PHI. If attaching a data file to an email, encrypt the file.

2. To navigate to the data user interface (UI):  

a.	Type mtl.how/data in your web browser. Internet Explorer works best for this resource.  
b.	On the page titled “Select Your VISN”, click on your team’s VISN number.
c.	On the page titled  “Select Your Facility”, click on the facility name for your team.

3. Let's explore the information available in the BISL sharepoint splash page

a. Once you have selected your facility name, a web access version of Excel will open on your screen.  

b. First, let's see how to manipulate the view with the various scroll bars:  
     - A scroll bar on the far right lets you move up and down to see the entire data UI screen.  
     - Another bar on the right side allows you to move up and down to see a list of variables that you can include in charts.  
     - Then, just like you have in Excel, there are vertical and horizontal scroll bars to move up and down rows and left and right across columns.  
     
c. Next let's look at the various worksheet tabs at the bottom of the Excel file, from left to right:  
      -  Control  - you can click on the cell next to the word "Station" and select your station number, then click "Get Clinic List"  
      -  ClinicSelection  - this is where you select the the clinics your team would like to include in your dataset  
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
a. Click on Control tab
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
b. *NOTE: Do we need to create sample chart for video*
c. What stands out to you?
d. What is most important to you to check out first?
e. what is most surprising?

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
| <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png" height = "80" width = "80"> **Done** | <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png" height = "90" width = "90"> **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) We selected the clinics that make up our team for the Team Data. | [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_data_sm.png" height = "75" width = "110">](http://mtl.how/data) Review the HF, Diag, Enc and SP tabs in Team Data to find a patient (zoom in) and find a team trend (zoom out). | 


## Until next time, thank you for _Modeling to Learn_!
