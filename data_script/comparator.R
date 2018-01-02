#Comparator Data Set Analyses
#Original File "comparatorsites_nov23_16.xlsx"
#File covers Q4 of 2011 and is complete through Q3 of 2016 OR 20 total Quarters

#clear memory
rm(list=ls())

#Set Working Directory

setwd("//vhapalmpncptsd1/shared research/R/comparator")

#Check Working Directory
getwd()

#Libraries

library(Hmisc)
library(survival)
library(latticeExtra)
library(gridExtra)
library(lme4)
library(ICC)
library(ICCbin)
library(htmlTable)
library(backports)
library(psych)
library(mnormt)

require(Hmisc)
require(survival)
require(latticeExtra)
require(RColorBrewer)
require(gridExtra)
require(lme4)
require(ICC)
require(ICCbin)

#Read in Data

comparator.df <- read.csv("comparatorsites_nov23_16.csv", 
                          header = TRUE)

#Check Headers, Dimensions and Structure of the file
head(comparator.df)
dim(comparator.df)
str(comparator.df)

#Assign the Data Structure

comparator.df <- within(comparator.df, {
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

# lowercase names
names(comparator.df) <- tolower(names(comparator.df))

# describe data
summary(comparator.df)
