---
title: "Session 3 Script"
author: "Stacey Park"
date: "March 2018"
output: 
  github_document: default
  html_document: default
  ioslides_presentation: default
  slidy_presentation: default
  pdf_document: default
---

<!-- MTL Logo, HTML img tag -->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/teampsd_style/mtl_logo/mtl_testdontguess_sm.png"
     height = "130" width = "500">  
     
{ } Signifies content to be added by Team PSD for the final Manual.  
[ ] Signifies explanatory notes and instructions for the facilitator; i.e. things they do not say out loud during session. This content stays in final Manual. How it will be designated/formatted is tbd; GHPC recommendation is that it be in RED font vs. black for script.

# Session 3: Reviewing Case and Data Selection for Care Coordination Simulation
## FACILITATOR PREP & FOLLOW-UP
### Overview

<!-- Learning Objectives Icon -->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_star_778913_003F72.png"
     height = "150" width = "150">   
### Learning Objectives
1.
2.
3.
4.
5.

### Agenda At-A-Glance {Insert for each session: Icon/topic; Instructor; Duration}

### Resources
{Insert list of materials, links, software, handouts, etc., needed for the session}

<!--SharePoint icon-->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_bar-chart-decline_869492_598527.png"
     height = "75" width = "75" style = "border: 0;">  
Team Data Sharepoint: https://spsites.cdw.va.gov/sites/PTSD_OMHO/Pages/VISN21/640.aspx

<!--Adobe Connect icon-->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_feedback_546911_598527.png"
     height = "75" width = "75" style = "border: 0;">  
Adobe Connect: https://va-eerc-ees.adobeconnect.com/team_psd/

### Preparation
{Insert things to review, set up, confirm, or communicate in advance of the session}

### Follow-up

## FACILITATION SCRIPT

<!-- Done List Icon -->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png"
     height = "135" width = "135">
### Done (10 minutes)
* Interim vision/Team learning goal (2 minute recap)
* Clinical case/Reason for selection (2 minute recap)
* Access Team Data SharePoint, Issues, and Trouble-shooting 

<!-- Do List Icon -->     
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png"
     height = "150" width = "150">
### Do (20 minutues)
* Explore Team Retrospective "Viz" and "Data"
* Find Clinical Case in Data
* Introduce Care Coordination Model at Next meeting (date)
* Discuss Simulation Data Inclusion and Exclusion Criteria

### 1.	We want to make sure that everyone can access and explore their team aggregate data (5 minutes). 
In your team folder, the dynamic data tool is a prototype that we can improve together over time.  
* Let’s take a few minutes to review issues with the data resources and trouble-shoot solutions.
* There are two buttons for data selection: “Get Patient Data” and “Data for Simulation”
* Retrospective data review shows us historical trends for the team (what team clinical care looks like now). Simulation data helps us examine decisions that may improve team care (how to achieve improvements).

### 2.	RETROSPECTIVE DATA REVIEW for Care Coordination and Quality Improvement (10 minutes)
**Get patient data** – This pulls the last two years of data based on the selection criteria you choose.
**Data are displayed in two forms “Viz” (trends over time) and “Data” (a sortable report).**
 
At present there are four tabs to use for filtering and sorting your team data.
* **“Diag”** – This is diagnostic data based on visits in the team clinic dataset you selected.
*	**“HF”** – This is health factor data associated with those visits.

**What stands out to you as we review the data?**
* Let’s take a few minutes to “Get Patient Data” and look for our Clinical Case.

**What do you notice as we search for this Veteran?**  

### 3.	SIMULATION DATA for Real-Time Experimentation and Learning (10 minutes)
**Produce simulation dataset** – This button will produce an aggregate dataset for our four simulation models.
1.	Care coordination (sessions 3 and 4)
2.	Medication Management and Evidence-based Pharmacotherapy (sessions 5 and 6)
3.	Psychotherapy and Evidence-based Psychotherapy (sessions 7 and 8)
4.	Aggregate Model Putting it all together (sessions 9 and 10)

**Are there any limitations of retrospective data review?**

'Modeling to Learn' goals include making the data accessible and transparent, and improving the quality of the data over time through improved feedback. However, even if data help to identify gaps in quality, it may not be obvious what causes quality gaps or what actions the team can take to resolve them.

