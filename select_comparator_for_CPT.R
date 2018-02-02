## Project: CPT Collaboration
## Purpose: Select Comparator Dataset for relevant variables
## Author: Joyce Yang
## Date: 2/1/18
## Notes: 
##
######################################################################################
#clear memory 
rm(list=ls()) 

#set working directory
setwd("//vhapalmpncptsd1/Shared Research/TeamPSD/R")

#check working directory
getwd()

# Packages required for merging CDW and CPT
library(tidyverse)
library(magrittr)
library(rlang)
library (reshape2)
library(lubridate)
library(ggplot2)
library(gmodels)
library(dplyr)


########################################################################

#set up both files as dataframes

file="comparatorsites_nov23_16.csv" 
data=read.csv(file,header=TRUE) 

file2="dropout.csv" 
data2=read.csv(file2,header=TRUE) 

summary(data)
summary(data2)

comparator.df <- data
dropout.df <- data2

#visually check both dataframes
View(comparator.df)
View(dropout.df)

#checks
head(comparator.df) 
dim(comparator.df) 
str(comparator.df) 
head(dropout.df)
dim(dropout.df)
str(dropout.df)

##Assigning the data structure from Lindsey's original code (I don't always run this part because I do the selections and numeric assignments after, on the variables that I call, but I wanted to include it here so you'd have it)

#comparator.df <- within(comparator.df, {
  level <- factor(level, 0:1, c("sta3n","sta6a"))
  stopcode <- factor(stopcode, 0:2, c("All Mental Health Stop Codes",
                                      "PTSD", "SUD"))
  quarter <- factor(quarter, 0:4, c("Q1","Q2","Q3","Q4", 
                                    "All Four Quarters"))
  year <- factor(year, 0:5, c("2011", "2012", "2013", 
                              "2014", "2015", "2016"))
  sta6a <- factor(sta6a, 0:1626)
  divisionname <-	factor(divisionName, 0:1072)
  sta3n <- as.factor(sta3n)
  sta6acomplexity <- factor(sta6aComplexity, 0:2, 
                            c("1", "2", "3"))
  totalencounters <- as.numeric(totalEncounters)
  telemental_health <- as.numeric(TMH)
  patients <- as.numeric(patientPanel)
  providers <- as.numeric(providerPanel)
  psychiatrists <- as.numeric(psychiatrists)
  psychologists <- as.numeric(psychologists)
  socialworkers <- as.numeric(socialWorkers)
  nurses <- as.numeric(nursePractitioners)
  totalstopcodepairs <- as.numeric(totalStopCodePairs)
  intake <- as.numeric(evalEncounter)
  psychotherapy <- as.numeric(psychEncounter)
  psychMM <- as.numeric(psychMMencounter)
  group <- as.numeric(groupEncounter)
  med_mgmt <- as.numeric(groupEncounter)
  case_mgmt <- as.numeric(caseManagement)
  phone_visit <- as.numeric(telephoneEncounter)
  other <- as.numeric(otherEncounter)
  dep_ebpsy_denom <- as.numeric(Depression_EBPsyEligible)
  cbt_d_initial <- as.numeric(CBT_D_initial_appoints)
  act_d_initial <- as.numeric(ACT_initial_appoints)
  ipt_d_initial <- as.numeric(IPT_initial_appoints)
  ptsd_ebpsy_denom <- as.numeric(PTSD_EBPsyEligible)
  pe_initial <- as.numeric(PE_initial_appoints)
  cpt_initial <- as.numeric(CPT_initial_appoints)
  dep_ebpharm_denom <- as.numeric(Depression_EBPharmEligible)
  dep_ebpharm_numer <- as.numeric(Depression_RX)
  out_ebpharm_denom <- as.numeric(OUD_EBPharmEligible)
  oud_ebpharm_numer <- as.numeric(OUD_RX) 
  aud_ebpharm_denom <- as.numeric(AUD_EBPharmEligible)
  aud_ebpharm_numer <- as.numeric(AUD_RX)
})

