---
  title: "Selecting CDW Dataset for clinics and not observations"
author: "Joyce Yang"
date: "August 3, 2018; Update August 20, 2018"
output:
  html_document:
  df_print: paged
pdf_document: default
word_document: default
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set
setwd(("//vhapalmpncptsd1/Shared Research/teamPSD/quant_workgroup/r"))

```



## Setting up the R environment and datasets
```{r, include=FALSE}
library(readxl)
library(magrittr)
library(lubridate)
library(dplyr)
library(psych)
library(tidyverse)
```


```{r, include=FALSE}
#set up both files as dataframes
comparator.df <- read.csv("comparatorsites_nov23_16.csv", header=TRUE) 
dropout.df <- read.csv(file="dropout.csv",header=TRUE) 


#set all variable names as lower case
names(comparator.df) <- tolower(names(comparator.df))

names(dropout.df) <- tolower(names(dropout.df))

variable.names(comparator.df)
variable.names(dropout.df)

```


## Setup the CDW Comparator Data part 1

```{r numeric, include=TRUE}
##Set variables as numeric in order to manipulate later
#set up in original CDW 
##create combined variable in comparator.df based on the variable 'year' and the variable 'quarter'

comparator.df <- comparator.df %>%
  mutate_at(vars(totalencounters:x._cbt_sud_sessions), as.numeric) %>%
  mutate(year_q  = paste0(year, "-", quarter), 
         site_yq = paste0(sta6a,"-",year_q))

```

##create combined variable in dropout.df; note that quarters in comparator are fiscal year quarters with Oct 1 start
#mutate in dplyr = change a variable or create a new variable
```{r}
dropout.df <- dropout.df %>% 
  mutate(date_1 = as.character(date_1),
         date_1 = as.Date(date_1, "%m/%d/%Y"),
         year = year(date_1), 
         quarter = quarter(date_1, with_year = FALSE, fiscal_start = 10),
         quarter = paste0("Q", quarter),
         year_q = paste0(year, "-", quarter),
         site_yq = paste0(sta6a,"-",year_q)) 

table(dropout.df$year, useNA = 'ifany')
## Where are there 3 obs whose year is beyond 2016? --> data entry errors
## About 40% of the data doesn't have any year record. Will this impact the analysis?
## Note that the  year available in the dropout data only overlaps with part of the  year in the comparator data. Is that okay?


```


##NEW CODE
## Setup the CDW Comparator Data part 2
## Select CDW for dates that match the CPT database, which is from May 9, 2012 (2012Q3) - September 2, 2016 (2016Q4).  
##CDW data ranges from 2011Q4 until 2016Q3. Overlap is from 2012Q3 until 2016Q3 (although that does not fully cover CPT dates, since CPT goes to 2016Q4. What do we do about this?)
## Must select for CDW only from 2012Q2 to 2016Q3

##select the subset of comparator that we want to work with: here we are selecting for all quarters except for Q5 (i.e., Q1-4), as well as selecting for when the level of the data is read at sta6a (i.e., not examining data read in at the sta3n level) and when the stopcodes are ALL (i.e., not examining data broken down to stopcodes of SUD and PTSD)
```{r}

compsub.df <- comparator.df %>%
  filter(year_q %in% c("2012-Q3", "2012-Q4", "2013-Q1", "2013-Q2", "2013-Q3", "2013-Q4", "2014-Q1", "2014-Q2", "2014-Q3", "2014-Q4", "2015-Q1", "2015-Q2", "2015-Q3", "2015-Q4", "2016-Q1", "2016-Q2", "2016-Q3"  )) %>%
  filter(level == "sta6a") %>%
  filter(stopcode == "ALL") %>% 
  select(level, stopcode, quarter, year, quarteryear, sta6a, totalencounters, patientpanel, providerpanel, psychiatrists, psychologists, socialworkers, nursepractitioners, evalencounter, psychencounter, ptsd_ebpsyeligible, pe_initial_appoints, cpt_initial_appoints, site_yq, sta6acomplexity, tmh, psychmmencounter, groupencounter, mmencounter, casemanagement, telephoneencounter, otherencounter, depression_ebpsyeligible, cbt_d_initial_appoints, act_initial_appoints, ipt_initial_appoints)

```

##create new dataframe that merges the two datasets on the site_yq variable
```{r}
#merge.df <- merge.data.frame(compsub.df, dropout.df, by = "site_yq")

merge.df <- merge.data.frame(compsub.df, dropout.df, by = c("site_yq", "sta6a"))

