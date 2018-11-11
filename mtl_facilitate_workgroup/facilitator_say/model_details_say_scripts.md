---
title: "Module Detailed Examples for Facilitator Scripts"
author: "Team PSD"
date: "October 2018"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

<img src = "https://github.com/lzim/teampsd/blob/master/resources/logos/mtl_sq_sm.png"
     height = "150" width = "275">  

# *Modeling to Learn* - Model Details for Facilitator Say Scripts

## CARE COORDINATION

**Team Need:**
Patients are having to wait longer than we'd like to start Care Coordination. We wonder if we can solve this by increasing the supply of care coordination appointments we alot to new patients; and/or what would happen to wait times if we increased the return visit interval for existing patients.

**System Story:**
- *Complexity and Feedback Loops*
  - Balancing Existing and New Patients (Balancing Loop)
  - Overbooking Affects No Shows
  - Wait Time Affects Referrals (Balancing Loop) 
- *Sensitivity Tests* 
  - Sensitivity of Missed Appointments to Task Time
  - Sensitivity of Referals to Wait Time

**System Story Script:**

- *Complexity and Feedback Loops*

  - Balancing Existing and New Patients (Balancing Loop)

- Revealing the "Balancing Patients" detail in the CC model diagram shows key factors that affect how we balance providing quality care to existing patients with getting new patients into care in a timely manner. You probably recognize from clinical experience that this is a balancing act - there are trade-offs you have to make:
- You have a given number of appointments slots available, and they can go either to new or existing patients. The more go to new patients, the fewer can go to existing patients, and vice versa.
- When you open up slots for new patients (green box), following the arrow down and to the left from the green box you see that means an increase in the Starting Rate for new patients. Continuing from the Starting Rate to the Booking Rate (remember, "starting" is what _patients_ do; "booking" is an _appointments_ action), we see that if the Starting rate is going up, then so is the Rate of Booking appointments, which means creating appointments, which means more Appointments in CC, and that means more Appointments for Existing Patients. (Once a patient starts, they instantly become an existing patient.)
- But now notice that an increase in Appointments for Existing Patients means a DECREASE in the Appointment Supply for New Patients. This is how that balancing act shows up in a model diagram: We traced a chain of effects through the system and found that if we made an increase in one place, the cascading events circled back to decrease that first variable . This is a feedback loop - the change rippled all the way back to the starting place - and it's the kind of feedback we call a balancing loop, because it causes things to oscillate back and forth and "try" to achieve a balance around a steady state, like the temperature in your house when the thermostat is working to keep it at the temperature you set.
- There's another variable shown in red inside the loop we just looked at: Return Visit Interval. This changes the effect of using your appointment supply on new patients. If you increase the return-to-clinic interval, that is, if you increase the average time between appointments for patients in your team, that has the effect of reducing the use of Appointments for Existing Patients, keeping your Appointment Supply for New Patients from dropping so much due to the ongoing load of patients you brought into your care.  

  - Overbooking Affects No Shows
  
- Revealing the Overbooking Affects No-Shows detail adds to the story by showing what happens when Overbooking (green variable, top right) is used to make up for limited Appointment Supply (red, at right). We can add more appointments to our supply if we say we're going to work through lunch or eliminate any time we've scheduled in for tasks like writing notes, following up with patients, etc. 
- But this means less time for those tasks that we know are important for keeping both providers and patients on track, so it will ultimately lead to a higher Missed Appointment Rate (top left). As the Missed Appointment Rate goes up, the number of Missed Appointments per week (True Missed Appointment Rate) increases, which leads to an increase in the Rescheduling Rate. Over time this means more CC Appointments are needed for existing patients, delaying or 'crowding out' new CC patients who are Waiting to Start.
- The other arrow added in with this complexity reveal is the one from Completing Rate for appointments to the True Missed Appointment Rate. The more Appointments are Completed in CC each week, the more are missed, if you assume a fixed Percentage of Appointments Missed. But more Missed Appointments leads to more Rescheduling, which leads back to more total Appointments in CC. And again, the need for more CC Appointments for existing patients means less room in the grid for new patients.

  - Wait Time Affects Referrals (Balancing Loop)
  
