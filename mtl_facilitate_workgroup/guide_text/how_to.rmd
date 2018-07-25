---
title: "MTL 'How to' Guide Information"
date: "updated 25 July 2018"
output: 
  github_document: default
  html_document: default
  ioslides_presentation: default
  slidy_presentation: default
  pdf_document: default
  word_document: default
---

<!-- MTL Logo, HTML img tag -->
<img src = "https://raw.githubusercontent.com/lzim/teampsd/teampsd_style/mtl_logo/mtl_testdontguess_sm.png"
     height = "130" width = "500">  


**Purpose:** *Modeling to Learn (MTL)** ‘How to’ guide Information  
*Style Note to italicize *Modeling to Learn* (MTL)  

**Project:**
1.	*Modeling to Learn – Live* (MTL Live)  
2.	*Modeling to Learn – Video* (MTL Video)  
3.	*Modeling to Learn – Facilitate* (MTL Facilitate)  

**Next Steps:**
1.	Fill these details in the speech balloons for visual learners in the publisher files of each Forio UI.  
2.	Fill these details in the relevant Cheatsheets, Emails, or GitHub.  
3.	Goal for Guides: fill in with small .gifs showing the major actions next to the text.  
4.	Fill in the bulleted narrative with the relevant MTL icon or .gif to the left.  
5.	Create these for each of 8 modules, so that they stand alone. So folks can start with any module.  

***Modeling to Learn* has 8 Modules**
1.	Team Vision  
2.	Team Data  
3.	Team Needs and Plan  
4.	Care Coordination (CC)  
5.	Medication Management (MM)  
6.	Psychotherapy (Psy)  
7.	Aggregate (Agg)  
8.	Measurement-based Stepped Care for Suicide Prevention - Coming fall 2018  

**MTL Components**
*Modeling to Learn* has three components: data interface, a simulation user interface and virtual facilitation.  

The data is behind the VA firewall and includes patient level reports of diagnoses services and clinical info on suicide risk and EBPs.        
**1. ADD: MTL Vision Module**  
  
**2. MTL Data Module**  
**MTL Data User-Interface**  
The ***MTL Data UI*** is designed for frontline staff to directly query the VASQL data store to get a set of data in real time tailored to their team and patients. The tool displays team trends over time for the last two years and includes several sorting and filtering functions. It also produces aggregate D identified parameter sets for modeling and simulation.  
*Style note: MTL Data UI to be distinguished from the Simulation UI on Forio  

The ***MTL Data UI*** is an online password protected platform that can be accessed at the VA from any Internet connected computer, and from a smart phone.  

**3. ADD: MTL Needs and Plan Module**  

**Simulation Modules (4-8 – 7 at present, 8th MTL Module to be added Fall 2018)**  

**MTL Simulation User-Interface**  
The ***MTL Simulation UI*** includes training and user instructions. The UI is designed for 508 compliance to make it accessible to those with hearing, vision, mobility impairment.  

There are three ***MTL Simulation UI*** roles (for the guides – there is also a Team PSD Administrator):  
Facilitator, team lead, learner. Each role has its own password protected user log-in, which provides access to different functions. The UI is powered by four then Sam DSS system dynamics simulation models and hosted on the Forio epicenter platform.  

The ***MTL Modules**** represent dynamics of care coordination med management, psychotherapy, and an aggregate team of services for experimentation.  
*Style note to refer to modules not models.  

The ***MTL Simulation UI*** has four sections call it a diagram to visually depict a system dynamic model comprised of two primary units: patience and appointments. This diagram adjusts in real time to show rates of change and levels of patients and appointments based on user inputs.  

**Stocks and Flows and Feedback**  
The diagram presents the rates using dial like a speedometer and the levels depicted like a gas tank gauge. The UI shows feedback using curved arrows that represents the direction of the relationship between two variables, with positive sign by the arrowhead depicting variables that move in the same direction, and a negative sign by the arrowhead depicting variables that move in opposite directions.  

The relationships among variables when taken together comprise causal feedback loops, which are labeled with a B for balancing loops that tend toward stability or homeostasis, and an R for reinforcing loops that contribute to exponential growth or decline in the service system depicted (care coordination, medication management, psychotherapy and aggregate).  

