---
title: "Generating CDW minus CPT dataset"
author: "Joyce Yang"
date: "May 29, 2018"
output:
  html_document:
    df_print: paged
  pdf_document: default
  word_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
#knitr::opts_knit$set(root.dir = normalizePath("//vhapalmpncptsd1/Shared Research/TeamPSD/R"))
```



## Setting up the R environment and datasets
```{r, include=FALSE}
library(readxl)
library(magrittr)
library(lubridate)
library(dplyr)
library(psych)
```


```{r, include=FALSE}
#set up both files as dataframes
comparator.df <- read.csv("Original Data/comparatorsites_nov23_16.csv", header=TRUE) 
dropout.df <- read.csv(file="Original Data/dropout.csv",header=TRUE) 

#set all variable names as lower case
names(comparator.df) <- tolower(names(comparator.df))

names(dropout.df) <- tolower(names(dropout.df))

variable.names(comparator.df)
variable.names(dropout.df)

```


## Setup the Comparator Data

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
  ## Where are there 3 obs whose year is beyond 2016?
  ## About 40% of the data doesn't have any year record. Will this impact the analysis?
  ## Note that the  year available in the dropout data only overlaps with part of the  year in the comparator data. Is that okay?


```



##select the subset of comparator that we want to work with: here we are selecting for all quarters except for Q5 (i.e., Q1-4), as well as selecting for when the level of the data is read at sta6a (i.e., not examining data read in at the sta3n level) and when the stopcodes are ALL (i.e., not examining data broken down to stopcodes of SUD and PTSD)
```{r}

compsub.df <- comparator.df %>%
  filter(quarter != "Q5") %>%
  filter(level == "sta6a") %>%
  filter(stopcode == "ALL") %>% 
select(level, stopcode, quarter, year, quarteryear, sta6a, totalencounters, patientpanel, providerpanel, psychiatrists, psychologists, socialworkers, nursepractitioners, evalencounter, psychencounter, ptsd_ebpsyeligible, pe_initial_appoints, cpt_initial_appoints, site_yq, sta6acomplexity, tmh, psychmmencounter, groupencounter, mmencounter, casemanagement, telephoneencounter, otherencounter, depression_ebpsyeligible, cbt_d_initial_appoints, act_initial_appoints, ipt_initial_appoints)
  
```



##create new dataframe that merges the two datasets on the site_yq variable
```{r}
merge.df <- merge.data.frame(compsub.df, dropout.df, by = "site_yq")
summary (merge.df)
```

-------------------------------------------------------------------

##Because our collaborators requested a merged dataset to work with on their own, I have also saved a merged dataset in our folder, so occasionally I shortcut to this step of the process and read in the merged dataset:
```{r}
write.csv(merge.df, "Mod Data/merged.csv")
#merge.df <- read.csv(file="merge.csv", header=TRUE)

##  If you created  a csv file within this batch of code, then it should be written into your script, and it should be saved into the "Mod Data" folder to ensure that others know that this is not an original source file

```


##Generate another dataframe that is the comparator.df minus the selection that was merged (with the CPT dataset), in order to compare the CPT sites with other sites (i.e., CDW minus CPT; compare X with 1 - X)

```{r}
#cdw_minus_merge.df <- anti_join(comparator.df, merge.df, by= "site_yq")
cdw_minus_merge.df <- anti_join(compsub.df, dropout.df, by= "site_yq")
  ## Isn't the comparator data used to create the merged the compsub?
  ## Why use the full comparator instead of the filtered version?
  ## Why do the anti_join with merged.df instead of the dropout.df?
```

## Examine the several datasets:
# comparator.df has 182880 observations of 42 variables
# compsub.df has 19856 observations of 31 variables
# dropout.df has 4749 observations of 88 variables
# merge.df has 2882 observations of 118 variables [31 (n of variables in compsub) + 88 (n of variables in dropout) - 1 (duplicated variable site_yq that the merge was conducted on)]
# cdw_minus_merge.df = 177085 observations of 42 variables
# I'm not exactly sure why the number of observations in cdw/comparator (182880) minus the merge (2882), which is 179998 does not equal the number of observations in cdw_minus_merge (177085).  In other words, the cdw_minus_merge has 2913 fewer observations than I expected.



