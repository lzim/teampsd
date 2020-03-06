---
title: "Module Detailed Examples for Facilitator Scripts"
author: "Team PSD"
date: "March 2020"
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

**Systems Story:**
- *Complexity and Feedback Loops*
  - Balancing Existing and New Patients (Balancing Loop)
  - Overbooking Affects No Shows
  - Wait Time Affects Referrals (Balancing Loop) 
- *Sensitivity Tests* 
  - Sensitivity of Missed Appointments to Task Time
  - Sensitivity of Referals to Wait Time

**Systems Story Script:**

- *Complexity and Feedback Loops*

**Balancing Existing and New Patients**

 + Let's reveal the "Balancing Patients" detail in the CC model diagram. The reveal shows key factors that affect how we balance providing quality care to existing patients with getting new patients into care in a timely manner.  

 + You probably recognize from clinical experience that this is a balancing act - there are trade-offs you have to make:  
   ++ You have a given number of appointments slots available, and these appointments can go either to new or existing patients.    
   
   ++ The more slots that go to new patients, the fewer can go to existing patients, and vice versa.  
   
   ++ The "B" with a circle arrow around it on the diagram symbolizes a balancing loop - the balance of managing existing and new patients.  
   
 + For this activity of telling a systems story, we pick a variable and trace it all the way around until you are back where you started - so you close the feedback loop, in this case a balancing loop.  
   
   ++ On the model diagram, you see plus and minus signs next to the blue lines. (*Use Thumbs to demonstrate concept*).  
   
   ++ If there is a plus sign between two variables, this means they move in the same direction (thumbs up - both up or increasing or both down or decreasing). If there is a minus sign, the two variables move in opposite directions (1 thumb up, 1 thumb down). 

 + Let's walk through a systems story in Care Coordination. Our team is concerned about the rate at which we are able to start new patients in CC.  
 
 + When you open up slots for new patients -- shown by the green box labeled *Additional Appointment Supply for New CC Patients* -- and follow the arrow down and to the left from the green box you see that means an INCREASE in the *Starting Rate* for new patients. Because the arrow leading from *Appointment Supply for New CC Patients* to *Starting Rate* ends has a plus sign you know if new patient appointment supply goes up, the starting rate goes up.

 + Continuing from the *Starting Rate* to the *Booking Rate* (remember, "starting" is what _patients_ do; "booking" is an _appointments_ action), we see that if the *Starting Rate* is going up, then so is the Rate of Booking appointments, which means appointments are created so there are more *Appointments in CC.* And, that means there are more *Appointments for Existing Patients*. (Once a patient starts, they instantly become an existing patient.)

 + But now notice that an INCREASE in *Appointments for Existing Patients* means a DECREASE in the *Appointment Supply for New Patients*. You can tell this is the relationship because there is a minus sign next to the blue arrow leading from *Appointments for Existing Patients* to the new patient appointment supply in the green box.  
 
 + This is how that balancing act shows up in a model diagram: We traced a chain of effects through the system and found that if we made an increase in one place, the cascading events circled back to decrease that first variable. This is a *feedback loop* - the change rippled all the way back to the starting place - and it's the kind of feedback we call a *balancing loop*, because it causes things to oscillate back and forth and "try" to achieve a balance around a steady state, like the temperature in your house when the thermostat is working to keep it at the temperature you set.

- There's another variable shown in red inside the loop we just looked at: Return Visit Interval. This changes the effect of using your appointment supply on new patients. If you increase the return-to-clinic interval, that is, if you increase the average time between appointments for patients in your team, that has the effect of reducing the use of Appointments for Existing Patients, keeping your Appointment Supply for New Patients from dropping so much due to the ongoing load of patients you brought into your care.  

**Overbooking Affects No Shows**
  
- Revealing the Overbooking Affects No-Shows detail adds to the story by showing what happens when Overbooking (green variable, top right) is used to make up for limited Appointment Supply (red, at right). We can add more appointments to our supply if we say we're going to work through lunch or eliminate any time we've scheduled in for tasks like writing notes, following up with patients, etc. 
- But this means less time for those tasks that we know are important for keeping both providers and patients on track, so it will ultimately lead to a higher Missed Appointment Rate (top left). As the Missed Appointment Rate goes up, the number of Missed Appointments per week (True Missed Appointment Rate) increases, which leads to an increase in the Rescheduling Rate. Over time this means more CC Appointments are needed for existing patients, delaying or 'crowding out' new CC patients who are Waiting to Start.
- The other arrow added in with this complexity reveal is the one from Completing Rate for appointments to the True Missed Appointment Rate. The more Appointments are Completed in CC each week, the more are missed, if you assume a fixed Percentage of Appointments Missed. But more Missed Appointments leads to more Rescheduling, which leads back to more total Appointments in CC. And again, the need for more CC Appointments for existing patients means less room in the grid for new patients.

