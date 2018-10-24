---
title: "Model Details for SAY Scripts"
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


# *Modeling to Learn* - Model Details for Facilitator Say Scripts

## Care Coordination 
- **Team Need:**
The care coordination module shows how a variety of team decisions interact to impact multiple outcomes at the same time. You can explore trade-offs between decisions such as desired new patient wait times, current patient return visit intervals, and overbooking and how they affect team outcomes like total missed appointments, number of patients in care, and number of patients completing care.

- **System Story:**
*Complexity and Feedback Loops*
- Balancing Existing and New Patients (Balancing Loop)
- Overbooking Affects No Shows
- Wait Time Affects Referrals (Balancing Loop) 
*Sensitivity Tests* 
- Sensitivity of Missed Appointments to Task Time
- Sensitivity of Referals to Wait Time

- **Base Case:**
  + Q - What does care coordination look like in our team if we make no new decisions?
  + H - If we make no new decisions then patients will accumulate waiting for care coordination.
  + F - Wait-time increase rapidly, but then drop back down and ultimately oscillate until it balances out in a year.
  + D - Next time we will experiment with adjusting our appointment supply to reduce wait-times for patients.
    
- **Experiment 1:**
  + Q - What happens to the new patient start rate and patient wait timse when we increase the supply of care coordination appointments available?
  + H - Increasing the appointment supply will reduce wait-times and increase the new patient start rate.
  + F - Increasing the supply of Appointments Available for New Patients increases the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start, adding to total scheduled Appointments in CC
  + D - Next time we will experiment with adjusting our return-to-clinic visit interval (in weeks).
    
- **Experiment 2:** 
  + Q
  + H
  + F
  + D

**Other CC Notes for Experiments 2 and 3:**
- Return-to-clinic interval: Increasing the Return Visit Interval slows the weekly new patient Booking Rate, which decreases the number of scheduled Appointments in CC, thereby increasing CC Appointments Availablefor New Patients each week.

- Appointments set aside for new patients:  Increasing the supply of Appointments Available for New Patients increases the new CC patient weekly Starting Rate, which reduces new CC patients Waiting to Start, adding to total scheduled Appointments in CC.

- Overbooking and missed appointments:  Increasing CC Overbooking serves to increase weekly True Missed Appointments, which, over time, keeps the number of scheduled Appointments in CC higher, which can delay or 'crowd out' new CC patients who are Waiting to Start.

- Wait times and referrals: Decreasing the weekly CC Referral Rate decreases the number of new CC patients Waiting to Start CC. However, new CC patients Waiting to Start CC is also a function of  the team's new CC patient Starting Rate, which is determined by current scheduled Appointments in CC and Appointments Available for New Patients. 

+ Experiment 3: 
  + Q
  + H
  + F
  + D
 
 ## Medication Mangement
