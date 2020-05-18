---
title: "LucidChart GitHub Integration MVP"
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


# LucidChart and GitHub MVP Integration


**Objective of MVP of LucidChart and GitHub** 
Test ability to build on existing LucidChart knowledge by adding integration to GitHub forked TeamPSD repo
Think of the average use - don't use pro account
Test if I can teach my self - link GitHub forked repo and LucidChart 

# Problem & Hypothesis for Solution

### Team PSD pain points include:
- Being able to orient themselves to the workflow of TeamPSD and the need for documentation to support this
- Need for companion visual guides / maps to orient TeamPSD users to the workflow 
- Current approach is labor and cost intensive - process involves manual updates to LucidChart documents every time changes are made to the TeamPSD documentation

### Possible Solution 
- Team currently uses LucidChart as the platform of chooice to design visual representations of our workflow and platforms
- Several users manually create maps that are used to enhance documentation within TeamPSD
- The process is currently cumbersome and inconsistent. We have developed basic templates with suggeted guidance of colors and shapes - but the process remains inconsistent and out of date.
- We need to update in real time changes to documentation and TeamPSD guides that rely on the use of LucidChart maps to orient users (e.g. ZenHub)
- We currently use GitHUb for all documentation and are using existing resources to compile a TeamPSD manual
- A possible MVP prototype that integraties our two platforms GitHub and LucidChart for updating documentation guides and training manuals would relieves the team's pain point of real time updates. 

### Research Solution in GitHub Market Place
- Research on GitHub and LucidChart plaftorms suggested that ocumentation integration indicates that LucidCharts maps can be updated in real time in GitHub by multiple users concurrently.




The main things missing here from our **Team PSD 2.0 Design Thinking** instructions are **clear user-centered hypotheses guiding each step of MVP learning/development to avoid rework** (our _pareto_ or _80/20 principle_). 
- _What assumptions about **user pain points** are you testing with each prototyping step related to Lucid Chart and GitHub integration?_

A **mental model** shift will help: This is not a “task,” this is your part of an _iterative design process across the team, and you’re working on  this in parallel with everyone else’s **distributed** prototyping work._

Check out the **Teams > Design > Persona and Prototyping Wiki** instructions and **develop/refine your user hypotheses:**

 - Your **prototype is team continuous integration of Lucid Charts and GitHub to improve the Team PSD 2.0 workflow.**

- empathy <> define <> ideate <> prototype <> test

Here are some of **assumptions** that I see you made already at this point of your prototype that should have been checked out with users before proceeding to avoid rework:

1. We definitely do not want these **non-PSD style** maps on GitHub!  
	- The major team pain point is getting the **Lucid** <> **GitHub** continuous integration standardized and accessible for all Team PSD users to contribute _themselves_).
	- We need to **scale** Lucid contributions, **but folks can’t tell how to do so.** It’s frustrating and leads to re-work!
		- **User POV Lucid Chart Scale Problems we’ve discussed:** 
			- Multiple templates, 
			- Inconsistent naming conventions and organization (this will be more and more problematic with links),
			- Connector symbol mistakes on the account, 
			- Use of the non-brand dark red remains, etc. that 
**all needs to be cleaned up, to make sure anyone can create, edit/update a Lucid Charts flow map asynchronously at scale.**)

2. There is also **a significant problem:** Keeping our **_persona_** resources **private:**
	- Remove these links immediately!

3. Use your **GitHub** branches to **_prototype_** with other users. 
	- **Prototypes are handled with pull-requests to other users repos.** 
	- _Which users are testing asynchronously and in parallel, whether they can use your instructions to establish bidirectional GitHub <> Lucid Charts?_
	- **Jane and Debbie** need to be oriented next week on this, _have you prototyped enough with the existing **user persona library** to be ready to expand to these users?_

4. Since we want to make sure that all users can update their Lucid Charts in a style consistent way **your prototyping must account for user learning:**
	- Review your **concurrent video think aloud protocol observation** to refine user instructions for doing so are clear
	- Ideally since we’re at the end of week 2, you aim to be clear about the **80/20 approach that the team will learn over the new couple weeks, so that everyone can make an effective, continuous integrated GitHub/Lucid Chart contributions themselves.**

### Process 
- The process of linking LucidChart maps and GitHub needs to be made within issues or pull requests - using published links provided by LucidChart 
- Guidance on LucidChart (https://www.lucidchart.com/blog/lucidchart-for-github) and GitHub recommended  the [LucidChart Connector information](https://github.com/marketplace/lucidchart-connector)  
## Process for Proposed LucidChart & GitHub Integration and MVP 
- [ ] Fork TeamPSD Repo
- [ ]  Go to GitHub market place and use GitHub app for integration labelled [LucidChart Connector](https://www.lucidchart.com/pages/integrations/github) and follow prompts to install & configure 
- [ ] Within your forked repo create an issue to follow the process of linking LucidChart maps and GitHub within issues or pull requests - using the published links provided by LucidChart 
- [ ] Configuration for this forked repo did work

## Within TeamPSD 
- [ ] Attempted the process of adding the published links provided by LucidChart to an issue on TeamPSD Repo
- [ ] Realize that the configuration did work for this Repo

## Overall Solution for TeamPSD
- [ ] Individual team members need to configure their branched repo to be able to insert published LucidChart links in their GitHub Issues and pull requests.

## Entire Team Solution 
### Step 1 - Log in to GitHub
### Step 2 Got to Market Place & Search for LucidChart
![image](https://user-images.githubusercontent.com/54862187/81884965-2f31c500-954e-11ea-913d-9c91c33c5155.png)
### Step 3 Select Configure Access to your forked TeamPSD repo

## Guidance for TeamPSD Users
## Generating Published Links in LucidChart
- [ ] **Open** a LucidChart document of interest
- [ ] Select **Share**
- [ ] Select **Advanced**
- [ ] Select **Publish**
- [ ] Select **Generate Publish Link**
- [ ] Copy **Published Link** by selecting the **blue paperclip** and paste link into GitHub Issue or pull request



* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [Breakdance](https://breakdance.github.io/breakdance/) - HTML to Markdown converter
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| GitHub | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma test
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
This will create the dillinger image and pull in the necessary dependencies. Be sure to swap out `${package.json.version}` with the actual version of Dillinger.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart="always" <youruser>/dillinger:${package.json.version}
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


### Todos

 - Write MORE Tests
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>