- The Wait Time Affects Referrals detail shows what happens when there is an increasing backlog of patients Waiting to Start CC. This causes the average New Patient Wait Time to climb; and at some point, referrals to CC begin to slow down. Patients are kept in or referred to other services so that they don't have to wait longer than the desired maximum for their first CC appointment.
- The Target Wait Time - something the team can decide on - changes how Referral Rate responds to New Patient Wait Time. If a longer average wait time is OK, then referrals won't slow down when patients are waiting less time than that to get into care, and vice versa.
- This is a balancing loop - one where, if one of the three variables - Patients Waiting to Start, New Patient Wait Times, or Referral Rate - is held constant, the other two will fluctuate up and down. If you target a certain Wait Time for New Patients, then when the actual wait times are noticed creeping up above that target, Referrals will slow down. This will mean you gradually get everyone who was Waiting to Start into care because you're able to schedule them faster than they're being referred in. Once you've 'drained' the backlog of Patients Waiting to Start, the low Referral Rate will mean New Patients' Wait Times will drop below the Target Wait Time, so eventually the Referral Rate will pick back up again - until it creates another backlog and Wait Times increase too far, and so on. 
- In addition to running experiments around the team's Target Wait Time, this loop shows that we can also experiment with team decisions about Referral Rate. We can ask questions like, "If the Referral Rate to CC goes up by some percentage because, say, we've started graduating patients more quickly from other services - but our Starting Rate in CC stays the same because we don't have any extra appointment slots for new patients - what will become the 'new normal' for New Patient Wait Times in CC?"

- *Sensitivity Tests* 

- Sensitivity sliders let users test different degrees of influence that a change in one thing has on another. In Care Coordination, the two relationships that we know exist - but have no way to quantify - are the effect of providers' available Task Time's on patients' Missed Appointments; and the effect of New Patient Wait Time on the Referral Rate for new patients. You can adjust those sensitivity sliders from zero, implying there is no relationship between the two variables, to a maximum of 2, implying a strong impact or a highly sensitive relationship.


**Base Case - Session 7:**

  + Q - What happens to our new patient wait times and our number of patients in care coordination if we make no new decisions?
  + H - If we make no new decisions then patients will start accumulating in "the waiting room" for care coordination. But then it will swing back the other way, and at some point the wait time will become steady at about the level it is now. This is because of the balancing that happens between using appointments for new and existing patients. The number of patients in care coordination will stay constant.
 
  + F - Wait Time increases rapidly; but then it drops back down, oscillating back and forth until it ultimately levels out after about a year.
  + D - Next time we will experiment with adjusting our appointment supply to reduce New Patient Wait Times.
    
**Experiment 1 - Session 8:**
  + Q - What will happen to the Starting Rate and New Patient Wait Time if we increase the Appointment Supply of care coordination appointments overall?
  + H - Increasing the CC Appointment Supply will make more Appointments available for both new and existing CC patients. The Additional Appointment Supply for New CC Patients will increase the Starting Rate and lower New Patient Wait Times.
  + F - Increasing the supply of Appointment Supply for New CC Patients does increase the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start.
  + D - Next time we will experiment with adjusting our Return Visit Interval.
    
**Experiment 2 - Session 9:** 
  + Q - What will happen to the Starting Rate and New Patient Wait Time if we lengthen our team's average Return to Clinic Interval (in weeks) by a certain amount?
  + H - Increasing the Return Visit Interval will have the effect of increasing the Appointment Supply for New CC Patients by decreasing the Appointments for Existing Patients. Just as in Experiment 1, the increased Appointment Supply for New CC Patients will increase the Starting Rate and decrease New Patient Wait Times. But decreasing the Appointments for Existing Patients will also lower the Completing Rate for CC patients. 
  + F
  + D - We decided to try a combination of experiments 1 and 2. We will experiment with both increasing our overall Appointment Supply in care coordination and increasing our targeted Return Visit Interval for existing patients.

