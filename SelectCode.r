#clear memory
rm(list=ls())

#possible dependencies you might need:
##install.packages("devtools")
##install.packages("Rcpp")


setwd('//vhapalmpncptsd1/Shared Research/TeamPSD/Model Code/ICC')

getwd()

file="comparatorsites_nov23_16.csv"

data=read.csv(file,header=TRUE)

#comparator.df <- read.csv("comparatorsites_nov23_16.csv",  
                        header = TRUE) 
head(comparator.df) 
dim(comparator.df) 
str(comparator.df) 

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

##important step in order to be able to call up individual variables as objects or select for them
attach(comparator.df)

##to check rows or columns

nrow(comparator.df)
ncol(comparator.df)

#to examine names within the data
names(comparator.df)

#to show first 3 rows of data or any varialbe
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