+ Team Need: 
+ System Story: 
  + Q - Can we serve 4 new patients with OUD each week? -- no  :(

  + H - If our referral rate for OUD is 2 pts per month (0.5 per week), and we allocate 40% of our x-waiver slots to OUD treatment, and 40% to Other Needs, and we change our RVI for depression to 12 weeks, and the RVI for OUD to 4 weeks (in line with our quality standards), then we will serve more OUD patients with our existing team staff, without increasing the wait time for new depression patients.

  + F - We met our goal of getting more patients into MAT for OUD! by having a more realistic referral rate, using more x-waiver provider supply, and adjusting our RVIs for depression and OUD in line with quality standards.

  + D - I am going change how I order my return to clinics for OUD and depression; allocate ~40% of my time to OUD patients; conduct a few more experiments to refine the allocation of my time to better balance trade-offs between patient needs.

			
  + Q - how do we best allocate our x waiver appointments to serve 4 new OUD patients per week?

H- If we increase our proportion of appointments with an X waiver to 10%, then it will increase the starting rate.

  + F -  fears confirmed: if we increase the proportion of x-waiver slots to 10%, it does increase the starting rate for OUD MM to about 1 patient/month. But it also increased the wait times for patients with other needs.

  + D - Tradeoff is bad. Increasing referrals and reallocating appointments is not enough to serve the new OUD patients without an impact on our other patients.


  + Q - If we get an increase in patients with OUD, can we serve them?

  + H - An increase in referrals of OUD patients will increase patients waiting start MM service, which will increase the starting rate.

  + F - An increase in patients with OUD, with no other changes ,  increases patients waiting to start MM.

  + D - Consider other parts of care delivery to meet new OUD patients' needs.  Cannot focus on referral rate in isolation.



 ## Psychotherapy
+ Team Need: 
+ System Story: 
+ Base Case:
  + Q -  What would happen over the next two years if we made no new decisions in our team?
  + H - We expect that we will continue to see fewer Psy and EBPsy patients than we want because we aren't graduating our psychotherapy patients.
  + F - We were rigth 65% of our patients are in care for more than 3 months. For our next experiment we will reduce the duration of of engagement of patients after 3 months by 75%. - Sankey diagram showed that for  the median number of visits is 16 for 75% of patients."
  + D - For our next experiment we will reduce the duration of of engagement of patients after 3 months by 75%.

+ Experiment 1:
  + Q - What if we graduate more patients who complete 8 or more psychotherapy sessions in their first 3 months?
  + H - We expect that if we increase our completers who graduate  to 50% , then we'll free up more slots in the clinic for more patients to start psychoterhapy/EBPsy.
  + F - We found that we increased the start rate for psychotherapy, but not by as much as we'd hoped.
  + D - For experiment 2, we will try to step more patients down out of psychotherapy/EBPsy who are engaged for greater than 3 months.   
    
+ Experiment 2: 
  + Q - For experiment 2, we will try to step more patients down out of psychotherapy/EBPsy who are engaged for greater than 3 months.
  + H - We expect that if we reduce the median engagement >3 months to 12 visits (meaning a 75% reduction), then it will free up "a lot of appointment space
  + F - Against the base case - Our starting rate increased from ~3 ppw to 7 ppw. - We went from having ~4 apw  to ~8 apw .
  + D - We decided to run a third experiment on your own in your individual world. So that next time we are prepared to think through new decisions we might make in our team.

+ Experiment 3: 
  + Q
  + H
  + F
  + D

 ## Aggregate Mix of Services
- **Team Need:**
The aggregate module shows the interactions between all services offered by your team. It allows you to explore the impacts of how you allocate time across services and change within team referrals after patient review. It is also possible to experiment with your team's willingness to use overtime as a solution to a large backlog of appointments, and how sensitive your team's morale, quality of care provided and burnout are to working long hours.

- **System Story:**
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

- **Base Case:**
  + Q - We would happen if we made no new decisions in our team?
  + H - That patients will continue accumulate waiting for care.
  + F - Run an experiment that accounts for the loss of two providers.
  + D - We saw oscillating system behavior.
    
- **Experiment 1:**
  + Q - What happens if we lose two providers AND then reduce how we make patient triage decisions -- to send half as many people to PSY and CC as we did before the hours for those services were also cut in half?
  + H - We expect that wait times will not go up as much, as we have cut demand for those services.
  + F - Decision is for people to experiment with sensitivity sliders on own and follow up.
  + D - We found RVI for PSY stretched way out to several weeks between visits and work pressure increased really quickly then came back down. Saw far less pts in PSY over next 2 years. 
    
- **Experiment 2:** 
  + Q - If we lose two MHTC/psychotherapists, what is the impact on medication management?
  + H - We are increasing the proportion of our services for med management by 25% and increasing telephone services by 25%. This is likely increasing work pressure. This it will increase no-shows and wait times for med management. (Sensitivity of Patient's Engagement Time to Provider Fatigue, Sensitivity of Scheduled Return Visit Interval to Work Pressure, Sensitivity of Overtime to Work Pressure)
  + F - Patients waiting to start oscillates. Work pressure spikes in about 3 months.
  + D - Continue to review additional findings.
   
- **Experiment 3:** 
  + Q
  + H
  + F
  + D

 ## Measurement Based Stepped Care for Suicide Prevention
+ Team Need: 
+ System Story: 
+ Base Case:
  + Q
  + H
  + F
  + D
    
+ Experiment 1:
  + Q
  + H
  + F
  + D
    
+ Experiment 2: 
  + Q
  + H
  + F
  + D
    
+ Experiment 3: 
  + Q
  + H
  + F
  + D