The majority of the loops in a clinical team are balancing, which means that they serve to keep the clinical system within a workable range, while at the same time making the team’s dynamics resistant to change, a phenomenon temed, ‘policy resistance.’ Policy resistance occurs when the dynamics of a system are such that the influence of a change to any single component is likely to be overpowered by the larger causal dynamic to return to the status quo.  

These feedback loops are hidden or revealed by the user through the second component of the UI, the experiment timeline. Experiment timeline enables learners to evaluate the impact of team decisions on the future behavior of their team’s care system Beginning with today and extending forward by three month quarters up to two years from ‘today.’ Today refers to the day of the simulation experiment.   

**Experiments**  
Learner experiments are managed via the ‘reset’ button, and the ‘run’ button in the experiment timeline. Users click ‘run’ for each new simulation, and use reset to clear their prior inputs.  
The third component of the experiment timeline, below the ‘run’ and ‘reset’ buttons is a menu of check box buttons under the heading ‘Reveal Complexity.’ For each of the four models, learners check the level of complexity that they would like to review at one time. Complexity is revealed primarily as one feedback loop at a time. Selecting a reveal from the list corresponds to the appearance of a feedback loop label, and appearance of color coded interconnected arrows in the diagram for that feedback. Arrows that share the same light or blue color are revealed together for the relevant feedback loop.  

**MTL Simulation UI**  
The ***MTL Simulation UI*** uses a consistent color scheme, and visual iconography, to depict variables for experimentation. If a variable is depicted in an icon with a slider, then it is a variable that users can manipulate in their simulation experiments. These experiment icons use three consistent colors: red to represent when the variable is derived from team data, green for variables that can be manipulated, but are not based on team data, and purple for sensitivity tests. Sensitivity tests are included when there is not a reliable, existing data source for a variable staff identified as important.   

A stack of experiment icons in the model diagram denotes variables that can take on different values for specific diagnostic cohorts. In the medication management model, this includes experimenting with values higher or lower than the calculated team data for that variable for each cohort: alcohol use disorder, depression, opioid use disorder, or other. In the aggregate model, this includes experimenting with values higher or lower than the team data for that variable for each service: Intake, psychotherapy, evidence based psychotherapy, care coordination, medication management, adjunctive services, and group psychotherapy.  

On the right-hand side of the user interface there are two tiles. At the top is the ‘Output’ tile. We will describe components of the ‘Experiments’ tile at the bottom first.   

**Experiment Tile**  
For each model, the top of the ‘experiment’ tile includes a red team data table, which includes all the variable values calculated from team data and read into the model. These red team data variables are also available below for manipulation with new user inputs. The categories of experiments available for each of the four models include variables for the ‘supply’ of appointments, the patient ‘engagement pattern,’ ‘new patients and referrals,’ and ‘sensitivity’ tests. Users can adjust the input value for each variable using the slider. The new value for that simulation experiment is depicted to the left of the slider. The variable units and value ranges are displayed below the sliders. Clicking on the ‘i’ in the upper left corner of each variable reveals more detailed variable information.

**Outputs Tile**  
The upper ‘Outputs’ tile enables zooming in to review simulated variable trends. Navigation arrows enable selection of any variable selected from the model diagram. The variable displayed in the plot is named at the bottom of the graph and the units are labeled in the upper left corner. The Y axis depicts the level of the units in the graph and the x-axis depicts the simulated system behavior, beginning with the trend one 3-month prior to today (the day of the experiment), and the simulated trend up to two years from today.   

These output tile graphs can plot three simulated scenarios for comparison. Best practices are to compare one or two alternatives against a ‘base case.’ The base case is the expected trend over the next two years if the team made no changes. The alternatives are the expected trends associated with changes the team is considering. In other words, new team decisions, which are reflected in user input values entered in the ‘experiments’ tile.  

Icons at the top of the ‘outputs’ tile provide options to see the simulated trends in a ‘table view,’ or to ‘copy’ or ‘export’ the simulation results to share with others.  

**Expanded Output Tile**  
The ‘expand’ icon at the top of the expanded output tile plays a key role in facilitating *Modeling to Learn*. Clicking on this icon opens resources for team learning and decision-making, including a four part, text entry dialogue at the top, and a ‘Results Dashboard’ at the bottom, for reviewing the ‘base case’ against two alternatives for six variables at once. The alternatives may be used to compare and contrast different experiments (all models), different patient cohorts (medication management model and psychotherapy model) and different services (aggregate model).  

