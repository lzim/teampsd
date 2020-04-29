---
title: "TeamPSD GitHub Guide for Level 1-5 headers"
author: "Team PSD"
date: "RH April 29 2020"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
---

<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  


# TeamPSD GitHub Style Guide for Level 1-5 Headers Across All TeamPSD Documentation
1. Checklist for how to review existing resources to conform to a consistent TeamPSD style and standard use of Markdown for the manual.
2. Define Level 1-5 headers in a standard way across all TeamPSD documents.
3. YAML will be removed when knitted and Level 1 Header needs to be the first item in each of the documents.

## Style
1. General Markdown syntax [guide](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)
2. Other style guidelines on TeamPSD materials 

## Reviewing & Editing TeamPSD Documents
- [ ] Open up the specific **document file** you want to edit.  
- [ ] Create a **new working branch** and name it using all lowercase, no spaces (use underscores) and your initials.
- [ ] Follow the **checklist** below to edit the **level 1-5 headers** in the document.


## Visual Illustration for Consistent Header Style in TeamPSD Documentation  
Header Size | Description | Markdown Code | When to use | Location | Number of instances
:-- | :--| :--| :--| :-- | :--
H1 | Largest | # | Title of document | Top of document | 1 max
H2 | Medium | ## | Section headings | Throughout | As needed for Section headings
H3 | Small | ### | Subheadings of Sections | Throughout | As needed for Subsection headings
H4 | Smaller | #### | Subheadings of Subsections | Throughout | As needed for Subheadings
H5 | Smallest | ##### | For individual Headings | Throughout | As needed for Subsection headings
H6 | Written text |   | For documentation writing | For all text | For all other text

￼￼![image](https://user-images.githubusercontent.com/54862187/80425076-d13b8700-8897-11ea-9242-ac6575067aea.png)


## Checklist Editing Existing TeamPSD Files for Consistent Header Style 
- [ ] Example of **YAML** and **Headers** document [here](https://github.com/lzim/teampsd/blob/rita_2020_04_27_issue_1364/resources/bookdown/sample_header_user.md) 
- [ ] If the document is **missing a YAML header** be sure to **insert** one at the **top of the document** using the YAML code [here](https://github.com/lzim/teampsd/blob/rita_2020_04_27_issue_1364/resources/bookdown/sample_header_user.md) you can copy the exact code from the top of the document  
 ￼￼![image](https://github.com/lzim/teampsd/blob/rita_2020_04_27_issue_1364/resources/bookdown/github_code_yaml_header.png)
- [ ] If the document is **Has a YAML header** be sure to **update** the **date section** with current date and your initials **RH April 29 2020**
- [ ] Ensure the document has a **title** using **header 1** - by adding the **markdown code** before the title **#** use case [example](https://github.com/lzim/teampsd/edit/master/resources/training_guides/github/repositories.md)  
 ￼￼![image](https://github.com/lzim/teampsd/blob/rita_2020_04_27_issue_1364/resources/bookdown/sample_document_style_guide.png)
- [ ] Each **section** within a document needs **section headings** to facilitate reading, for section headings add the **markdown code** before the subheading title **##** use case [example]
- [ ]
- [ ]

### Making a Pull Requests
- [ ] Go to **pull requests** and  make a **new pull request** and **assign** a reviewer. 
- [ ] Cross reference the **pull request** with the **task issue card** that refers to the TeamPSD documentation being edited.
- [ ] Cross reference the **task issue card** with the **pull request**.
- [ ] Use the **style guide** below to edit TeamPSD documents. 