**Other CC Notes for Experiments 2 and 3:**

- Return-to-clinic interval: Increasing the Return Visit Interval slows the weekly Booking Rate, which decreases the number of scheduled Appointments in CC, thereby increasing CC Appointments Available for New Patients each week.

- Appointments set aside for new patients:  Increasing the supply of Appointments Available for New Patients increases the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start, adding to total scheduled Appointments in CC.

- Overbooking and missed appointments:  Increasing CC Overbooking serves to increase weekly True Missed Appointments, which, over time, keeps the number of scheduled Appointments in CC higher, which can delay or 'crowd out' new CC patients who are Waiting to Start.

- Wait times and referrals: Decreasing the weekly CC Referral Rate decreases the number of new CC patients Waiting to Start CC. However, new CC patients Waiting to Start CC is also a function of  the team's new CC patient Starting Rate, which is determined by current scheduled Appointments in CC and Appointments Available for New Patients. 

**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 

  + Q
  + H
  + F
  + D
 
 ## MEDICATION MANAGEMENT
 
**Team Need:**
Our team would like to use the medication management module to explore how we could serve more patients with specific conditions, like Opioid Use Disorder (OUD), with our existing team staffing levels. We would also like to test changing the Return-to-clinic Visit Interval (RVI) to meet more specific needs of patients who require evidence-based pharmacotherapy (EBPharm). 

**System Story:**
*Complexity and Feedback Loops*
- Balancing Existing and New Patients (Balancing Loop)
- Overbooking Affects No Shows
- Wait Time Affects Referrals (Balancing Loop) 
*Sensitivity Tests* 
- Sensitivity of Missed Appointments to Task Time
- Sensitivity of Referals to Wait Time
*Patient Cohorts*
- Alcohol Use Disorder (AUD)
- Depression (DEP)
- Opioid Use Disorder (OUD)
- Other

**Base Case - Session 7:**

  + Q - What does medication management look like in our team if we make no new decisions?
  + H - If we make no new decisions then we will rwho need eeach the same proportion of our patients with medication assisted therapy for OUD.
  + F - We can see our Return-to-clinic Visit Interval (RVI) in the base case is the same for all patient needs, but we'd like to better meet more specific needs of patients vidence-based pharmacotherapy (EBPharm).
  + D - Next time we will experiment with increasing our referrals to OUD EBPharm.
  