The goal of the *Modeling to Learn* session is facilitating team experiential learning via experimentation. The team begins with ‘Our Question: Briefly describe what your team wants to learn from this experiment.’ Then the team enters ‘Our Hypothesis: outline the systems story your team believes will cause the outcomes you expect to observe.’ Team members are more likely to learn and remain engaged if they stake a claim about what they expect to find, which can be either confirmed or refuted with the experiment. The facilitator will encourage framing the teams’ expectation using systems thinking, which includes ‘dynamic hypotheses’ about causal feedback in that service system.  

The last two dialog boxes are, ‘Our Findings: Describe your team’s findings, insights and conclusions from this experiment.’ And, ‘Our Decisions: Based on what was learned in this experiment, what changes is the team ready to make in their practice?’ The team is encouraged to identify changes they can make, or new decision rules (i.e., heuristics or rules or thumb) they can apply in their day-to-day clinical care.  

**MTL Simulation Modules**  
**Care Coordination Module**  
The care coordination model includes three reveals, the two feedback loops, ‘balancing existing and new patients,’ and ‘ wait time affects referrals,’ and a separate selection that reveals how ‘ overbooking affects no-shows.’  

**Medication Management Module**  
The medication management model includes the same three primary reveals as the car coordination model, but also includes the option to toggle to ‘display patient cohorts.’ This option is available to help the clinical team to optimize their medication management service to the specific needs of each of four cohorts defined by their primary presenting concern: alcohol use disorder (AUD), depression (Dep), opioid use disorder (OUD), and ‘other’ diagnoses. This is an important option for working with existing local staff resources to meet evidence-based pharmacotherapy standards, which differ by diagnosis. For example, Patients who receive an opiate agonist or antagonist for opioid use disorder should be evaluated every 30 days, whereas patients receiving antidepressant medication should be evaluated every 90 days, according to the research that led to the current VA/DOD clinical practice guidelines, and the VA quality measures known as ‘SAIL’ (SAIL Stands for ‘Strategic Analytics for Improvement and Learning’).  

**Psychotherapy Module**  
The psychotherapy diagram emphasizes the dynamics of patients engagement with psychotherapy during the first 3 months of their treatment. These first three months of psychotherapy are highlighted with a light blue background and show the proportions of patients who flow from their first visit, on to in initiate psychotherapy for 2-7 visits, and on to complete psychotherapy with 8 or more visits during their first three months in this service. The learners also can review the ‘percent of patients with adequate evidenced based psychotherapy (EBP) templates’ in this highlighted section for the first three months of engagement. VA programmed these EBP templates into the electronic health record to facilitate the delivery of EBPs with fidelity to their research-based key components, and monitor the proportion of patients in psychotherapy who receive the evidence-based care.  

The ‘Reveal Complexity,’ selections in the ‘Experiment Timeline’ comprise two dynamics. The first reveals the dynamics of one balancing loop, ‘balancing existing and new patients,’ and the second reveals the dynamics of psychotherapy ‘engagement after 3 months.’  

**Aggregate Module**  
The aggregate model comprises multiple services within the team and is the most complex. This model was developed based on two instances of prior research. The first was a participatory research partnership with the VA Palo Alto Health Care System. Using a nominal group process (CITE) over approximately six months, staff used divergent and convergent thinking exercises including hexagons (in Vennix) and dot voting (in Hovmand) to narrow to priorities for a simulation that ‘... Will help groups within the VA learn the trade-offs and how to provide evidence based care to veterans.’ Four top priorities are addressed in the aggregate mode: ‘allocations of time (not enough time),’ ‘actual time (what we really do),’ ‘morale and burnout,’ and ‘staff turn over.’  

These four top priorities from our participatory research activities were refined and developed into balancing loops revealed in the aggregate model under the reveal selections, ‘Supply affects patient services,’ and ‘Effects of Overtime.’ These dynamics are based on seminal service system dynamics research by Olivia and colleagues (CITE), and include six interdependent causal feedbacks: ‘ appointment backlog extends return visit interval,’ ‘fatigue increases clinic cancellations,’ ‘overtime relieves work pressure slowly,’ ‘burn out increases clinician quits,’ and ‘fatigue increases ending early.’  