Hint: We are not “Modeling to Predict,” we are “Modeling to Learn.”  A good analogy is when you estimate when you will pay of a car note, or estimate your desired savings for retirement.  You want to evaluate different payment or saving scenarios using the units of dollars, over a unit of time (e.g., $ savings/month) to answer questions such as, “When will I reach my goal of paying off this car if I pay $250/month?”  Or, “What is the difference in the amount of money I will have saved when I retire if I save $500/month instead of $250/month?”  

When you explore scenarios like this, you run the simulation to better understand the future impact of the financial decisions you make now.  In the same, the ideal “Modeling to Learn” result is that your team learns how to make better day-to-day decisions for your patients.  

We aim to learn from modeling simulations to improve the day-to-day care coordination and quality improvement decisions in this team.   

### Care Coordination Introduction
**when cpt.CPTCode in ('t1016','90832','90839') then 'Care or support'**

We start with care coordination visits to begin to examine causal dynamics in care and start our learning with a service that all disciplines can equally understand.

The Care Coordination model shows how a variety of team decisions interact to impact multiple operational outcomes at the same time. You can explore trade-offs between decisions such as desired new patient wait times, current patient return visit intervals, and overbooking and how they affect team outcomes like total missed appointments, number of patients in care, and number of patients completing care.

**1. Care Coordination Patient and Appointment States and Rates (Stock and Flow Diagram)**
*States/Stocks (rectangles)* depict and calculate where material or informational resources in the clinic accumulate over time. This accumulation creates system lags or delays. In the figure below, there are two stocks “Appointments in CC” (units = # of CC appointments in the team’s clinics/grids) and “Patients in CC” (units = # of CC patients in the team). 
Hint: Here is the equation for calculating the variable “Patients in CC” = “Starting CC Rate” – “Ending CC Rate.”

*Rates/Flows (faucet icons)* depict and calculate the rate of change in and out of these states (inflows/outflows).  There are four rates below.  What are they? 
Hint: Two rates are calculated as patients/week and two rates are calculated as appointments/week.

*Black font* = calculated variables.  There are six calculated variables in the figure below.
*Red font* = the team data you selected using “Data for Simulation.” 

**What variable is a team data input below?**  
Hint: There is not an equation for red font parameter values, the team data is read in to the model from the data you select.  There are a total of six team parameter values that are put in the Care Coordination model (the rest of the variables are calculated/calibrated against the six data inputs). The red font data inputs for care coordination are (definitions in parentheses):  

*	True CC Missed Appointment Percentage (for the clinics you select)
*	Team Data on CC Return Visit Interval (RVI) (for the visits in the clinics you select)
*	Baseline CC Appointment Supply (75% of typical CC slot usage for the clinics you select).
*	Team Data on Patient Starts (patients with a new CC visit in the clinics you select).
*	Team Data on New Patient Wait Time 
*	Median Engagement Time in CC (*This is the answer to the team input question above).

*Blue lines* depict and calculate the dynamic relationships between patients and appointments. In a system dynamics model, dynamic relationships are causal relationships that changes over time. We describe two primary types of dynamic relationships (+/-) below. However, note that most causal relationships in a system occur among several interdependent variables and not just between two variables like the examples below.

**+ sign** indicates a causal relationship between two variables in which one variable generates more of the other variable.  For example, you would read the blue arrow on the far left in the following way:  “As the rate of patients starting increases in patients/week, then the booking of CC appointments increases in appointments/week.” OR “As the rate of patients starting CC decreases, then the booking of CC appointments decreases.  This type of causal relationship leads to growth or decline (e.g., vicious and virtuous cycles).

**- sign** indicates a causal relationship between two variables that move in opposite directions. As one variable rises (increases), the other variable falls (its effect decreases the other variable).  OR as one variable decreases, its effect increases the other variable. This type of causal relationship keeps the dynamic relationship between to the two variables in balance or steady. 

**How would you read the figure to describe the influence of the “Median engagement Time in CC (in weeks) on the “Ending CC Rate?”**
Hint: Here is the equation for calculating the “Ending CC Rate” = Patients in CC/Median Engagement Time in CC.

<img src = https://raw.githubusercontent.com/lzim/teampsd/facilitation_guide/cc_session3_image.png>

<!-- Done List Icon -->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png"
     height = "135" width = "135">

### Done 
* Team Lead
* Team Data Sharepoint
* Team Meeting 

<!-- Do List Icon -->     
<img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png"
     height = "150" width = "150">
### Do
* Team Learning Goal (10 minutes) 
* Clinical Case (5 minutes) 
* Data Selected for Simulation (10 minutes)