**Experiment 1 - Session 8:**
  + Q - Can we serve 4 new patients with OUD each week? -- no  :(
  + H - If our referral rate for OUD is 2 pts per month (0.5 per week), and we allocate 40% of our x-waiver slots to OUD treatment, and 40% to Other Needs, and we change our RVI for depression to 12 weeks, and the RVI for OUD to 4 weeks (in line with our quality standards), then we will serve more OUD patients with our existing team staff, without increasing the wait time for new depression patients.
  + F - We met our goal of getting more patients into MAT for OUD! by having a more realistic referral rate, using more x-waiver provider supply, and adjusting our RVIs for depression and OUD in line with quality standards.
  + D - I am going change how I order my return to clinics for OUD and depression; allocate ~40% of my time to OUD patients; conduct a few more experiments to refine the allocation of my time to better balance trade-offs between patient needs.

**Experiment 2 - Session 9:** 			
  + Q - how do we best allocate our x waiver appointments to serve 4 new OUD patients per week?
  + H- If we increase our proportion of appointments with an X waiver to 10%, then it will increase the starting rate.
  + F - fears confirmed: if we increase the proportion of x-waiver slots to 10%, it does increase the starting rate for OUD MM to about 1 patient/month. But it also increased the wait times for patients with other needs.
  + D - Tradeoff is bad. Increasing referrals and reallocating appointments is not enough to serve the new OUD patients without an impact on our other patients.

**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 
  + Q - If we get an increase in patients with OUD, can we serve them?
  + H - An increase in referrals of OUD patients will increase patients waiting start MM service, which will increase the starting rate.
  + F - An increase in patients with OUD, with no other changes ,  increases patients waiting to start MM.
  + D - Consider other parts of care delivery to meet new OUD patients' needs.  Cannot focus on referral rate in isolation.



 ## PSYCHOTHERAPY
 
**Team Need:**
Our team is concerned about graduating psychotherapy patients according to Psychotherapy (Psy) and Evidence-Based Psychotherapy (EBPsy) templates. We want to ensure patients complete a full course of therapy but also experiment to see what strategies the team can test to reduce the median engagement and free up appointment space.

*Complexity and Feedback Loops*
- Balancing Existing and New Patients (Balancing Loop)
- Engagement After 3 Months 

**System Story:**
The psychotherapy module shows how team psychotherapy decisions interact, and depicts patterns of psychotherapy engagement in your team. You can explore solutions to the challenges of getting patients to complete a full course of therapy, while also achieving goals to start enough new patients in psychotherapy. Insights about these dynamics can be used to increase the local reach of evidence-based psychotherapies.

**Base Case - Session 7:**

  + Q -  What would happen over the next two years if we made no new decisions in our team? How many patients are current receiving an evidence-based dose of PSY by our team?  Is there a way to increase the number of PSY patients who complete and graduate without compromising new patient wait times?
  
  + H - We expect that we will continue to see fewer Psy and EBPsy patients than we want because we aren't graduating our psychotherapy patients. We hypothesis that the number of patients receiving an evidence-based dose of PSY is currently low,  taking into consideration that Completers who Graduate is about 4% and that Initiators who Complete is just 37%.
  
  + F - Based on the Sankey diagram, we understand that out of N=371 patients who have one PSY visit, n=289 are Initiators. Of these, only n=107 are Completers, and of Completers, on n=4 graduate after having an evidence-based dose of PSY (about 8 sessions).
  
  + D - We can do much better. We can start by trying to increase the percentage of Completers who graduate, from 3.77% to as high as 75%.

**Experiment 1 - Session 8:**
  + Q - What if we graduate more patients who complete 8 or more psychotherapy sessions in their first 3 months? What is the effect of working to increase the proportion of patients who 'complete' an evidence-based dose of PSY and then graduate from just 4% to 75%, over time, on (1) the number of patients who complete and are then 'done'? and (2) on the supply of available appts for new patients?
  
  + H - We expect that if we increase our completers who graduate to 75%, then we'll free up more slots in the clinic for more patients to start psychoterhapy/EBPsy. We hypothesize that an increasing the complete and graduate rate from 4% to 75% will results in a jump from about 4 patients to about 75 patients graduating during the same time period. We also expect that by increasing the graduation rate for any one who has received 8 or more sessions of PSY, we will increase the number of appt slots for new patients starting PSY.
  
  + F - We found that the total number of patients served by the team increased from N=371 to N=460. Of the 460, n=358 were Initiators and n=132 were Completers. Among Completers, n=99 graduated and were done (75%, as we expected). Regarding the starting rate for new patients, it increased from about 3.8 pts/wk to about 4.8 pts/wk. our hypotheses was supported. This dramatically increases the number of patients in PSY who are receiving an evidence base dose of therapy and supports the team in taking on more new patients, about one more new pt/wk (or 4 new ones per month, or 48 new ones annually!)
  
  + D - For our next experiment, since we have now affirmed that we have additional appt capacity for new (and existing patients), we would like to explore how changing Initiators who Complete from the base case rate of 37% to 75% might impact the number of patients who complete and graduate. This will be the only change we make, so that we can see the effect clearly.
  
**Experiment 2 - Session 9:STOPPED HERE DWL** 
  + Q - For experiment 2, we will try to step more patients down out of psychotherapy/EBPsy who are engaged for greater than 3 months.
  + H - We expect that if we reduce the median engagement >3 months to 12 visits (meaning a 75% reduction), then it will free up "a lot of appointment space
  + F - Against the base case - Our starting rate increased from ~3 ppw to 7 ppw. - We went from having ~4 apw  to ~8 apw .
  + D - We decided to run a third experiment on your own in your individual world. So that next time we are prepared to think through new decisions we might make in our team.

**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 
  + Q
  + H
  + F
  + D

 ## AGGREGATE (mix of services)
 
**Team Need:**

Our team is going to be losing two staff members in the near future. Since the aggregate module shows the interactions between all services offered by our team, we want to use this module to explore how we can best allocate appointments across services with reduced staffing levels. We also want to know what will happen to patient wait times if we change patient return-to-clinic visit intervals (RVI) and/or if the remaining staff members decide to work overtime or not. 

**System Story:**

*Complexity and Feedback Loops*
- Supply Affects Patient Services
- Effects of Overtime
  + Fatigue Increases Clinic Cancellations (Reinforcing Loop)
  + Overtime Relieves Work Pressure Slowly (Balancing Loop)
  + Overtime Relieves Work Pressure Quickly (Balancing Loop)
  + Burnout Increases Clinician Questions (Balancing Loop)
- Return-to-clinic Visit Interval (RVI) and Wait Times 
  + Appointment Backlog Extends Return Visit Interval (Balancing Loop)
  
*Sensitivity Tests* 
  + Sensitivity of Overtime to Work Pressure 
  + Sensitivity of Scheduled Return Visit Interval to Work Pressure 
  + Sensitivity of Intake Evaluation Rate to Wait Times
  + Sensitivity of Patient's Engagement Time to Provider Fatigue
  + Sensitivity of Staff Burnout Due to Long-Term Overtime
  + Sensitivity of Staff Missed Appointments Due to Short-Term Overtime
  + Sensitivity of Treatment Decisions to Existing Patient Care Delays

**Base Case - Session 7:**

  + Q - What would happen if we made no new decisions in our team?
  + H - That patients will continue accumulate waiting for care.
  + F - Run an experiment that accounts for the loss of two providers.
  + D - We saw oscillating system behavior.
    
**Experiment 1 - Session 8:**

  + Q - What happens if we lose two providers AND then reduce how we make patient triage decisions -- to send half as many people to PSY and CC as we did before the hours for those services were also cut in half?
  + H - We expect that wait times will not go up as much, as we have cut demand for those services.
  + F - Decision is for people to experiment with sensitivity sliders on own and follow up.
  + D - We found RVI for PSY stretched way out to several weeks between visits and work pressure increased really quickly then came back down. Saw far less pts in PSY over next 2 years. 
    
**Experiment 2 - Session 9:** 

  + Q - If we lose two MHTC/psychotherapists, what is the impact on medication management?
  + H - We are increasing the proportion of our services for med management by 25% and increasing telephone services by 25%. This is likely increasing work pressure. This it will increase no-shows and wait times for med management. (Sensitivity of Patient's Engagement Time to Provider Fatigue, Sensitivity of Scheduled Return Visit Interval to Work Pressure, Sensitivity of Overtime to Work Pressure)
  + F - Patients waiting to start oscillates. Work pressure spikes in about 3 months.
  + D - Continue to review additional findings.
   
**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 
  + Q
  + H
  + F
  + D

 ## MEASUREMENT-BASED STEPPED CARE FOR SUICIDE PREVENTION
 
**Team Need:**

The measurement based stepped care for suicide prevention module shows the effects of measurement based stepped care on patients' symptoms and risk. It allows you to explore the impacts of implementing measurement based care to reduce delays in detecting patients at high risk for suicide, and to improve the quality of care by making better team decisions about when to step patients up to a higher level of care, or step them down to a lower level of care. It is also possible to experiment with team decisions related to new patient wait-times and access, the use of community care, and the impacts of provider overwork and burnout on the quality of care.

**System Story:**

**Base Case - Session 7:**

  + Q - What if we made no new decisions in our team?
  + H
  + F
  + D
    
**Experiment 1 - Session 8:**

  + Q - What if we implemented measurement based care in our team?
  + H
  + F
  + D
    
**Experiment 2 - Session 9:** 

  + Q - What if we implemented stepped care in our clinic?
  + H
  + F
  + D
    
**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 
  + Q - What if we implemented both measurement based care and and stepped care?
  + H
  + F
  + D