**Wait Time Affects Referrals (Balancing Loop)**
  
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

**Systems Story:**
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
  + Q - How could we serve more patients with specific conditions, like OUD, with our existing staffing levels?  
  + H - We think we can increase our new patient start rate from less than one per week to about 5 per week for OUD if we allocate 50% of our x-waiver providers' appointments to OUD. We're going to "take" the extra percentage of the time for OUD appointments from their allocation to *Other* diagnoses, so we'll probably see a drop in patients seen for *Other* diagnoses.  
  + F - We found that if we allocate 50% of our x-waiver provider appointments to OUD, in the long run instead of only starting ½ patient per week (1 every other week), we can start 3 patients in OUD per week. But dropping the appointment supply for our *Other* patients meant we could not start any of them in care for a while until some existing patients completed and moved on. A backlog built up, which caused referrals to slow. When we were eventually able to start *Other* patients, the backlog dropped so referrals picked up again, and we established a new steady state with about 15 *Other* diagnosis patients waiting to start and about 170 in care.  
  + D - Although we were glad to see that we could care for more OUD patients with our available staffing, we are concerned that if all we do is shift several of our Other appointments to OUD, we won't be able to help as many Other patients. We decided to experiment with Return to Clinic Visit Intervals as a possible alternate solution.

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

**Systems Story:**
The psychotherapy module shows how team psychotherapy decisions interact, and depicts patterns of psychotherapy engagement in your team. You can explore solutions to the challenges of getting patients to complete a full course of therapy, while also achieving goals to start enough new patients in psychotherapy. Insights about these dynamics can be used to increase the local reach of evidence-based psychotherapies.

**Base Case - Session 7:**

  + Q - How do we increase the number of psychotherapy patients who complete a full course of psychotherapy without decreasing the starting rate for new patients in psychotherapy?
  
  + H - We expect that we will continue to see fewer Psy and EBPsy patients than we want because we aren't graduating our psychotherapy patients. We hypothesis that the number of patients receiving an evidence-based dose of PSY is currently low,  taking into consideration that Completers who Graduate is about 4% and that Initiators who Complete is just 37%.
  
  + F - Based on the Sankey diagram, we understand that out of N=371 patients who have one PSY visit, n=289 are Initiators. Of these, only n=107 are Completers, and of Completers, on n=4 graduate after having an evidence-based dose of PSY (about 8 sessions).
  
  + D - We can do much better. We can start by trying to increase the percentage of Completers who graduate, from 3.77% to as high as 75%.

**Experiment 1 - Session 8:**
  + Q - What if we graduate more patients who complete 8 or more psychotherapy sessions in their first 3 months? What is the effect of working to increase the proportion of patients who 'complete' an evidence-based dose of PSY and then graduate from just 4% to 75%, over time, on (1) the number of patients who complete and are then 'done'? and (2) on the supply of available appts for new patients?
  
  + H - We expect that if we increase our completers who graduate to 75%, then we'll free up more slots in the clinic for more patients to start psychoterhapy/EBPsy. We hypothesize that an increasing the complete and graduate rate from 4% to 75% will results in a jump from about 4 patients to about 75 patients graduating during the same time period. We also expect that by increasing the graduation rate for any one who has received 8 or more sessions of PSY, we will increase the number of appt slots for new patients starting PSY.
  
  + F - We found that the total number of patients served by the team increased from N=371 to N=460. Of the 460, n=358 were Initiators and n=132 were Completers. Among Completers, n=99 graduated and were done (75%, as we expected). Regarding the starting rate for new patients, it increased from about 3.8 pts/wk to about 4.8 pts/wk. our hypotheses was supported. This dramatically increases the number of patients in PSY who are receiving an evidence base dose of therapy and supports the team in taking on more new patients, about one more new pt/wk (or 4 new ones per month, or 48 new ones annually!)
  
  + D - For our next experiment, since we have now affirmed that we have additional appt capacity for new (and existing patients), we would like to explore how changing Initiators who Complete from the base case rate of 37% to 75% might impact the number of patients who complete and graduate. This will be the only change we make, so that we can see the effect clearly.
  
