---
title: "MTL Session 6 - Faciliator Say"
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

# [MTL Live Session 06](https://github.com/lzim/teampsd/blob/master/mtl_facilitate_workgroup/mtl_live_guide/mtl_live_session06_see.Rmd "MTL Live Session 06")

# Today we're modeling to learn how to tell a systems story.
Hello! I'm __________ and I'm __________ [Co-facilitators introduce themselves]. Today we're modeling to learn how to tell a systems story.

### As you see in the Done and Do table of your Learner See Guide:

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png" height = "80" width = "80"> **Done** | <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png" height = "90" width = "90"> **Do** |
| --- | --- | 
|[<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim)  We logged in to mtl.how/sim and reviewed the "i" information in the Model Diagram and Experiments section.| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim)  We will tell a systems story about the team's top priority using the Model Diagram in the sim UI. | 

### After this session you’ll be able to:

<!-- Learning Objectives Icon --> 
<img src = "https://github.com/lzim/teampsd/blob/master/resources/icons/we_decided_learning_objectives.png" height = "90" width = "90" style ="display: inline-block"/> 

## Learning Objectives

1. Describe the systems story of your team's highest priority. 
2. Test out your thinking about causes of team challenges using the model diagram.
3. Apply clinical expertise to develop a question for team learning using simulation.

### Let's get started:

# In-session Exercise (30 minutes): The Model Diagram and Systems Story

1.	For this session, you should go ahead and log in to your Individual world at **mtl.how/sim**. That way you'll be able to play along with our scavenger hunt.  

+ To log in to your Individual world, enter your log-in credentials and click **LOGIN**, then select the world that starts with **"ind" from the drop-down menu**.  

+ Once you're on the _MTL_ Home Page, look over on the **left section with Session in the blue heading bar**.  

+ If you've gone into the _ Module before, you'll see the **name of the module and the dataset you chose under the first option**, Join Current Session. If so, select that and hit Play. If not, look **below and select the _ module**.  

