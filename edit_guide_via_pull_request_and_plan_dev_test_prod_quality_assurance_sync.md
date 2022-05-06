## Edit a Guide via Pull Request and Plan DEV/TEST/PROD Quality Assurance Sync

1. Review QA dependencies via User Stories on Lucid Charts
2. Scope out QA assignees/reviewers, labels and story points on ZenHub/GitHub (use Story 4 QA as reference)
3. Review Team PSD manual for use of QA branch on GitHub
4. Create a feature branch via a pull request from the qa branch
5. Open feature branch from QA
  - Make edits in markdown on GitHub,
  - Conduct QA on qa_branch using GitHub Actions
  - Merge into QA
  - Create PR from QA to Master and assign PROD QA reviewer 