summary (merge.df)
```

## to find unique sta6a in the comparator: 
```{r}
length(unique(comparator.df$sta6a))
##The unique length of sta6a is 1627 in comparator
```

##to find unique sta6a in the merged dataset:
```{r}
length(unique(merge.df$sta6a))
```
##The unique length of sta6a is 265 in merged dataset


##Examine Total Encounters
```{r}
mean(merge.df$totalencounters)
sd(merge.df$totalencounters)
```

## Within the CPT merge dataset

encounters_mean<- merge.df %>%
group_by(sta6a) %>%
  summarize(mean = mean(totalencounters))

mean(encounters_mean$mean)
sd(encounters_mean$mean)

tmh_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(tmh))

mean(tmh_mean$mean)
sd(tmh_mean$mean)

patientpanel_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(patientpanel))

mean(patientpanel_mean$mean)
sd(patientpanel_mean$mean)

providerpanel_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(providerpanel))

mean(providerpanel_mean$mean)
sd(providerpanel_mean$mean)

psychiatrists_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychiatrists))

mean(psychiatrists_mean$mean)
sd(psychiatrists_mean$mean)

socialworkers_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(socialworkers))

mean(socialworkers_mean$mean)
sd(socialworkers_mean$mean)

psychologists_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychologists))

mean(psychologists_mean$mean)
sd(psychologists_mean$mean)

evalencounter_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(evalencounter))

mean(evalencounter_mean$mean)
sd(evalencounter_mean$mean)

psychencounter_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychencounter))

mean(psychencounter_mean$mean)
sd(psychencounter_mean$mean)

mmencounter_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(mmencounter))

mean(mmencounter_mean$mean)
sd(mmencounter_mean$mean)

groupencounter_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(groupencounter))

mean(groupencounter_mean$mean)
sd(groupencounter_mean$mean)

cpt_initial_appoints_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(cpt_initial_appoints))

mean(cpt_initial_appoints_mean$mean)
sd(cpt_initial_appoints_mean$mean)

pe_initial_appoints_mean<- merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(pe_initial_appoints))

mean(pe_initial_appoints_mean$mean)
sd(pe_initial_appoints_mean$mean)


## Within the Comparator dataset minus the merge dataset
cdw_minus_merge.df <- anti_join(comparator.df, dropout.df, by= "site_yq")

encounters_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(totalencounters))

mean(encounters_mean$mean)
sd(encounters_mean$mean)

tmh_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(tmh))

mean(tmh_mean$mean)
sd(tmh_mean$mean)

patientpanel_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(patientpanel))

mean(patientpanel_mean$mean)
sd(patientpanel_mean$mean)

providerpanel_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(providerpanel))

mean(providerpanel_mean$mean)
sd(providerpanel_mean$mean)

psychiatrists_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychiatrists))

mean(psychiatrists_mean$mean)
sd(psychiatrists_mean$mean)

socialworkers_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(socialworkers))

mean(socialworkers_mean$mean)
sd(socialworkers_mean$mean)

psychologists_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychologists))

mean(psychologists_mean$mean)
sd(psychologists_mean$mean)

evalencounter_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(evalencounter))

mean(evalencounter_mean$mean)
sd(evalencounter_mean$mean)

psychencounter_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(psychencounter))

mean(psychencounter_mean$mean)
sd(psychencounter_mean$mean)

mmencounter_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(mmencounter))

mean(mmencounter_mean$mean)
sd(mmencounter_mean$mean)

groupencounter_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(groupencounter))

mean(groupencounter_mean$mean)
sd(groupencounter_mean$mean)

cpt_initial_appoints_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(cpt_initial_appoints))

mean(cpt_initial_appoints_mean$mean)
sd(cpt_initial_appoints_mean$mean)

pe_initial_appoints_mean<- cdw_minus_merge.df %>%
  group_by(sta6a) %>%
  summarize(mean = mean(pe_initial_appoints))

mean(pe_initial_appoints_mean$mean)
sd(pe_initial_appoints_mean$mean)



##We are attempting to understand mean experiences by clinics within the dataset.
##In order to get clinic information, we are using sta6a's as they incorporate sta3n information into it, theoretically
##However, upon viewing the data, we saw several examples where the sta6a and sta3n code were the same, so we are running 
##check to see how frequently that occurrs.

sta6a_check <- comparator.df %>% 
  mutate(sta3_val = substr(sta6a, 1,3),
         sta3_logic = ifelse(sta3_val==sta3n, "yes", "no")
         )

table(sta6a_check$sta3_logic)

table(sta6a_check$sta3_logic, sta6a_check$level)

level_mismatch <- as.character(unique(sta6a_check$sta6a
                                      [sta6a_check$sta3_logic=="no" & 
                                          sta6a_check$level =="sta6a"]))
                                      
level_mismatch %in% merge.df$sta6a
#Yes; level_mismatch, w hich is 657A5 is in the merged dataset


#Creating within the encounters dataset:
  encounters_mean <- encounters_mean %>%
  mutate( sta3n = substr(sta6a, 1,3),
          sta3n = replace(sta3n, sta3n == level_mismatch, comparator.df$sta3n[comparator.df$sta6a == level_mismatch]))


##to plot: plot(x,y), on the x axis is the individual sta6a clinics, on the y axis is the mean encounters in the clinics
  
  encounters_mean<- merge.df %>%
    group_by(sta6a) %>%
    summarize(mean = mean(totalencounters))
  
  plot(encounters_mean$sta6a, encounters_mean$mean)

encounters_sta6a_facility <- 
  ggplot(encounters_mean, aes(sta6a, mean), group = sta3n, 
         color = sta3n) + geom_point()

nested: by time, by provider, by sta6a, by sta3n

distribution plots: on X is mean
density plot: distribution of clinics that make up the mean

how the cpt sites are distributed around their mean vs. 
how cdw sites are distributed around their mean
