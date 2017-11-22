#clear memory
rm(list=ls())

#possible dependencies you might need:
##install.packages("devtools")
##install.packages("Rcpp")

#setwd('//vhapalmpncptsd1/Shared Research/TeamPSD/Model Code/ICC')

setwd('//Vhapalmpncptsd1/Shared Research/CPT_PSD Collaboration/Data Resources/Data for Analyses/Joyce')

getwd()

#to be able to read spss files
library(foreign)
library(tidyverse)
install.packages("dplyr")
library(diplyr)

dataset = read.spss("CPTDATA_DROPOUTFACTORS_6-26-17_IndividualOnly_NoResidential.sav", to.data.frame = TRUE)

file="comparatorsites_nov23_16.csv"
data=read.csv(file,header=TRUE)

comparator.df <- read.csv("comparatorsites_nov23_16.csv")  
dropout.df <- read.spss("CPTDATA_DROPOUTFACTORS_6-26-17_IndividualOnly_NoResidential.sav", to.data.frame = TRUE)                      

#checks
head(comparator.df) 
dim(comparator.df) 
str(comparator.df) 
head(data)
head(dataset)
dim(data)
dim(dataset)
head(dropout.df)
dim(dropout.df)


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


dropout.df <- within(dropout.df, {
  sta6a <- factor(STA6A, 0:4471)})

dropout.df <- within(dropout.df, {
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

dropout.df <- within(dropout.df, {
  sta6a <- as.numeric(STA6A)})

# lowercase names
names(comparator.df) <- tolower(names(comparator.df))
names(dropout.df) <- tolower(names(dropout.df))

# describe data
summary(comparator.df)

##important step in order to be able to call up individual variables as objects or select for them
attach(comparator.df)

##to check rows or columns

nrow(comparator.df)
ncol(comparator.df)

#to examine names within the data
names(comparator.df)

#to show first 3 rows of data or any variable
head(comparator.df)
head(divisionname)

#to show last 3 rows
tail(comparator.df)
tail(divisionname)

#to examine attributes of data
attributes(comparator.df)

##to pull up a specific column, e.g., divisionname
comparator.df["divisionname"]

#to analyze data read at the sta3n level
subset(comparator.df, level=sta3n)

#to analyze data read at the sta6a level
subset(comparator.df, level=sta6a)

#to analyze quarterly data, i.e., data from Q1-Q4
subset(comparator.df, quarter=Q1:Q4)

#to analyze annual data, i.e., data from Q5
subset(comparator.df, quarter=Q5)

#to analyze data with different stopcodes
subset(comparator.df, stopcode=ALL)
subset(comparator.df, stopcode=PTSD)
subset(comparator.df, stopcode=SUD)




#if we want to clarify NULL code
##data[data==NULL] <-NA 
##data <- na.omit(data)


#another attempt using dropout as a .csv file

file2="dropout.csv"
data2=read.csv(file,header=TRUE)
