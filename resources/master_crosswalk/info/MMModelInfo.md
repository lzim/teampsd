---
title: "MMModelInfo"
author: "Team PSD"
date: "November 2018"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---


| Variable name | iText |
|--------------:|:------| 
| Appointment Supply (75th Percentile)                                 | The weekly number of medication management appointments available with this team, calculated from the team's data on the number of medication management visits completed in each week with the team. (appt/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Appointment Slots % (with X waiver)                                  | The proportion of the team's total appointment slots where the provider has a DEA X waiver and thus can provide evidence-based pharmacotherapy for OUD, calculated from the team's data. An X waivered clinician may also provide other treatments in these slots. (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Median Engagement                                                    | The median number of weeks that patients stay engaged with the team, receiving medication management visits, calculated from the team's data. These visits can be with any member of the team.  This engagement time represents a patient's entire engagement in medication management across treatment episodes, regardless of small gaps in service and missed appointments. (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Return Visit Interval (median)                                       | The median return-to-clinic visit interval for medication management visits with this team, calculated from the team's data on the number of visits per patient over their entire engagement time. (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| True Missed Appointment %                                            | The proportion of medication management appointments with this team that no-showed or were cancelled after the appointment was supposed to have happened, calculated from the team's data. (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Starting Rate (mean)                                                 | The number of new patients starting with the team per week, calculated from the team's data.  It is based on the average number of patients seen for medication management in one year who have never had a medication management visit with this team before. (pts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| New Patient Wait Time (median)                                       | The new patient wait time, calculated from the teams' data on the time between each patient's first medication management appointment being scheduled and that visit being completed with this team.  (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Slots Allocation % (with X waiver)                                   | The proportion of appointment slots allocated to each diagnosis for clinics where the provider has a DEA X waiver, calculated from the team's data. Providing evidence-based pharmacotherapy for OUD is possible in these slots, but clinicians may provide other treatments in these slots. (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Slots Allocation % (without X waiver)                                | The proportion of appointment slots allocated to each diagnosis for clinics where the provider does not have a DEA X waiver, calculated from the team's data. Providing evidence-based pharmacotherapy for OUD is not possible in these slots. (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Actual New Patient Wait Time                                         | The average wait time for new patients to start in medication management, based on the number of patients waiting and the rate at which they start service.  It is capped at 24 weeks (6 months).  (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Appointments for Existing Patients                                   | The number of appointments used by existing patients each week.  The team either satisfies all the demand from existing patients (based on appointments on the calendar and the scheduled RVI) or uses all the supply (based on the Appointment Supply), leaving no appointments available for new patients.  (appt/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Appointments in MM                                                   | The total number of medication management appointments on the calendar. (appts)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Appointments to Reschedule                                           | The number of appointments to be rescheduled. This assumes that all missed appointments are eventually rescheduled. (appts)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Booking Rate                                                         | The booking rate combines demand from both existing patients (based on appointments on the calendar and the scheduled RVI) and new patients' first appointments. (appt/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Completing Rate                                                      | Appointment completions are based on the team either satisfying all the demand from existing patients (based on appointments on the calendar and the scheduled RVI) or using all the supply (based on the Appointment Supply).  If there is more demand than supply, then not all scheduled appointments will be seen in a timely manner, and Actual RVI will increase.  This is different from a completed visit, as the appointment is still complete even if the patient no-shows.   (appt/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Ending Rate                                                          | The number of patients finishing care coordination is a function the number of patients in treatment and their median time engaged in treatment. (pts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Effect of "Other MM Tasks Time" on Missed Appointments               | When the team uses overtime, they have less time available for important, but non-patient-facing care tasks  (e.g., appointment prep, charting, follow-up, reminder calls).  The more overtime a team works, the greater this effect, and the more the missed appointment rate will increase, compared to the norm.  This effect only applies to overtime: working lower than the official work hours does not influence providers or patients to come more regularly to their appointments. (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Effect of Wait Time on Referrals                                     | When the wait time to start medication management increases above the target wait time for patients with a specific diagnosis, referring providers will be less likely to refer a new patient with that diagnosis.  This effect only applies to above-target wait times:  lower than expected new patient wait times do not increase referrals above the norm.  (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Measured versus Actual Time                                          | This represents the relative change in time available for non-patient-facing care coordination tasks (e.g., team coordination, patient reminder calls, chart review and other appointment prep) consumed by overbooking patient visits.  Additional appointments overbooked onto the schedule come directly at the expense of these tasks.  (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Patients in MM                                                       | The total number of patients in medication management.  (pts)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Referral Rate                                                        | The number of patients referred to medication management in this team each week.  This rate is estimated from the team's supply and historical new patient wait time.  (pts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Rescheduling Rate                                                    | The rescheduling rate depends on the total number of appointments to reschedule and the average time it takes to reschedule them.  (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Starting Rate                                                        | The number of patients who start each week is either, 1) based on how much of the team's total supply remains after all existing patients are seen (plus any additional appointments set aside for new patients), or 2) the team's historical new patient start rate, regardless of supply.  (pts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| True Missed Appointment Rate                                         | The number of appointments that must be re-scheduled, as either the clinician or the patient missed the appointment, calculated from the team's data.  (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Waiting to Start                                                     | The total number of patients waiting to start medication management.  (pts)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| % Appointment Slots Where Provider has X-Waiver                      | The number of the team's total appointment slots where the provider has a DEA X waiver and thus can provide evidence-based pharmacotherapy for OUD, calculated from the team's data. An X waivered clinician may also provide other treatments in these slots. (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Add Appointments for New Patients                                    | The number of additional appointments offered each week to new patients, with the assumption that the team currently has no such carve-outs. Any increase in supply for new patients comes from reducing appointments offered in other services.  (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| User-defined Appointment Supply                                      | The number of official appointments offered by the team each week.  This value replaces the value estimated from the team's data.  Any increase in supply comes from reducing appointments offered in other services. (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Overbooks                                                            | The number of additional appointments offered each week (above the official appointment supply). These additional appointments come at the expense of non-patient facing care (e.g., team coordination, reminder calls, treatment planning, etc.).  (appts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Return Visit Interval                                                | The scheduled average return to clinic visit interval, regardless of whether or not the team has enough supply for the patient demand or the effect on new patient starts. This value replaces the base case value, which is estimated from the team's data.  (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Sensitivity of Changes in Other MM Tasks Time on Missed Appointments | This controls the magnitude of the effect changes in time for non-patient-facing care tasks has on missed appointments.  A value of "zero" implies that there is no relationship between overbooks and missed appointments. A value below 1 indicates that patients are not sensitive to small changes in non-patient-facing task time; a value greater than 1 indicates that patients are very sensitive to small changes. Example: if a team is putting in 20% more hours per week than their official supply, then an exponent of "1" would indicate that the ratio of missed appointments to all appointments would also be 20% higher than before. A value of "0.5" would cause that same 20% increase in hours worked to have less of an effect (causing only a 9.5% increase in the missed appointment percentage).  A value of "2" would cause that same 20% increase to have a greater effect (raising the missed appointment percentage by 44%). |
| Sensitivity of Referrals to Wait Times                               | This controls the magnitude of the effect increases in new patient wait time (or decreases in target wait time) have on referrals, where referrals drop as wait time increases (or the target wait time decreases).  A value of "zero" implies that there is no relationship between wait time and referrals.  A value of "1" indicates that if  the new patient wait time doubles (relative to the new patient wait time goal), then referring providers will cut their care coordination referrals in half.  For the same situation, a value of "0.5" would result in less of an effect (reducing the referral rate to 71% of its original value), and a value of "1.5" would result in a greater effect (reducing the referral rate to less than 35% of its original value).                                                                                                                                                                             |
| Slots Allocation (with X waiver)                                     | The % of the team's total appointment slots allocated to each diagnosis, for clinics where the provider has a DEA X-Waiver. These values replaces the base case value, which is calculated from the team's data. Any set of percentages is possible, but they must sum to 100%.  (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Slots Allocation (without X waiver)                                  | The % of the team's total appointment slots allocated to each diagnosis, for clinics where the provider does not have a DEA X-Waiver. These values replaces the base case value, which is calculated from the team's data. Any set of percentages is possible, but they must sum to 1. For providers without X-Waivers, they should not allocate any time to OUD treatment, thus the value for the third % should always be zero.  (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Target Wait Time                                                     | The average new patient wait time acceptable to referring providers.  This replaces the value estimated from the team's data.  (wks)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| User-defined True Missed Appointments %                              | The proportion of total appointments that are missed and rescheduled (i.e., rework). This value replaces the base case value, which is estimated from the team's data. Allowing different entries for each primary diagnosis assumes that the team can target their efforts to reducing missed appointments on particular cohorts.  (pct)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Use Team Data for Starting Rate                                      | This switch controls if the number of new patient starts per week is based on either, 1) the remaining appointment supply after all existing patients are seen, or 2) team's historical new patient start rate, where "Off" = if all existing patients can be seen at the desired RVI, then only start new patients in the remaining appointment slots. "On" = start new patients based on the team's historical average rate, even if there won't be enough supply to see existing patients at the desired RVI.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| User-defined Referral Rate                                           | The number of new patient referrals to the team for care coordination each week. This  replaces the value estimated from the team's data.  (pts/wk)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |