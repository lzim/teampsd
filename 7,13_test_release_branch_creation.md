# 17.3 Create a Test Release Branch for a lzim/mtl New Version Release

When _MTL_ goes from one version to a higher version, documentation, models and other materials contained in the lzim/mtl repository must be tested. To prevent
mixing up test version materials with materials in use, a test branch must be created.  The branch also moves current versions of materials to an archive folder and the
new models must be moved into the next version folder. All of these actions are automated with the make_test_release_branch.yml action. The sections below explain
how to set up the action yaml file.

## test_release_branch Creation Procedure

1. Navigate to gh-pages branch

<img src = "https://github.com/lzim/teampsd/blob/gh-pages/images/nav_gh-pages.png?raw=true">

2. Navigate to the .github/workflows folder

<img src = "https://github.com/lzim/teampsd/blob/gh-pages/images/nav_github_workflows.png?raw=true">

3. Open make_test_release_branch.yml file.

<img src = "https://github.com/lzim/teampsd/blob/gh-pages/images/open_make_test_release_branch_yaml.png?raw=true">

4. Make the modifications shown below.
  - Enter the name of the previous model folder. This tells the action where to look for the present models.
  - Enter the name of the next version model folder. This tells the action what the new model version folder name is going to be.
  - Enter the name of the new release.  This will tell the action what to name the new release folder for all the training materials.
  - The FindReplace string will find all instances of the words or strings after "find" and replace with the word or string immediately following "replace."  This string is unlimited and can find as many characters, words or strings as desired.

<img src = "https://github.com/lzim/teampsd/blob/gh-pages/images/make_test_release_branch.png?raw=true">
