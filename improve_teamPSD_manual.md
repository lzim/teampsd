## Improve the Team PSD Manual

This section explains how to use GitHub to update a section in the Team PSD manual.  It will also detail how to request a review of your changes and incorporate into the document-of-record.

## Contribute to the Manual using GitHub

This section explains how to:

- Create a "feature branch."
- Make and save edits to a [Markdown file](https://www.markdownguide.org/cheat-sheet/#overview).
- Request a merge of the feature branch with the gh-pages branch (document-of-record).
- How to update the bookdown.yml file to compile the Team PSD Manual in the proper chapter order.

### 1. Create a feature branch from the GH-Pages Branch.

- Start by creating a feature branch with the beginning of the branch named "feature-gh-pages". **The "feature-gh-pages" must be written precisely - GitHub is triggering several automated functions using that naming.**

---
![create branch-step 1](https://github.com/lzim/teampsd/blob/gh-pages/images/create_gh-pages_feature_branch_1.png)
---

- Branch naming convention:
  - New chapter - If new chapter title is "My New Chapter" then name the branch "feature-gh-pages_my_new_chapter."
  - Edit an existing chapter - If existing chapter title is "Using Markdown" then name the branch "feature-gh-pages_using_markdown_edit."
  - If the chapter is being worked on by multiple contributors, or if the chapter is long, break down into multiple files that can be reconciled when compiling the publication. See the Compiling a Publication section below for more details.

---
![create branch-step 2](https://github.com/lzim/teampsd/blob/gh-pages/images/create_gh-pages_feature_branch_2.png)
---

### 2. Create a new markdown file in the branch.

- If contributing to an existing markdown file, skip to step 3 below.
- Create and name a new markdown file

---

![create a markdown file](https://github.com/lzim/teampsd/blob/gh-pages/images/create_markdown_file.png)

---

### 3.	Find and edit a markdown file.

- **Find the markdown file and open for editing.**

---

![find and edit a markdown file](https://github.com/lzim/teampsd/blob/gh-pages/images/edit_markdown_file.png)

---

- **Chapter Heading Structure.** The software that compiles the markdown files into a published manual, takes information from the heading markers (#, ##, ###) to determine if something is a chapter or a subsection.  For example:

  - "\# Standard Operation" _compiles as_ "Chapter 3 - Standard Operations"
  - "\#\# Team PSD"  _compiles as_ "Chapter 3.1 - Team PSD"
  - "\#\#\# "Open-source, Transparent, Reproducible" _compiles as_ "Chapter 3.3.1 - Open-source, Transparent, Reproducible"

---

![chapter heading structure](https://github.com/lzim/teampsd/blob/gh-pages/images/chapter_heading_structure.png)

---

- **Add content.** There are many features in markdown that support various formats and text emphasis.  See [markdown guide cheatsheet](https://www.markdownguide.org/cheat-sheet/) for more information.

---

![markdown.org webpage](https://github.com/lzim/teampsd/blob/gh-pages/images/markdown_org_page.png)

---

- **Add a link.** There are two components to a link, the discription and the uniform resource locator (URL).  It goes like this, description in in brackets [uniform resource locator] followed immediately by the URL in parenthesis (https://en.wikipedia.org/wiki/URL).  So all together [uniform resource locator](https://en.wikipedia.org/wiki/URL). 
  - The description in brackets is a Section 508 Accessibility requirement, so visually impaired people can use a browser reader to interpret what is contained in the link.
  - The link can be placed anywhere in the document.  The term in the brackets will be the only visible element in the rendered document.

- **Add a graphic.** Adding graphics are very similar to links because they both rely on a call to a URL.
  - Create and upload a graphic the the gh-pages_images folder.  Team PSD uses the .png file format for still graphics, and .gif for screencasts. When naming the image, describe what is contained in all lower case, separated by an underscore (ex., upload_image.png).
  - To render a graphic, preceed the link with an exclamation point "!". 
  - Include a description of the graphic in the brackets as with a normal URL link. That way a visually impaired reader will know what the graphic is communicating.
    
---

![upload an image](https://github.com/lzim/teampsd/blob/gh-pages/images/upload_image.png)

---

![make a graphic link](https://github.com/lzim/teampsd/blob/gh-pages/images/make_graphic_link.png)

---

### 4. Update the "\_bookdown.yml" file to reflect proper chapter order.

- **\bookdown.yml.** The "\_bookdown.yml" prints out the manual in the order of the the markdown files listed in line 6 ```rmd_files:```. As explained earlier, the headers of the markdown files listed tells the \_bookdown.yml file whether the markdown is a chapter or a subsection. **The order of the files in the \_bookdown.yml file will be numbered sequentially by the yaml program.** 

---

![add chapter to bookdown.yml file](https://github.com/lzim/teampsd/blob/gh-pages/images/add_chapter_to_bookdown_yml.png)


---

- **Add a markdown file - with chapter heading.** List the markdown filename in the desired chapter order of which, the file should appear in the manual.
    - Make sure to include quotations around the file name and a comma.  
    - Note the last chapter does not need a comma.
 
 ---
 
![chapter order in bookdown.yml file](https://github.com/lzim/teampsd/blob/gh-pages/images/chapter_order_bookdown.png) 
 
 ---
 
 - **Add a markdown file - with subsection heading.** 
   - Sometimes a team must break the work out into sections and it is easier if everyone has their own file. the \_bookdown.yml file supports compiling subsections from files separate from the main chapter heading file.
   - This is a great way to check the formatting and output of your markdown file in the actual Manual before you hand off the review for QA Test.

---

![chapter subsection in bookdown.yml file](https://github.com/lzim/teampsd/blob/gh-pages/images/chapter_subsection_order_1.png)

---

### 5.	Make a pull request to the gh-pages branch.

- Check and resolve for errors returned by the markdown linter, spell checker and link checker.
- Assign QA Test reviewers.
- Once the reviewer has approved, then go to step 6 below. 

---



---
### 6.	Publish your Chapter to master GH-pages branch.

- Merge the Feature branch into GH-pages's master branch.
- Check the actions and ensure the bookdown rendering did not encounter any problems.
- Resolve any bookdown problems.
- See the new work! Go to [Team PSD Manual](https://mtl.how/teampsd_manual)
