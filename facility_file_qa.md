# Monthly Facility File Propagation

## DEV QA 
See TeamPSD > quant_workgroup > splash_pages > Splashpage_monthly_update_readme

## TEST & PROD QA 
- [ ] Open mtl.how/data.
- [ ] Choose 3 facilities actively engaged in *Modeling to Learn* across different visns. When testing, use the real filter selections that the teams are using. List facilities below:
      ________________________________________  
      ________________________________________  
      ________________________________________  
      
- [ ] Choose 3 facilities not actively engaged in *Modeling to Learn* across different visns & in visns different from the ones in the previous step. List facilities below:
      ________________________________________  
      ________________________________________  
      ________________________________________  
- [ ] Open in the Excel app.

**Note:** "Test" of dropdowns and buttons include:
1. Presence: Check that they exist on the appropriate Excek tab and section
2. Interactability: Click on them and try filtering to different options
3. Accuracy: Check that the data is appropriate for selection (i.e. divisionname should match the facility selected, should not be seeing health factor templates in encounters)

### vizDiag
- [ ] Propagation spans two years on the table and graph through the previous month. 
- [ ] "Reset Pivot Chart" button exists above the graph and resets the data when clicked after filtering in the table and graph in the following steps.
- [ ] No SSN

#### Table
  - [ ] Displays visit counts of 4 primary diagnoses of interest: PTSD, Depression, AUD, & OUD
  - [ ] Grab 5 data points and cross-reference on graph to make sure table <> graph rendering is working
  
      Test the dropdowns:
      - [ ] divisionname
      - [ ] locationname
      - [ ] Row Labels

#### Graph
  - [ ] Displays visit count trend lines of 4 primary diagnoses of interest: PTSD, Depression, AUD, & OUD

      Test the buttons:
       - [ ] divisionname
       - [ ] locationname
       - [ ] visitdatetime(Year)
       - [ ] visitdatetime(Month)


### vizEnc
- [ ] Propagation spans two years on the table and graph through the previous month.
- [ ] "Reset Pivot Chart" button exists above the graph and resets the data when clicked after filtering in the table and graph in the following steps.
- [ ] No SSN

#### Table
  - [ ] Displays encounter counts of 10 encounter types: Addiction, Adjunct, Care or support, Evaluation, Family Therapy, Group Therapy, Med Mgmt, Psychotherapy 60-minute, Psychotherapy with Med Mgmt, & Telephone
  - [ ] Grab 5 data points and cross-reference on graph to make sure table <> graph rendering is working
  
      Test the dropdowns:
      - [ ] divisionname
      - [ ] locationname
      - [ ] VVC
      - [ ] Row Labels
      - [ ] Column Labels

#### Graph
  - [ ] Displays encounter count trend lines of 10 encounter types: Addiction, Adjunct, Care or support, Evaluation, Family Therapy, Group Therapy, Med Mgmt, Psychotherapy 60-minute, Psychotherapy with Med Mgmt, & Telephone
  
      Test the buttons:
       - [ ] divisionname
       - [ ] locationname
       - [ ] VVC
       - [ ] visitdatetime(Year)
       - [ ] visitdatetime(Month)
       - [ ] encounter type


### vizHF
- [ ] Propagation spans two years on the table and graph through the previous month.
- [ ] "Reset Pivot Chart" button exists above the graph and resets the data when clicked after filtering in the table and graph in the following steps.
- [ ] No SSN


#### Table
  - [ ] Displays encounter counts of 10 encounter types: MH ACT Templates (Accept & Commitment), MH CBT-D Templates (Cog Behavioral), MH CPT Templates (Cognitive Processing), MH IBCT Templates, MH IPT for Depression, MH PEI Templates, PB PharmD MH Depression Med, REACH Vet, VA-Suicide Protective Factors [C], VA-Suicide Risk Assessment [C], VA-Suicide Risk Evaluation Type [C], VA-Suicide Risk Factors [C], & VA-Suicide Safety Plan
  - [ ] Grab 5 data points and cross-reference on graph to make sure table <> graph rendering is working
  
      Test the dropdowns:
      - [ ] divisionname
      - [ ] locationname
      - [ ] Row Labels
      - [ ] Column Labels

#### Graph
  - [ ] Displays encounter count trend lines of 10 encounter types: Addiction, Adjunct, Care or support, Evaluation, Family Therapy, Group Therapy, Med Mgmt, Psychotherapy 60-minute, Psychotherapy with Med Mgmt, & Telephone
  
      Test the buttons:
       - [ ] divisionname
       - [ ] locationname
       - [ ] visitdatetime(Year)
       - [ ] visitdatetime(Month)
       - [ ] healthfactorcategory


### vizMeas
- [ ] Propagation spans two years on the table and graph through the previous month.
- [ ] "Reset Pivot Chart" button exists above the graph and resets the data when clicked after filtering in the table and graph in the following steps.
- [ ] No SSN



### dataEnc

### dataDiag

### dataHF

### dataMeas
