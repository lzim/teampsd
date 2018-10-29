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
Patients are having to wait too long to start Care Coordination. We wonder if we can solve this by increasing the supply of care coordination appointments we alot to new patients; and what would happen to wait times if we increased the return visit interval for existing patients.

**System Story:**

Balancing Existing and New Patients (balancing loop)

- Revealing the "Balancing Patients" detail in the CC model diagram shows several important decisions that affect how we balance providing quality care to existing patients with getting new patients into care in a timely manner. You probably recognize from clinical experience that this is a balancing act - there are trade-offs you have to make:
- You have a given number of appointments slots available, and they can go either to new or existing patients. The more go to new patients, the fewer can go to existing patients, and vice versa.
- When you open up slots for new patients (green box), following the arrow down and to the left from the green box you see that means an increase in the Starting Rate for new patients. Continuing from the Starting Rate to the Booking Rate (remember, "starting" is what _patients_ do; "booking" is an _appointments_ action), we see that if the Starting rate is going up, then so is the Rate of Booking appointments, which means creating appointments, which means more Appointments in CC, and that means more Appointments for Existing Patients. (Once a patient starts, they instantly become an existing patient.)
- But now notice that an increase in Appointments for Existing Patients means a DECREASE in the Appointment Supply for New Patients. This is how that balancing act shows up in a model diagram: We traced a chain of effects through the system and found that if we made an increase in one place, the cascading events circled back to decrease that first variable . This is a feedback loop - the change rippled all the way back to the starting place - and it's the kind of feedback we call a balancing loop, because it causes things to oscillate back and forth and "try" to achieve a balnace around a steady state, like the temperature in your house when the thermostat is working to keep it at the temperature you set.
- There's another variable shown in red inside the loop we just looked at: Return Visit Interval. This changes the effect of using your appointment supply on new patients. If you increase the return-to-clinic interval, that is, if you increase the average time between appointments for patients in your team, that has the effect of reducing the use of Appointments for Existing Patients, keeping your Appointment Supply for New Patients from dropping so much due to the ongoing load of patients you brought into your care.  

Overbooking Affects No Shows

Wait Time Affects Referrals (balancing loop)

*Sensitivity Tests*
- Sensitivity of Missed Appointments to Task Time
- Sensitivity of Referals to Wait Time

**Base Case:**

  + Q - What happens to our new patient wait times and our number of patients in care coordination if we make no new decisions?
  + H - If we make no new decisions then patients will start accumulating in "the waiting room" for care coordination. But then it will swing back the other way, and at some point the wait time will become steady at about the level it is now. This is because of the balancing that happens between using appointments for new and existing patients. The number of patients in care coordination will stay constant.
 
  + F - Wait-time increase rapidly, but then drop back down and ultimately oscillate until it balances out in a year.
  + D - Next time we will experiment with adjusting our appointment supply to reduce wait-times for patients.
    
**Experiment 1:**
  + Q - What happens to the new patient start rate and patient wait timse when we increase the supply of care coordination appointments available?
  + H - Increasing the appointment supply will reduce wait-times and increase the new patient start rate.
  + F - Increasing the supply of Appointments Available for New Patients increases the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start, adding to total scheduled Appointments in CC
  + D - Next time we will experiment with adjusting our return-to-clinic visit interval (in weeks).
    
**Experiment 2:** 
  + Q
  + H
  + F
  + D

**Other CC Notes for Experiments 2 and 3:**

- Return-to-clinic interval: Increasing the Return Visit Interval slows the weekly Booking Rate, which decreases the number of scheduled Appointments in CC, thereby increasing CC Appointments Availablefor New Patients each week.

- Appointments set aside for new patients:  Increasing the supply of Appointments Available for New Patients increases the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start, adding to total scheduled Appointments in CC.

- Overbooking and missed appointments:  Increasing CC Overbooking serves to increase weekly True Missed Appointments, which, over time, keeps the number of scheduled Appointments in CC higher, which can delay or 'crowd out' new CC patients who are Waiting to Start.

- Wait times and referrals: Decreasing the weekly CC Referral Rate decreases the number of new CC patients Waiting to Start CC. However, new CC patients Waiting to Start CC is also a function of  the team's new CC patient Starting Rate, which is determined by current scheduled Appointments in CC and Appointments Available for New Patients. 

**Experiment 3:** 
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

**Base Case:**
  + Q - What does medication management look like in our team if we make no new decisions?
  + H - If we make no new decisions then we will reach the same proportion of our patients with medication assisted therapy for OUD.
  + F - We can see our Return-to-clinic Visit Interval (RVI) in the base case is the same for all patient needs, but we'd like to better meet more specific needs of patients who need evidence-based pharmacotherapy (EBPharm).
  + D - Next time we will experiment with increasing our referrals to OUD EBPharm.
  
