---
title: "LucidChart GitHub Integration How To"
author: "Rita Hitching"
date: "RH May 18 2020"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default   
---


<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  


## Issues
- (i) The LucidChart GitHub connector is an application with an API - it does not convert LucidChart flowmaps into a markdown files.  
- (ii) It is not possible to use GitHub actions to look for particular features within a flowmap, as it’s an image and not a markdown file. 
- (iii) It is possible to view a version of the flowmap as an image within an issue or a pull request, but not within a markdown file.
- (iv) The published link that LucidChart provides to use on issues and pull requests - that provides a preview image of the flowmap does not reflect changes made to the flowmap in LucidChart.
- (v) I have been working with LucidChart and GitHub to fix the bug in the integration process as it refers to outdated flowmap previews - I’ll provide updates as I know more
- (vi) I have been looking for a solution with LucidChart to provide a preview of the flowmap within a markdown file using the published link - again - I’ll provide updates as I learn more 


## Questions:
1. Are we comfortable with providing users with a link within a markdown file to the most current version of a LucidChart flowmap, even if currently the integration process does not show a ‘preview’ of the map within a markdown file?
Currently TeamPSD documentation that includes flowmaps is using downloaded PDFs from LucidChart that are uploaded to the repo, with a link to a file/image in the repo added to a markdown document.  This process is not scalable.  Changes that need to be made to flowmaps require a cumbersome process of:
- (i)   make changes to a flow map in LucidChart or create a new flowmap
- (ii)  review changes to flowmap or new map by a user or TeamPSD administrator -  neither user or reviewer can view the changes made to a flowmap or the flowmap itself within GitHub.
- (iii) once changes have been agreed upon, a new PDF needs to be downloaded from LucidChart and uploaded to GitHub - that request needs to be reviewed and merged to master
- (iv) a user then needs to create a branch and update the relevant markdown files with the new PDF file names - across all documents that were displaying the prior version of the PDF
- (vi) a final pull request needs to be made to reflect changes to the repo from the users branch
2. Are we comfortable with using the connector in issues and pull requests, even if the most recent version of the flowmap is to shown? Will this confuse users?
The integration between LucidChart and GitHub is not showing the most recent version of a map within an issue or a pull request.  I hope to be able to get a solution, but currently it is not a function of the connector.


## Feedback
**James**: was initially not able to get the integration to work (his repo did not show the integration even after being added)- does not seem to work with PC well.  Subsequent attempts using own LucidChart account were successful in part, but not all maps unfurled.

***Jenn**:
Able to follow integration processes and insert like to issues and pull requests
Does not like the idea a static image within a markdown file - would prefer a link to LucidChart

## Solution & Review

1.Can we set up a test for LucidChart flowmaps - that ensures that TeamPSD style is used by users when adding flow maps to TeamPSD repo?
- (i) LucidChart connector enables users to show versions of their flow maps within issues and pull requests without others users needing to go to leave the GitHub platform and go to LucidChart to view the flowmaps.
- (ii) Users can paste a published link in an issue and a version of the map is shown as a preview, in the format of an image for users to comment on the content of the map without needing to go to LucidChart or leaving the GitHub platform.
- (iii) Users can paste a published link in a pull request to show a flowmap they want to add to the TeamPSD repo. Prior to accepting a pull request to add a flowmap to a repo, a control version or ‘brand consistent flowmap’ is included with the pull request for the reviewer to ensure that flow maps are consistent (e.g. maps have a title, use the correct font, correct shapes  etc.) 
2. Can we set up a test for LucidChart flowmaps - that ensures that TeamPSD documentation reflects the latest changes in the TeamPSD repo?
- (i) Yes, the Lucidchart connector can do this - it provides a live link from the markdown file directly to the most current version of the flow map. The user needs to leave GitHub and go to LucidChart to view the map. 
- (ii) The connector does not provide a preview of the map, within a markdown file (in the same way it does within an issue or pull request) but a hyperlink  to LucidChart that reflects the most recent  version of that flow map
3. Can we set up a test template on LucidChart that ensures that TeamPSD flowmaps  are brand consistent with?
- (i) Yes, Lucidchart enables the creation of TeamPSD templates that provide preset guidance on how to create a flowmap. 
- (ii) In addition, LucidChart enables the addition of a library of shapes that can be preset for users to use when making their flowmaps - the library is dynamic and we can add/edit flowmap shapes to be be consistent with TeamPSD brand font, color, function, user case,  etc.)  
- (iii) We can restrict the options available to users so that they can only access the TeamPSD library of shapes and not have the option to add other shapes to their flowmaps - this helps with  brand control and consistency of flowmaps.
4. Is the process of connecting LucidChart and GitHub user friendly?
- (i) Yes, the connector can be preset to the TeamPSD repo in GitHub for all users/contributors to that repo - no need for individual configurations.
- (ii) Yes, the connector can be preset to the LucidChart account for all users - again - no need for individual configurations.
- (iii) The instructions for integrating LucidChart and GitHub are only needed for user that are working within their individual repos’ and is a straight forward ‘click’ system, no command line or expertise needed. In addition a user can integrate LucidChart for a current and all future repos. Meaning that integration only needs to happen once.