The remaining reveals in the aggregate model, include the three balancing loops revealed when ‘return visit interval (RVI) and wait times,’ is selected. These three loops are, ‘wait times affect new patient referrals,’ ‘new patient delays affect referrals,’ and ‘return visit interval (RVI) effects referrals.’ And, radio buttons to ‘display patient services’ dynamics for each of seven major categories of services in outpatient addiction and mental health. The seven service types include four.  

***Modeling to Learn - Live***
The ‘learners’ are staff teams comprised of these six disciples. The focus of the modeling simulations is the care decisions made each day by these staff. Teams are typically organized to provide services to specific patient populations, and may often be broken down into teams who serve as generalists (e.g., clinics serving a variety of outpatient needs) and specialists with a specific clinical focus (e.g., addiction, PTSD or Telehealth treatment).  

The ‘team leads’ operate as internal facilitators who coordinate sessions, navigate team technology issues and data permissions and use, and liaise with the facilitator between sessions and via a direct, back-channel chat interface during the live sessions. The position description for the team lead, includes a willingness to champion *Modeling to Learn* within the team, an ability to foster clear, and honest communication between facilitator and team, openness to learn, and willingness to encourage the team making decisions. It is helpful for the team lead to be comfortable learning to use online video conferring (e.g., Adobe Connect), and online data tools.  

Beyond the data and user-interface the primary learning resources for *Modeling to Learn* include a facilitation guide with scripts for each team session, and a learner guide that walks through the learning objectives and provides access to *Modeling to Learn* resources and tutorials.  

*Modeling to Learn Live* is delivered via twelve, live 60-minute sessions over six months (12 hours of facilitated learning). Teams are asked to substitute two team meetings per month with *Modeling to Learn*. Therefore, a major component of the learner guide is standardized, team-specific emails sent before and after each live session. These emails are tailored to team learning goals, data and decisions, but otherwise include the same content and links to resources for continuing with self-directed learning between sessions.  

It is common for a team member to miss a staff meeting. To provide an opportunity to stay current with the learning activities covered by the team, we developed a set of online video trainings, an opportunity for a staff member to obtain licensure credit for working through model insights after missing a team meeting.  

The four models and twelve 60-minute sessions of *Modeling to Learn* were developed so that teams could develop new insights within the duration of typical staff meeting. The goals was not to add activities to packed schedules but to swap out and augment usual meeting activities for a period of time. The models include several recurring or common elements, and we originally expected teams to move sequentially through the models from the simplest (care coordination) to the most complex (aggregate). However, teams reported their impatience with the process when they perceived disconnect between a ‘learning model’ and their primary learning need. Staff rejected learning about service dynamics that they perceived to be a poor fit, even when their team data showed that it may be.  

We made changes to *Modeling to Learn* based on this feedback. We changed to a modular approach in which each model stood alone and did not require any prior learning from other models. In the first three sessions, learners set ‘Our Vision’ for *Modeling to Learn* (session 1), reviewed ‘Our Data’ to assess the team’s need (session 2), and then matched this need to ‘Our Plan’ (session 3), in which the set of models to be covered are selected. Depending on team needs, teams choose either two models for four or five sessions each (9 sessions), or three models for three sessions each (9 sessions). The benefits of this approach include team tailoring, and depth of learning necessary for adopting new clinical decisions in daily team practice.  

***Modeling to Learn - Facilitate***  
*Modeling to Learn* facilitators have a dashboard for facilitating multiple teams in one virtual session. This dashboard shows the progress of each team running and comparing model simulations and moving through the four steps of team decision-making.  

There are three primary roles in the *Modeling to Learn* program, ‘facilitators,’ ‘team leads,’ and ‘learners.’ Facilitators are trained to deliver the program with fidelity to principles of feedback and systems thinking. These expert, external facilitators are also approved to lead the series of virtual (online) sessions by the accreditation bodies for six frontline addiction and mental health disciplines: psychiatry, psychology, social work, nursing, counseling and certified peer support specialists (coordinated in partnership with VA Employee Education Services).  