#dropout.df <- within(dropout.df, {
  sta6a <- factor(STA6A, 0:4471)})

#dropout.df <- within(dropout.df, {
  pt_last <- as.numeric(PT_LAST)
  setting_other <- as.numeric(SETTING_OTHER)
  multiple_era_specified <- as.numeric(MULTIPLE_ERA_SPECIFIED)
  other_era <- as.numeric(OTHER_ERA)
  other_military <- as.numeric(OTHER_MILITARY)
  other_trauma <- as.numeric(OTHER_TRAUMA)
  diagnosis_specify <- as.numeric(DIAGNOSIS_SPECIFY)
  other_race <- as.numeric(OTHER_RACE)
  multiple_races_specified <- as.numeric(MULTIPLE_RACES_SPECIFIED)
  dropout_reason <- as.numeric(DROPOUT_REASON)
  discipline <- as.numeric(Discipline)
  sta_name <- as.numeric(STA_NAME)
  va_work_setting <- as.numeric(VA_Work_Setting)
  workshop_type <- as.numeric(Workshop_Type)
  consultation_status <- as.numeric(Consultation_Status)
})


#create combined variable in comparator.df based on the variable 'year' and the variable 'quarter'

comparator.df <- comparator.df %>% 
  mutate(year_q  = paste0(year, "-", quarter), 
         site_yq = paste0(sta6a,"-",year_q))

#check comparator.df to make sure new variables have been created
summary(comparator.df)

#create combined variable in dropout.df; note that quarters in comparator are fiscal year quarters with Oct 1 start

dropout.df <- data2 %>% 
  mutate(DATE_1 = as.character(DATE_1),
         DATE_1 = as.Date(DATE_1, "%m/%d/%Y"),
         year = year(DATE_1), 
         quarter = quarter(DATE_1, with_year = FALSE, fiscal_start = 10),
         quarter = paste0("Q", quarter),
         year_q = paste0(year, "-", quarter)) %>% 
         mutate(site_yq = paste0(STA6A,"-",year_q)) 

#select the subset of comparator that we want to work with; can add more variables here if we need to
compsub.df <- comparator.df %>%
  filter(quarter != "Q5") %>%
  filter(level == "sta6a") %>%
  filter(stopcode == "ALL") %>% 
  select(level, stopcode, quarter, year, sta6a, totalencounters, patients, providers, psychiatrists, psychologists, socialworkers, nurses, intake, psychotherapy, ptsd_ebpsy_denom, cpt_initial)

#create new dataframe that merges the two datasets on the site_yq variable
newdf <- merge.data.frame(compsub.df, dropout.df, by = "site_yq")

#examine new dataframe
summary (compsub.df)

str(compsub.df)

View (compsub.df)

#check site_yq from different datasets
tabulate(comparator.df$site_yq)
tabulate(dropout.df$site_yq)
tabulate(compsub.df$site_yq)


#check site_yq from different datasets
tabulate(comparator.df$site_yq)
tabulate(dropout.df$site_yq)
tabulate(compsub.df$site_yq)

#check frequencies and concordance between subsetted dataset and original comparator
xtabs(~site_yq, data=comparator.df)
xtabs(~site_yq, data=dropout.df)
xtabs(~site_yq, data=compsub.df)

xtabs(~patients, data=comparator.df)
xtabs(~patients, data=compsub.df)

xtabs(~providers, data=comparator.df)
xtabs(~providers, data=compsub.df)

xtabs(~psychiatrists, data=comparator.df)
xtabs(~psychiatrists, data=compsub.df)

xtabs(~psychologists, data=comparator.df)
xtabs(~psychologists, data=compsub.df)

xtabs(~socialworkers, data=comparator.df)
xtabs(~socialworkers, data=compsub.df)

xtabs(~nurses, data=comparator.df)
xtabs(~nurses, data=compsub.df)

xtabs(~intake, data=comparator.df)
xtabs(~intake, data=compsub.df)