**Experiment 2 - Session 9:** 
  + Q - For experiment 2, we ask: What is the effect of increasing the number of Initiators who Complete from the base case rate of 37% to 75% on the number of patients who complete and graduate?
  
  + H - We hypothesis that increasing the number of Initiators who Complete from the base case rate of 37% to 75% will have a moderate increase in the number of patients who complete and graduate compared to the base case.
  
  + F - Against the base case, we found that the total number of patients served by the team stayed the same (N=371). Of the 371, n=249 were Initiators and n=187 were Completers. Among Completers, n=7 graduated and were done. Regarding the starting rate for new patients, it decreased compared to our base case and our Exp 1.
  
  + D - We decided to run a third experiment. We will look to see if we can combine the effects of graduating 75% of all completers AND increasing Initiators who Complete. We need the appt supply that becomes available by keeping to a higher graduation rate of completers to accommodate the higher number of Initiators who are transitioned to Completers!

**Experiment 3 - Session 10 - Combine experiments 1 and 2:** 
   
  + Q - What is the effect of combining the effects of graduating 75% of all completers AND increasing Initiators who Complete to 75% on the number of patients who receive an EB dose of PSY?
  
+ H - We hypothesis that the combined effects of increasing the number of Initiators who Complete from the base case rate of 37% to 75% with an increase in helping the number of Completers to graduate will have a robust effect on the number of patients who complete and graduate compared to the base case. We expect to see that more than 99 patients are Completers who are done.

+ F - We found that there was an increase in the number of patients being served (from N=371 BC and N=460 EXP1) to N=480! We also found that we have an increase in Initiators, as expected (n=373) and in Completers, as expected (n=280). We saw a robust number of patients over the BC (n=4)  in persons who completed and graduated (n=70). This was decreased from n=90, when we only changed the % of completers who graduated, but not Initiators. However, with the combined decisions, we enjoyed a higher starting rate and a higher initiation rate after one year, and the we saw an improved graduation rate over the BC from the start of the run.

 + D - We think that working to support a 75% rate of Initiators who  complete 8 sessions of PSY in 3 months combined with efforts to support a 75% graduation rate of patients who complete 8 sessions of PSY is a clinically valuable and viable strategy. It increases supply of appts for new patients while increasing the number of patients who get an evidence-based dose of PSY.

 ## AGGREGATE (mix of services)
 
**Team Need:**

Our team is going to be losing two staff members in the near future. Since the aggregate module shows the interactions between all services offered by our team, we want to use this module to explore how we can best allocate appointments across services with reduced staffing levels. We also want to know what will happen to patient wait times if we change patient return-to-clinic visit intervals (RVI) and/or if the remaining staff members decide to work overtime or not. 

**Systems Story:**

