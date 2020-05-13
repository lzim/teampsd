---
title: "GM – Epicenter Adminstration Group Management"
author: "jrollins"
date: "jmr 27_01_2020"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

# Epicenter Administration Group Management

## External links needed:

https://forio.com/epicenter/sign-in

## Training Assumptions:
1.  Trainees have established a username and login with Forio Epicenter.
2.  Trainees have logged in at least once and have bookmarked the login page in their browser (see External Links).
3. Trainees have successfully mastered Epicenter Administration Web Page Overview.

## Training Objectives:
Upon completion of this module, the learner will be able to:

1. Navigate to the Group directory.
2. Create, name, edit and delete Groups following the TeamPSD standard naming convention.
3. Populate a Group with End Users and assign to a world.
4. Impersonate a user and assign a Facilitator.
5. Assign users a world. Edit and assign an appropriate “Team Lead” or “Player.”
6. Assign a user to non-active status, and then reassign to active status.
7. Upload an End User.
8. Upload multiple End Users using a spreadsheet file.    

## Point of Contact: James Rollins, Praxis Analytix

## Full Instructions

1.  **Login to Epicenter and Select the Project.** When you login to Epicenter, you will be presented with the screen shown below.  Select the project, within which you want to create a group.  Proceed to the next step.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm1a.png)  

Gm1a

2.  **Navigate to the Groups directory.** The Groups directory contains a listing of all groups that can currently login to this instance of the Sim UI. Groups follow a naming convention as is described below. See Gm1 for an illustration of the web page.

Team naming convention for Epicenter groups is broken down into 4 parts below. Note that you can ask the Team Lead for this information:
1.	3-digit numeric health care system + 2 digit alphanumeric location (i.e. 640a0)
2.	3-digit alpha location code (i.e. mpd)
3.	local team name (i.e. pct)
4.	"team" for team world and "ind" for individual world

Put together, it looks like: 640a0_mpd_pct_team

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm1.png)  
Gm1

3.  **Edit a Group**
Although the Edit a Group page appears to allow editing of group information, it does not.  Only the group’s Start, and Expiration dates are truly editable, with one exception.  If the group has expired, then changing the expiration date will not work. 

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/Gm2.png) 
Gm2

4. **Add a Group**
a. Ignore Organization Name and Event name.  
b. Enter the Group name using the convention in number 1 above directly into the Group Name field. 
c. The start date will automatically show today’s date. 
d. Set the expiration date to “never.”
e. Ignore Maximum End Users and Run Limit.
f. Click “Create Group.”

 
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/Gm3.png)
Gm3

5. **Add End Users**
End Users can be loaded individually, provided they are already an End User (remember checking the End Users list on the Project Home Page?). End Users can also be loaded in bulk. When loaded in bulk, Epicenter will check to see if they are an End User, and if not, will assign them an End User account using the name, username and password contained in the master_end_user_template.xlsx. The Bulk-Add End Users will be the most common way to set up a team.

While inside an empty Group and having compiled a roster using the template:
a. Click on “Add End Users”
b. Click on “Upload Users” by the Upload Multiple End Users title.
c. Find the related file. Click “Open.”
d. If there are End Users in the Bulk Add file already listed as End Users elsewhere, you will be given an option to overwrite the existing End User file (See gm5). You should “Keep and Add to Group” to prevent overwriting the existing End User File.

 
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm4.png)
gm4

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm5a.png)
Gm5a

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm5b.png)
Gm5b

6. **Multiplayer Assignments**
When new End Users are first assigned to a Group, they only are listed in the End User Details tab.  To use the Sim UI, they must be assigned to World001.  Keep in mind there can be many worlds, but all users must be assigned to World001.  Typically, one user is considered the Team Lead, and the rest are players.  However, there is no limit on the number of Team Leads there can be. Team Leads are presented with a different Home Page when logging into the Sim UI.

a. Click on the “Multiplayer Assignments” tab. 
b. Review list to ensure all added to the group appear on the list.
c. Identify the team leaders and mouse-over the “Edit” function. 
d. The World and Role drop down menus should appear. If the first time, only World001 will be a choice. 
e. Change role to “Team Lead.”
f. Click on “Save” to preserve settings.
g. Repeat for each player.

 
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm6.png)
Gm6

7.  **Making End Users Inactive**
An End User assigned to a World can be made inactive by checking the box and clicking the “X” next to Unassign. When unassigned, the users will stay on the list, but will not have a world assignment.  Without assignment to World001, they will not be able to login to a Sim UI session with this Group.

 
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm7.png)
Gm7

8. **Making End Users Inactive**
Making End Users Inactive removes them from the Multiplayer Assignments list and to the Inactive Users list. This done by checking the checkbox next to the user’s name and then selecting the red “X” next to “Make Inactive.” _This action is not recommended, because it changes to the calculations of the team statistics in the Facilitator panel._ Unassigning users is the preferred way. 

9.  **Assigning a Facilitator**
Facilitators are assigned in the End User Details tab.  Select the “Edit” icon under the Actions column. Select the “Yes” radio button to make the selected user a Facilitator.  Note that a Facilitator cannot be assigned to any World.  Be sure to make inactive before making a Facilitator. Also, when a person is assigned as a Facilitator, they will be presented with a Facilitator Dashboard Home Page when the login to the Sim UI. 

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/7a.png)
gm7a

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/gm7b.png)
gm7b

## Quick Checklist:

_There is no checklist provided for this module._

#### Common Mistakes:

1. Admins sometimes do not carefully read the Existing End Users conflicts screen and choose to overwrite the name and password information for a current End User account. This can be remedied quickly by communicating the new password to the affected End Users.

2. Sometime End Users are assigned to a world besides World001.  If this happens, the user will not be able to login. This is remedied by assigning the user to World001.

3. Sometimes a facilitator is assigned without unassigning from the End User Assignments page. This will cause other record assignments in the End User Assignments page to “hang” because of the invalid user created by in improperly assigned facilitator.  


## Training Record:
#### Practice
###
- [ ] **Exercise 1:** You are given a task to create groups to support a new team from the Palo Alto VA healthcare system at the Menlo Park location.  The local team name is Telehealth. In the Sim UI – TEST instance, create a group to support the team instance and a group to support individual training.

Completed on: ________________ with _________________________ 

- [ ] **Exercise 2:**: You are given a list of team members shown below. Complete the following:  
1. Navigate to the Add End Users page, download and prepare a master_end_user_template.xlsx.  
2. Upload new End Users to the group you created in Exercise 1.
3. Make Richie a facilitator.
4. Assign the remaining users to World001.

New End User List

Name          	   Username       Password
Ralph Malph   	   rmalph		      Word@123
Art Fonzarelli 	   fonz		        Word@123
Jonie Mitchell	   jmitch	        Word@123
Richie Cunningham  rcunning	      Word@123		

Completed on: ________________ with _________________________  

#### Supervised Evaluation 

- [ ] **Supervised 1:** Repeat Exercise 1 and 2 above in the presence of an evaluator.
        
Completed on: ________________ with _________________________  

- [ ] **Supervised 2:** Unassign all end users in the group you just created. Delete users from the group.  Delete the group.  Navigate to the End Users page; find and delete the end users you created.
        
Completed on: ________________ with _________________________  

