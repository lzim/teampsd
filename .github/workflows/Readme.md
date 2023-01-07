# Actions in This Repository

-  **renderbook.yml** is an action to render markdown files (.md) from the main directory in the gh-pages branch as .html files, for publication of an eBook on a GitHub pages website. This book is linked, has the ability to output .pdf versions and is searchable.
- **ActionChecker.yml** runs **cspell.json** to check spelling, test links and **markdownlint.json** to ensure the markdown file being edited follows common publication rules for spacing, use of headers and punctuation.
  - To add words to the dictionary, add them to the **cspelldict.txt** file.
- **apa_editor_action.yml** is an action that tests for American Psychological Association rules for title case and prepositions, use of & character, proper format and use of "Tips & Tricks," use of questions in bulleted lists, and the use of abbreviations.
  - The action above returns a list of errors by file and line number.
  - Lists of prepositions and abbreviations can be changed in the hirenp-waferwire/custom-markdown-action repository for authorized users.
- **make_test_release_branch.yml** action creates a version test branch.
  - A version test branch is when there is a significant version change for the _mtl_ platform (example: from version 2.0 to version 3.0).
  - It automatically creates a backup of the previous version of the see.md guides, creates a new model file folder and copies model files, and converts all the links in the documentation to a /test version link.  
  - When merged back to the Main branch, the action will reverse the /test links back to production links. 