This module shows the interactions between all services offered by your team. It allows you to explore the impacts of how you allocate time across services and change within team referrals after patient review. It is also possible to experiment with your team's willingness to use overtime as a solution to a large backlog of appointments, and how sensitive your team's morale, quality of care provided and burnout are to working long hours.

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

 Q - We expect that our team is going to be losing two staff members in the near future. To better understand how to manage this situation, we ask how well we are managing our current patient needs, prior to losing these two staff, across services.
 
 H - Based on our current team data, we expect to see that most of our patients are receiving MM, as they have, by far, the longest engagement time (115 weeks median) and they count for more than 20% of services.  Other large numbers of patient are receiving PSY (23% of our service mix and 54 weeks engagement time.
 
 F - Using the compare services features, our hypothesis is supported. Our baseline shows that we have more than 1000 MM patients in service, followed by PSY (about 300 patients), CC (about 260 patients), followed by ADJ (about 175 patients). Interestingly, patients receiving group services drops to about 100 patients at about 1.5 years into the simulation run.

  D - We should look to reduce the median engagement time for MM and PSY, as patients are receiving treatment time that is longer than recommended for PSY and the return interval time is too long (17weeks), and many of these patients are also receiving MM, we expect.  We would like to see an engagement time of about 12 to 14 weeks for PSY, which would represent receiving about 1 visit very week for about a quarter, or about 8 to 10 sessions. MM may need to be longer, but appts for MM are less frequent.

Experiment 1 

  Q - To try to manage patient needs for PSY when we lose staff, what would happen if we changed the PSY RVI to 2 weeks and for EB PSY to just 1 week  (from 17 weeks)?

  H – We expect to see the number of PSY patients in service to drop substantially within the first year, and then to reach a new equilibrium level that is well below 300. If it were down to 150 patients, then we may be able to hand the staff reduction.

  F – Our hypothesis was supported! We see that implementing a much short RVI for PSY patients show a steady reduction in the number of PSY in service, from more than 300 in our basecase to about less than a 100 after two years of simulation. Booking rates for PSY climb initially, but then drop off and level out just a bit higher than baseline! MM patients in service also drops, but only marginally, from about 1000 to 900.

  D – Now that we have reduced the RVI for PSY and EB PSY, we can look to see what the gains in managing our patients may be achieved by rebalancing our service mix. We would like to see what happens if we invest in doing more EB PSY and less PSY, but keeping the proportion of other services more or less as before. 

Experiment 2

  Q – We expect that our team is going to be losing two staff members in the near future. To better understand how to manage this situation, we ask how well we are managing our current patient needs, prior to losing these two staff, across services.

  H – Rebalancing the mix of patient services will provide additional capacity to serve patients, allowing the team to absorb the loss to two staff. We hypothesis that increasing the proportion of EB PSY to 20% and reducing PSY to just 5%, and then putting GROUP services at 15% and CC, MM, and ADJ all at 20%, would be appropriate for the team.

  F – We found that our team seems rebalancing, keeping a tight RVI of just 1 to 2 weeks for PSY and EB PSY, further added capacity to manage our AGG service mix. All categories of patients in service ebbed downward over time.

  D – We will explore sensitivity to work pressure in our next experiment, but keep our new service mix and our improved RVI for PSY and EB PSY.

Experiment 3 (combined)

  Q – For our last experiment, what would happen if we allowed increase in sensitivity to  work pressure, such that the team would be willing to work more hours than usual to make up backlogs of patients waiting to start services.

  H – Given that we will lose two staff, the team is willing to do so over time, if need be. Our rebalancing of services and our commitment to reduce the RVI for PSY and EB PSY to between 1 and 2 weeks, combined with a willingness to provide a moderate about of additional over time hours will resolve any backlogs of patients waiting to start services. 

  F – Our hypothesis is supported! We see similar patterns as before, but the willingness to work a bit more over time improves all metrics, from patient start times to patient rescheduing, to actual hours available for service!

  D – We will agree to work a moderate amount of overtime, but also to rebalance our service mix in favor of conducting more EB PSY, while not changing the proportion of any services so much that we are not meeting overall demand for CC, MM, ADJ or GROUP.

 ## MEASUREMENT-BASED STEPPED CARE FOR SUICIDE PREVENTION
 
**Team Need:**

The measurement based stepped care for suicide prevention module shows the effects of measurement based stepped care on patients' symptoms and risk. It allows you to explore the impacts of implementing measurement based care to reduce delays in detecting patients at high risk for suicide, and to improve the quality of care by making better team decisions about when to step patients up to a higher level of care, or step them down to a lower level of care. It is also possible to experiment with team decisions related to new patient wait-times and access, the use of community care, and the impacts of provider overwork and burnout on the quality of care.

**Systems Story:**

**Base Case - Session 7:**
  + Q - What if we made no new decisions in our team?
  + H – If we make no new decisions, then we expect to see no changes in care quality, performance, or wait times in all three settings – all the current historical averages for patients in care, step down rates, etc. will hold for the next two years.  
  + F – Since the teams in the simulation experience no external shocks, the historical rates all continue for the next two years.
  + D – We should try implementing measurement-based care, and see what the positive and unexpected impacts will be.

**Experiment 1 - Session 8:**
  + Q - What if we implemented measurement-based care in our team?
  + H – If we implement measurement based care in our GMH team, then care quality will improve (specifically through reductions in Time to Improve and Time to UnFlag, and an increase in the Time to Ending).  Also, how long it takes clinicians to see changes in their patients will also improve (seen in a reduction in Time to Detect).  We expect to be able to effectively diagnose and treat patients faster, reducing the number of high-symptom patients in care, and thus reducing the number of patients who receive high risk flags.  
However, low symptom patients are in care for longer than before, reducing the number of openings for new patients.  These patients will make up more and more of our total – as there will be both more flowing in (due to higher Improvement Rate) and fewer flowing out (due to the lower Ending Rate). With fewer openings, wait times to start with our team should increase. 
  + F – As predicted, we see a dramatic shift in patient from “high symptom” to “low symptom,” as both detection and care quality improve – the ratio of high to low symptom patients drops from 0.6:1 to 0.2:1 over two years.  The number of patients with a suicide flag decreases by more than 50%, as more high symptom patients have their symptoms addressed before they can be flagged in the first place.  However, the initial predicted reduction in Ending Rate is off-set by long-term increases in the Recommend Step Down Rate, thus not permanently impacting the new patient start rate.  Both new patient starts and wait times in our clinic increase in the short-term, but fall below our historical average by 3 months, and continue to fall for the next year.  
    However, because there have been no changes in Primary Care, wait times for stepping down to PC go up substantially – from 22 to 38 weeks. 
  + D – In this experiment, we see a strong connection between changes made in our team and wait times for downstream teams.  We should run an experiment that explores these connections and gauge the impacts of implementing stepped care between GMH and PC/PCMHI.

**Experiment 2 - Session 9:**
  + Q - What if we implemented stepped care between our clinic and PC/PCMHI?
  + H – With this change, clinicians in both settings will be more likely to step their patients between the two settings, as all the confusion and negotiation needed to step a patient between these settings will have been removed – now, if a GMH patient is low symptom, then they will spend less time in GMH before their provider recommends stepping down to PC, and for high symptom patients in PC, they will spend less time there before clinicians there recommend stepping up to GMH. 
    We expect this smoother flow between the two settings to decrease the number of patients waiting to step between the two settings. For PC, they will be able to step more high symptom patients up to the right level of care sooner, so the number of patients in PC with a high risk flag will start to decline. For GMH, we will be able to step more low-symptom patients down to PC, creating more openings, and thus increase our access.
  + F – Start rates in GMH and PC increase (from 12 to 16 pts/week, then settling at 13; and ~6.5 to 8 pts/wk, settling at 7.5, respectively).  Primary Care is able to reduce both the number of high-symptom patients in their care, and the number of patients with a high risk flag.  Even with the increase in the Recommend Step Up Rate, wait time before actually stepping up to GMH falls.  
    However, the unintended consequence of implementing stepped care, this is not the case for patients trying to step down from GMH: as more patients are recommended to step down to PC, the actual start rate in PC does not increase enough to accommodate all these new patients.  Why? Even though the effect on flow between the two settings was the same (ie, Time to Recommend was cut in both settings by 50%), the size of the two settings is not– GMH can maintain over 500 patients in treatment, while PC can only maintain 300.  Implementing Stepped Care between these two settings with a substantial size difference will mean more patients trying to flow from GMH to PC than from PC to GMH.  Thus, the resulting wait time to step down from GMH to PC practically doubles over the next two years.  Also, the ratio of high symptom patients to low in GMH slightly increases, as it is easier to step low symptom patients down to PC than before.
    Not all wait times for starting PC have increased, though.  Both new patients and patients stepping down from Specialty Mental Health see their wait times reduced (new patients to near zero!).  This suggests that PC has options, and can re-allocate their openings to better balance incoming patients’ needs.  Reallocating their openings can’t fix everything, as the inflows from new and SMH are only 1/5 (each) as large as the inflow from GMH.  
    There is one silver lining: because the total number of patients in GMH has decreased (as more GMH patients leave to try to start in PC than PC patients start in GMH), the stress on our GMH team decreases and care quality increases.  We see a ~10% decrease in the number of GMH patients with a high risk flag. 
  + D – We have increased transitions without increasing quality.  Next, let’s conduct a combined experiment, where we implement both measurement-based care and streamline stepping between GMH and PC/PCMHI.
  
**Experiment 3 - Session 10 - Combine experiments 1 and 2:**
  + Q - What happens if we implemented both measurement based care and stepped care?
  + H –When we increased care quality and symptom detection (via measurement-based care), we saw patient outcomes improved dramatically, but at the cost of higher wait times for GMH patients stepping down to PC.  When we streamlined transitions between settings (via implementing stepped care), we saw higher start rates, but also higher wait times for patients stepping down from GMH to PC and a higher ratio of high to low symptom patients in GMH.
    Combining these experiments should lead to even more benefits to our patients: better outcomes, fewer patients with high risk flags, higher start rates.  However, we believe we will also see even higher wait times into PC from GMH. 
  + F – All predictions confirmed: we see a greater drop in the number of patients with a high risk flag, fewer high symptom patients in both PC and GMH (for GMH, almost completely counter-acting the increases coming from stepped care), and higher start rates.  The number of patients in GMH is slightly, but significantly, lower than the historical average, reducing stress and increasing care quality.
Wait times for most patients fall the same or more than in either previous experiments, except for patients stepping down from GMH to PC, where the wait time has increased to the highest of all our experiments - 60 weeks!  Increasing quality in GMH and reducing the delays on stepping patients down to PC puts additional pressure on PC to see more MH patients – pressure that they can’t seem to accommodate.  
+ D – For either of these efforts to be truly successful, Primary Care needs to expand their capacity to see mental health patients.  We will take these findings to our chief, to show how our two settings are connected, and that our well-intended actions to improve care or remove barriers between our settings could have a detrimental effect on mental health access in PC.  We will propose a series of trainings to PC staff to increase their comfort taking on MH patients, and thus increase their capacity.  We will conduct more experiments to try to estimate the size of the capacity increase necessary to prevent an increase in wait time.

