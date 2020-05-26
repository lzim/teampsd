# Epicenter Administration Website Overview

## External links needed:

https://forio.com/epicenter/sign-in

## Training Assumptions:
1.  Trainees have established a username and login with Forio Epicenter.
2.  Trainees have logged in at least once and have bookmarked the login page in their browser (see External Links).

## Training Objectives:
Upon completion of this module, the learner will be able to:

1. Navigate to the Dashboard and access Members, End Users and the Team Home page.
2.  On the Team Home page, understand the DEV, TEST, PROD project organization and be able to navigate to the appropriate project instance to achieve desired task goals.
3. Once inside an instance, understand the functions of the left side navigation (i.e., Project, Model, Interface, Interface builder, Groups and Settings).
4. Delete and load files into the Model, Interface and Groups directories.
5. Navigate to the Dynamic Data folder and understand how the simulation uses the data contained inside.    

## Point of Contact: James Rollins, Praxis Analytix

## Full Instructions

1.  **Navigate to the Project Home page.** Using the link provided in the External Links section above, navigate to the Epicenter login page and login. You should be in the Dashboard landing page (see below).  Click where indicated.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/EP1.png)
Ep1

2.  **Veterans Affairs Project Home Page**
There are really only three MTL projects, each organized into a DEV, TEST and PROD instance.  These instances have specific uses and although you may have access to all, you may not interact with all of them.

DEV – This instance is for the exclusive use of the Development Team (A.K.A. “DEV”). DEV develops each sprint in this instance until they are satisfied it is ready for user testing.  When satisfied, they will promote a sprint to TEST.

TEST – This instance is for the Workgroup Leads and others to conduct user testing of the sprint. When the testing and resulting development iterations are completed, the sprint is released to PROD.

PROD – This is the Production instance that is available to the MTL Community for use.  

Left-hand Navigation – The left-hand navigation contains Team Home, Members, End Users and Settings selections.  We are mainly concerned with Members and End Users selections, which we discuss later on in training.
 
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep2.png)
Ep2

3. **Navigate to Members.**
Click “Members” on the left-hand menu. Members are people within the project organization, who are either authors or customer support.  Authors can create and delete projects, add members, change member roles and have full administrative privileges. Customer support members can perform most administrative tasks, short of project maintenance (adding, deleting, etc.). _Members are usually added or deleted at the direction of the Principal Investigator (PI) or by members of Praxis Analytix._

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep3.png)
Ep3

4. **Navigate to End Users**
Click “End Users” on the left-hand menu. All individuals who are registered to use a given group-world as a student, admin or other must have an End User account.  These accounts are identified by the person’s name and the email with which the registered. Changes to user accounts, such as name or passwords, can be made here by admins.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep4.png) 
Ep4

5. **Navigate to a Project Instance.**
Click VA Sim UI – TEST instance.  The VA Sim UI – Test page will appear. Notice these elements on the page.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep5.png)
Ep5

6.  **Navigate to the Model Directory.**
The Model directory contains all Vensim model and Team Data files. 

Delete a file – To delete a file, click the checkbox and a delete button will appear. Click the delete button.
  
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep6.png)
Ep6

Upload a file – Click the “Upload” button and select “Upload a File” from the drop down to upload a file. 

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep7.png) 
Ep7

7. **Navigate to the Interface Directory.”
The Interface directory contains information that can be changed by the user. We are mainly concerned with the DynamicData folder, as it contains user customizable files.

Click Dynamic Data – Inside this folder is the model-popup-information.xlsx file.  This file contains the Sim UI “i” information text that is used in the pop ups. When this file is updated, it must be first deleted – then replaced by an updated file.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep8.png)
Ep8

Manipulate a File – If you want to view the contents of the model-popup-information.xlsx file, you must click it.  Then select “View Raw.”  The file will download, and you can review it using Microsoft Excel.

a.
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep9.png) 
Ep9


b.
![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep10.png) 
Ep10

8.  **Navigate to Groups Directory**
Epicenter has a two-tiered hierarchy for organizing users; namely, “Groups” and “Worlds.” However, for simplicity, the VA project has consolidated groups and worlds into a single tier. See “Group Management” lesson for more information regarding groups and procedures for setting them up.

Navigate to the Group Directory.

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep11.png)
Ep11


Click “Add Group.” 

![](https://github.com/lzim/teampsd/blob/master/resources/training_guides/mtl_how_facilitate/graphics/ep12.png)
Ep12
 
## Quick Checklist:

_There is no checklist provided for this module._

#### Common Mistakes:

1. Users sometimes attempt to “Add” a file, instead of “Upload” a file. The “Add” function only adds a custom markdown file that can be edited from inside Epicenter.  It is not relevant for our needs.

2. Use care when uploading files: 

a.  While most uploading functions know to append a file with the same name, Epicenter sometimes chokes on this function.  Therefore, delete a file you intend to replace first, then upload the replacement.

b.  Make sure you are uploading the file to the correct directory. Remember that model and team data files are loaded into the Model Directory.


## Training Record:
#### Practice
###
- [ ] **Exercise 1:** Login and navigate to the VA MTL DEMO – TEST project, Interface directory and answer the following:

1.  What folder are we mainly concerned with in this directory?

2.  What is inside the Dynamic Data folder?

3.  What is inside the Admin Folder?

3.  Briefly describe how you would update the CourseCode.xlsx file.

Completed on: ________________ with _________________________ 

- [ ] **Exercise 2:** Login and navigate to the VA Sim UI – TEST project and answer the following:

1. What is the name of the first Group in the Group Directory?
2. Go to “team-telehealth-menlo-park-oct-2017.” How many End Users are in this group?

        
Completed on: ________________ with _________________________  

#### Supervised Evaluation 

- [ ] **Supervised 1:** Login and navigate to a project instance of your choice. Demonstrate how to move between Model, Interface and Group directories.  Explain what types of information are stored within each of these directories.
        
Completed on: ________________ with _________________________  

- [ ] **Supervised 2:** Login and navigate to a VA Project home page. Demonstrate how to find End User called “Dev User6” and which projects and groups they are assigned.  Then navigate to a project/group assignment given by the evaluator and find the user. 
        
Completed on: ________________ with _________________________  