+ "Select Team Data" will appear. Click on that and choose the team dataset from the drop-down menu. Then hit **Play**. (If you don't see any data to select in the Team Data menu, go back to the instructions in Session 4 to see how to upload your team dataset.)  

Now check what you're seeing against what we're showing on the video. It should look the same, except that it will have YOUR team's name at the **top left**, and YOUR name and photo at the **top right**, and YOUR team's dataset listed in the **blue bar of the main section above the model diagram, here**.  

Also, depending on the size of your monitor and whether your browser window is full-screen or less, you might see more or less than what we're showing of the model diagram. It's a dynamic graphic, so if you re-size the browser window by clicking the **boxes icon in the top right** and adjust its size, you can get more or less of the diagram to show up at once.  

2.	We're going to ask a series of questions and your job is to find the answer in the Model Diagram.  

Question 1: Over what time frame does an experiment run?  

Answer: You can find the time frame in the **Experiment Timeline section up at the top of the model diagram section**. Experiments simulate the plausible future out **two years from today**.  

Question 2: Where can you find descriptions for the variables in the Model Diagram? How is the variable, Actual Hours Available for Service, described?  

Answer: The **small circles with i inside throughout the sim UI** provide additional information when you click on them. If you click **this one by Actual Hours Available for Service**, you see, "The clinician time available for a service depends on the total clinical hours available, the relative increase in hours due to overtime, and the % allocated to a service."  

Question 3: What happens in the diagram when you “Reveal Complexity?”  

Answer: Options to Reveal Complexity are found **under the Experiment Timeline** in each module. You can select any combination of check-boxes to bring more of the model diagram into view, or uncheck them to make it less visually complex. You should know that the amount of the model diagram being shown does NOT have anything to do with how the model itself is running when you run experiments - it's ONLY an option to let you control how much of the actual model's complexity you're viewing in the diagram. When we **check Supply Affects Patient Services**, some extra, light blue causal loop arrows appear **at the bottom of the diagram**. Checking **Effects of Overtime** brings up additional, dark blue arrows **on the right side of the diagram**. You can play with those options and study what happens.  

Question 4: What are the units of time in mtl.how/sim?  

Answer: weeks

3.	Now we’ll use the Model Diagram to tell a systems story about the needs and questions the team identified as your priority. 

**CARE COORDINATION SYSTEMS STORY** - Balancing Existing and New Patients

- Revealing the "Balancing Patients" detail in the CC model diagram shows key factors that affect how we balance providing quality care to existing patients with getting new patients into care in a timely manner. You probably recognize from clinical experience that this is a balancing act - there are trade-offs you have to make:

- You have a given number of appointments slots available, and they can go either to new or existing patients. The more go to new patients, the fewer can go to existing patients, and vice versa.

- When you open up slots for new patients (green box), following the arrow down and to the left from the green box you see that means an increase in the Starting Rate for new patients. Continuing from the Starting Rate to the Booking Rate (remember, "starting" is what _patients_ do; "booking" is an _appointments_ action), we see that if the Starting rate is going up, then so is the Rate of Booking appointments, which means creating appointments, which means more Appointments in CC, and that means more Appointments for Existing Patients. (Once a patient starts, they instantly become an existing patient.)

- But now notice that an increase in Appointments for Existing Patients means a DECREASE in the Appointment Supply for New Patients. This is how that balancing act shows up in a model diagram: We traced a chain of effects through the system and found that if we made an increase in one place, the cascading events circled back to decrease that first variable . This is a feedback loop - the change rippled all the way back to the starting place - and it's the kind of feedback we call a balancing loop, because it causes things to oscillate back and forth and "try" to achieve a balance around a steady state, like the temperature in your house when the thermostat is working to keep it at the temperature you set.

- There's another variable shown in red inside the loop we just looked at: Return Visit Interval. This changes the effect of using your appointment supply on new patients. If you increase the return-to-clinic interval, that is, if you increase the average time between appointments for patients in your team, that has the effect of reducing the use of Appointments for Existing Patients, keeping your Appointment Supply for New Patients from dropping so much due to the ongoing load of patients you brought into your care.  

**MEDICATION MANAGEMENT SYSTEMS STORY** _decide which of the following to tell in the video; write scripts for all for facilitator resources_

- Balancing Existing and New Patients (Balancing Loop)

- Overbooking Affects No Shows

- Wait Time Affects Referrals (Balancing Loop) Sensitivity Tests

- Sensitivity of Missed Appointments to Task Time

- Sensitivity of Referals to Wait Time Patient Cohorts

- Alcohol Use Disorder (AUD)

- Depression (DEP)

- Opioid Use Disorder (OUD)

- Other

**PSYCHOTHERAPY SYSTEMS STORY** - Balancing Existing and New Patients; Engagement After 3 Months

The psychotherapy module shows how team psychotherapy decisions interact, and depicts patterns of psychotherapy engagement in your team. You can explore solutions to the challenges of getting patients to complete a full course of therapy, while also achieving goals to start enough new patients in psychotherapy. Insights about these dynamics can be used to increase the local reach of evidence-based psychotherapies.

**AGGREGATE MIX OF SERVICES SYSTEMS STORY** _decide which of the following to tell in the video; write scripts for all for facilitator resources_

- Supply Affects Patient Services

- Effects of Overtime

- Fatigue Increases Clinic Cancellations (Reinforcing Loop)

- Overtime Relieves Work Pressure Slowly (Balancing Loop)

- Overtime Relieves Work Pressure Quickly (Balancing Loop)

- Burnout Increases Clinician Questions (Balancing Loop)

- Return-to-clinic Visit Interval (RVI) and Wait Times

- Appointment Backlog Extends Return Visit Interval (Balancing Loop)

**MEASUREMENT-BASED STEPPED CARE FOR SUICIDE PREVENTION SYSTEMS STORY**  _decide which of the following to tell in the video; write scripts for all for facilitator resources_

- GMH 

- PC/PCMHI 

- SMH 

- Mental Health Care Continuum

### That’s it for _Modeling to Learn_ how to tell a systems story. Next is our Done/Do review.

Today we told a systems story about our team's top priority and entered a question in the Text section. Before next time, pleae log into your individual world and enter a Question and Hypothesis about the base case experimental run in the Text section.

## Done and Do (15 minutes)
<!-- Do/Done Tables -->
| <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_hexagon-check-mark_309690_003F72.png" height = "80" width = "80"> **Done** | <img src = "https://raw.githubusercontent.com/lzim/teampsd/hexagon_icons/np_synchronize_778914_003F72.png" height = "90" width = "90"> **Do** |
| --- | --- | 
| [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim) We told a systems story about our team's top priority and entered a question in the Text section. | [<img src = "https://raw.githubusercontent.com/lzim/teampsd/master/resources/logos/mtl_how_sim.png" height = "75" width = "110">](http://mtl.how/sim) Log in to our individual world at mtl.how/sim and enter our question and hypothesis about the Base Case run in the Text section. |

## Until next time, thanks for *Modeling to Learn*!