**Experiment 1:**
  + Q - Can we serve 4 new patients with OUD each week? -- no  :(
  + H - If our referral rate for OUD is 2 pts per month (0.5 per week), and we allocate 40% of our x-waiver slots to OUD treatment, and 40% to Other Needs, and we change our RVI for depression to 12 weeks, and the RVI for OUD to 4 weeks (in line with our quality standards), then we will serve more OUD patients with our existing team staff, without increasing the wait time for new depression patients.
  + F - We met our goal of getting more patients into MAT for OUD! by having a more realistic referral rate, using more x-waiver provider supply, and adjusting our RVIs for depression and OUD in line with quality standards.
  + D - I am going change how I order my return to clinics for OUD and depression; allocate ~40% of my time to OUD patients; conduct a few more experiments to refine the allocation of my time to better balance trade-offs between patient needs.

**Experiment 2:** 			
  + Q - how do we best allocate our x waiver appointments to serve 4 new OUD patients per week?
  + H- If we increase our proportion of appointments with an X waiver to 10%, then it will increase the starting rate.
  + F - fears confirmed: if we increase the proportion of x-waiver slots to 10%, it does increase the starting rate for OUD MM to about 1 patient/month. But it also increased the wait times for patients with other needs.
  + D - Tradeoff is bad. Increasing referrals and reallocating appointments is not enough to serve the new OUD patients without an impact on our other patients.

**Experiment 3:** 
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

**Base Case:**
  + Q -  What would happen over the next two years if we made no new decisions in our team?
  + H - We expect that we will continue to see fewer Psy and EBPsy patients than we want because we aren't graduating our psychotherapy patients.
  + F - We were rigth 65% of our patients are in care for more than 3 months. For our next experiment we will reduce the duration of of engagement of patients after 3 months by 75%. - Sankey diagram showed that for  the median number of visits is 16 for 75% of patients."
  + D - For our next experiment we will reduce the duration of of engagement of patients after 3 months by 75%.

**Experiment 1:**
  + Q - What if we graduate more patients who complete 8 or more psychotherapy sessions in their first 3 months?
  + H - We expect that if we increase our completers who graduate  to 50% , then we'll free up more slots in the clinic for more patients to start psychoterhapy/EBPsy.
  + F - We found that we increased the start rate for psychotherapy, but not by as much as we'd hoped.
  + D - For experiment 2, we will try to step more patients down out of psychotherapy/EBPsy who are engaged for greater than 3 months.   
**Experiment 2:** 
  + Q - For experiment 2, we will try to step more patients down out of psychotherapy/EBPsy who are engaged for greater than 3 months.
  + H - We expect that if we reduce the median engagement >3 months to 12 visits (meaning a 75% reduction), then it will free up "a lot of appointment space
  + F - Against the base case - Our starting rate increased from ~3 ppw to 7 ppw. - We went from having ~4 apw  to ~8 apw .
  + D - We decided to run a third experiment on your own in your individual world. So that next time we are prepared to think through new decisions we might make in our team.

**Experiment 3:** 
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

**Base Case:**

  + Q - What would happen if we made no new decisions in our team?
  + H - That patients will continue accumulate waiting for care.
  + F - Run an experiment that accounts for the loss of two providers.
  + D - We saw oscillating system behavior.
    
**Experiment 1:**

  + Q - What happens if we lose two providers AND then reduce how we make patient triage decisions -- to send half as many people to PSY and CC as we did before the hours for those services were also cut in half?
  + H - We expect that wait times will not go up as much, as we have cut demand for those services.
  + F - Decision is for people to experiment with sensitivity sliders on own and follow up.
  + D - We found RVI for PSY stretched way out to several weeks between visits and work pressure increased really quickly then came back down. Saw far less pts in PSY over next 2 years. 
    
**Experiment 2:** 

  + Q - If we lose two MHTC/psychotherapists, what is the impact on medication management?
  + H - We are increasing the proportion of our services for med management by 25% and increasing telephone services by 25%. This is likely increasing work pressure. This it will increase no-shows and wait times for med management. (Sensitivity of Patient's Engagement Time to Provider Fatigue, Sensitivity of Scheduled Return Visit Interval to Work Pressure, Sensitivity of Overtime to Work Pressure)
  + F - Patients waiting to start oscillates. Work pressure spikes in about 3 months.
  + D - Continue to review additional findings.
   
**Experiment 3:** 
  + Q
  + H
  + F
  + D

 ## MEASUREMENT-BASED STEPPED CARE FOR SUICIDE PREVENTION
 
**Team Need:**

The measurement based stepped care for suicide prevention module shows the effects of measurement based stepped care on patients' symptoms and risk. It allows you to explore the impacts of implementing measurement based care to reduce delays in detecting patients at high risk for suicide, and to improve the quality of care by making better team decisions about when to step patients up to a higher level of care, or step them down to a lower level of care. It is also possible to experiment with team decisions related to new patient wait-times and access, the use of community care, and the impacts of provider overwork and burnout on the quality of care.

**System Story:**

**Base Case:**
  + Q - What would happen if we made no new decisions in our team?
  + H
  + F
  + D
    
**Experiment 1:**
  + Q
  + H
  + F
  + D
    
**Experiment 2:** 
  + Q
  + H
  + F
  + D
    
**Experiment 3:** 
  + Q
  + H
  + F
  + D