xtabs(~psychotherapy, data=comparator.df)
xtabs(~psychotherapy, data=compsub.df)

xtabs(~ptsd_ebpsy_denom, data=comparator.df)
xtabs(~ptsd_ebpsy_denom, data=compsub.df)

xtabs(~cpt_initial, data=comparator.df)
xtabs(~cpt_initial, data=compsub.df)

##also possible to examine this using Cross Table to see the correlations between the variable in the two datasets
install.packages("gmodels")
library(gmodels)

CrossTable(comparator.df$site_yq, compsub.df$site_yq)
CrossTable(comparator.df$patients, compsub.df$patients)
CrossTable(comparator.df$providers, compsub.df$providers)
CrossTable(comparator.df$psychiatrists, compsub.df$psychiatrists)
CrossTable(comparator.df$psychologists, compsub.df$psychologists)
CrossTable(comparator.df$socialworkers, compsub.df$socialworkers)
CrossTable(comparator.df$nurses, compsub.df$nurses)
CrossTable(comparator.df$intake, compsub.df$intake)
CrossTable(comparator.df$psychotherapy, compsub.df$psychotherapy)
CrossTable(comparator.df$ptsd_ebpsy_denom, compsub.df$ptsd_ebpsy_denom)
CrossTable(comparator.df$cpt_initial, compsub.df$cpt_initial)


#descriptives of variables in original and merged datasets for checks

##in comparator
attach(comparator.df)

mean(patients)
sd(patients)

mean(providers)
sd(providers)

mean(psychiatrists)
sd(psychiatrists)

mean(psychologists)
sd(psychologists)

mean(socialworkers)
sd(socialworkers)

mean(nursepractitioners)
sd(nursepractitioners)

mean(cpt_initial)
sd(cpt_initial)

detach(comparator.df)

##Descriptives of from merged dataframe
attach(compsub.df)

mean(patients)
sd(patients)

mean(providers)
sd(providers)

mean(psychiatrists)
sd(psychiatrists)

mean(psychologists)
sd(psychologists)

mean(socialworkers)
sd(socialworkers)

mean(nursepractitioners)
sd(nursepractitioners)

mean(cpt_initial)
sd(cpt_initial)

detach(compsub.df)



#Visualizations of variables in original and merged datasets
library(ggplot2)

attach(comparator.df)

#scatterplots
plot(year_q, patientPanel, main="Patient Panel", xlab="Year Quarter", ylab="Patient Panel")

#bar graphs
barplot(patientPanel, names.arg = year_q, xlab = "Year Quarter", ylab = "Patient panel")

qplot(x=year_q, y=patientPanel, data=comparator.df, geom = "point")

qplot(x=year_q, y=providerPanel, data=comparator.df, geom = "point")

qplot(x=year_q, y=psychiatrists, data=comparator.df, geom = "point")

qplot(x=year_q, y=psychologists, data=comparator.df, geom = "point")

qplot(x=year_q, y=socialWorkers, data=comparator.df, geom = "point")

qplot(x=year_q, y=nursePractictioners, data=comparator.df, geom = "point")

detach(comparator.df)


#Visualizations of variables in original and merged datasets
attach(compsub.df)

#scatterplots
plot(year_q, patientPanel, main="Patient Panel", xlab="Year Quarter", ylab="Patient Panel", )

#bar graphs
barplot(patientPanel, names.arg = year_q, xlab = "Year Quarter", ylab = "Patient panel")

qplot(x=year_q, y=patientPanel, data=comparator.df, geom = "point")

qplot(x=year_q, y=providerPanel, data=comparator.df, geom = "point")

qplot(x=year_q, y=psychiatrists, data=comparator.df, geom = "point")

qplot(x=year_q, y=psychologists, data=comparator.df, geom = "point")

qplot(x=year_q, y=socialWorkers, data=comparator.df, geom = "point")

qplot(x=year_q, y=nursePractictioners, data=comparator.df, geom = "point")

detach(compsub.df)

