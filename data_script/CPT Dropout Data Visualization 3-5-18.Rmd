---
title: "CPT Dropout Descriptives"
author: "Joyce Yang"
date: "March 5, 2018"
output:
  html_document:
    df_print: paged
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Setting up the R environment and datasets
```{r}
#clear memory - this helps to remove the environment before beginning each session in case there are objects etc. already stored
rm(list=ls()) 

#set working directory - this is the team PSD R folder that the packages are stored in; helps with being able to load packages on VA computers for me
setwd("//vhapalmpncptsd1/Shared Research/TeamPSD/R")

#check working directory - ensure that the working directory was accurately set
getwd()

# Packages required for merging CDW and CPT - although it would be good to load tidyverse, i have been unable to do that on VA computers; also ggplot2 is having a hard time as well

library(magrittr)
library(lubridate)
library(dplyr)
library(psych)

#set up both files as dataframes - this comparator file is the main comparator file from November 23, 2016. The dropout file is the CPT dropout data from our collaboration

comparator.df <-read.csv(file="comparatorsites_nov23_16.csv", header=TRUE) 
dropout.df <- read.csv(file="dropout.csv",header=TRUE) 

#set all variable names as lower case - this assists in coding later on in order to not have confusion about whether the variable names are upper or lower case. especially an issue in the comparator dataset where some variables are named things like socialWorkers (random capital W)

names(comparator.df) <- tolower(names(comparator.df))
variable.names(comparator.df)

names(dropout.df) <- tolower(names(dropout.df))
variable.names(dropout.df)

variable.names(comparator.df)
variable.names(dropout.df)

```



##create combined variable in comparator.df based on the variable 'year' and the variable 'quarter'
```{r}
comparator.df <- comparator.df %>% 
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
         year_q = paste0(year, "-", quarter)) %>% 
  mutate(site_yq = paste0(sta6a,"-",year_q)) 
```

##select the subset of comparator that we want to work with. this is the place to add more variables in the select statement easily based on what we want to work with afterwards.

```{r}

compsub.df <- comparator.df %>%
  filter(quarter != "Q5") %>%
  filter(level == "sta6a") %>%
  filter(stopcode == "ALL") %>% 
select(level, stopcode, quarter, year, sta6a, totalencounters, patientpanel, providerpanel, psychiatrists, psychologists, socialworkers, nursepractitioners, evalencounter, psychencounter, ptsd_ebpsyeligible, pe_initial_appoints, cpt_initial_appoints, site_yq, sta6acomplexity, tmh, psychmmencounter, groupencounter, mmencounter, casemanagement, telephoneencounter, otherencounter, depression_ebpsyeligible, cbt_d_initial_appoints, act_initial_appoints, ipt_initial_appoints)
  
```


##create new dataframe that merges the two datasets on the site_yq variable
```{r}
merge.df <- merge.data.frame(compsub.df, dropout.df, by = "site_yq")
summary (merge.df)
```

##Set variables as numeric in order to manipulate later
```{r}
#set up in merged dataframe

merge.df$level <- as.numeric(merge.df$level)
merge.df$stopcode<-as.numeric(merge.df$stopcode)
merge.df$totalencounters<-as.numeric(merge.df$totalencounters)
merge.df$patientpanel<-as.numeric(merge.df$patientpanel)
merge.df$providerpanel<-as.numeric(merge.df$providerpanel)
merge.df$psychiatrists<-as.numeric(merge.df$psychiatrists)
merge.df$psychologists<-as.numeric(merge.df$psychologists)
merge.df$socialworkers<-as.numeric(merge.df$socialworkers)
merge.df$evalencounter<-as.numeric(merge.df$evalencounter)
merge.df$psychencounter<-as.numeric(merge.df$psychencounter)
merge.df$ptsd_ebpsyeligible<-as.numeric(merge.df$ptsd_ebpsyeligible)
merge.df$pe_initial_appoints<-as.numeric(merge.df$pe_initial_appoints)
merge.df$cpt_initial_appoints<-as.numeric(merge.df$cpt_initial_appoints)
merge.df$sta6acomplexity<-as.numeric(merge.df$sta6acomplexity)
merge.df$tmh<-as.numeric(merge.df$tmh)
merge.df$psychmmencounter<-as.numeric(merge.df$psychmmencounter)
merge.df$groupencounter<-as.numeric(merge.df$groupencounter)
merge.df$mmencounter<-as.numeric(merge.df$mmencounter)
merge.df$casemanagement<-as.numeric(merge.df$casemanagement)
merge.df$telephoneencounter<-as.numeric(merge.df$telephoneencounter)
merge.df$otherencounter<-as.numeric(merge.df$otherencounter)
merge.df$depression_ebpsyeligible<-as.numeric(merge.df$depression_ebpsyeligible)
merge.df$cbt_d_initial_appoints<-as.numeric(merge.df$cbt_d_initial_appoints)
merge.df$act_initial_appoints<-as.numeric(merge.df$act_initial_appoints)
merge.df$ipt_initial_appoints<-as.numeric(merge.df$ipt_initial_appoints)

#set up in original CDW comparator dataframe in order to make comparisons 

comparator.df$level <- as.numeric(comparator.df$level)
comparator.df$level<-as.numeric(comparator.df$level)
comparator.df$stopcode<-as.numeric(comparator.df$stopcode)
comparator.df$totalencounters<-as.numeric(comparator.df$totalencounters)
comparator.df$patientpanel<-as.numeric(comparator.df$patientpanel)
comparator.df$providerpanel<-as.numeric(comparator.df$providerpanel)
comparator.df$psychiatrists<-as.numeric(comparator.df$psychiatrists)
comparator.df$psychologists<-as.numeric(comparator.df$psychologists)
comparator.df$socialworkers<-as.numeric(comparator.df$socialworkers)
comparator.df$evalencounter<-as.numeric(comparator.df$evalencounter)
comparator.df$psychencounter<-as.numeric(comparator.df$psychencounter)
comparator.df$ptsd_ebpsyeligible<-as.numeric(comparator.df$ptsd_ebpsyeligible)
comparator.df$pe_initial_appoints<-as.numeric(comparator.df$pe_initial_appoints)
comparator.df$cpt_initial_appoints<-as.numeric(comparator.df$cpt_initial_appoints)
comparator.df$sta6acomplexity<-as.numeric(comparator.df$sta6acomplexity)
comparator.df$tmh<-as.numeric(comparator.df$tmh)
comparator.df$psychmmencounter<-as.numeric(comparator.df$psychmmencounter)
comparator.df$groupencounter<-as.numeric(comparator.df$groupencounter)
comparator.df$mmencounter<-as.numeric(comparator.df$mmencounter)
comparator.df$casemanagement<-as.numeric(comparator.df$casemanagement)
comparator.df$telephoneencounter<-as.numeric(comparator.df$telephoneencounter)
comparator.df$otherencounter<-as.numeric(comparator.df$otherencounter)
comparator.df$depression_ebpsyeligible<-as.numeric(comparator.df$depression_ebpsyeligible)
comparator.df$cbt_d_initial_appoints<-as.numeric(comparator.df$cbt_d_initial_appoints)
comparator.df$act_initial_appoints<-as.numeric(comparator.df$act_initial_appoints)
comparator.df$ipt_initial_appoints<-as.numeric(comparator.df$ipt_initial_appoints)


```

##Describe variables within CDW and CPT datasets in order to understand measures of frequency, central tendency, range, and change over time. All comparator visualizations will be in blue and the CPT visualizations in red.

##1. Sta6aComplexity
Sta6aComplexity is a variable with the following possible values: Values: 1,2,3,999 describing the complexity of a facility, where the level 1 facilities are the most complex and the level 3 facilities are the least complex.  The complexity score is using an algorithm including variables such as ICU levl, number of residents, research dollars, presence of complex clinical programs usch as SCI, blind rehab, caridac surgery, etc. For more, see: http://opes.vssc.med.va.gov/Pages/Default.aspx

```{r}
describe(merge.df$sta6acomplexity)

#Comparing sta6acomplexity in CPT merged database versus original CDW database

xtabs(~sta6acomplexity, data=merge.df)
xtabs(~sta6acomplexity, data=comparator.df)

#Visualize
hist(comparator.df$sta6acomplexity, col='blue')
hist(merge.df$sta6acomplexity, col='red')
```

*#Is the distribution of complexity ratings within the CDW different from the distribution of complexity ratings in the CPT data?* Unable to run chi square on distribution as is due to differing number of rows (182880 in CDW and 2882 in CPT). Generated matrix manually in order to run chi square.
```{r}
#complexity_cdwcpt.data <- data.frame(merge.df$sta6acomplexity, comparator.df$sta6acomplexity)
#complexity_cdwcpt.data = table(merge.df$sta6acomplexity, comparator.df$sta6acomplexity)
#print(complexity_cdwcpt.data)
#print(chisq.test(complexity_dropout.data)) 

#generate table with values from describe and xtabs of complexity variables
complexity_dropout <- matrix(c(36327, 2074, 9429, 453, 9569, 341, 127555, 14), ncol=4)
colnames(complexity_dropout) <- c('1', '2', '3', '999')
rownames(complexity_dropout) <- c('CDW', 'CPT')
complexity_dropout_table <- as.table(complexity_dropout)
print(complexity_dropout_table)

#set matrix as chi square data
complexity_dropout.data <- complexity_dropout_table

#run chi square
print(chisq.test(complexity_dropout.data))
```
###Yes; distribution of complexity appears to be different in CDW and CPT databases

*#Re-running chi-square analysis removing the missing data values since missingness in CDW is much greater; can discuss later whether these are true zeros or random zeros

```{r}
complexity_dropout <- matrix(c(36327, 2074, 9429, 453, 9569, 341), ncol=3)
colnames(complexity_dropout) <- c('1', '2', '3')
rownames(complexity_dropout) <- c('CDW', 'CPT')
complexity_dropout_table <- as.table(complexity_dropout)
print(complexity_dropout_table)

#set matrix as chi square data
complexity_dropout.data <- complexity_dropout_table

#run chi square
print(chisq.test(complexity_dropout.data))
```
###Distribution of complexity is Still significantly different


###Does complexity (1,2,3,4,5 categorical IV) predict dropout (0 =No or 1 = Yes, categorical DV)? compute chi square
```{r}
complexity_dropout.data <- data.frame(merge.df$sta6acomplexity, merge.df$dropout)

complexity_dropout.data = table(merge.df$sta6acomplexity, merge.df$dropout)

print(complexity_dropout.data)

print(chisq.test(complexity_dropout.data))
 

```
###Yes; dropout appears to differ based on complexity

##2. "Busyness" or total encounters recorded for each site. This is a continuous count variable ranging from 1 - 53681.
Total encounters in Original CDW database
```{r}

describe(comparator.df$totalencounters)
```


Totalencounters in CPT merged database
```{r}
describe(merge.df$totalencounters)
```

Visualizing both
```{r}
hist(comparator.df$totalencounters, col='blue')
hist(merge.df$totalencounters, col='red')
```
#Do total encounters differ over time? Examine encounter data by quarter. It is  possible to examine encounters by quarter in the compartor data; however in the merged dataset, we chose to select for only Q5 so as not to repeat values of Q1-4. If this is interesting, I can also do this.

#Data in comparator dataset is aggregated from Q1 - Q5, must select out Q5
```{r}
encountersub.df <- comparator.df %>%
  filter(quarteryear !="2011Q5") %>%
  filter(quarteryear !="2012Q5") %>%
  filter(quarteryear !="2013Q5") %>%
  filter(quarteryear !="2014Q5") %>%
  filter(quarteryear !="2015Q5") %>%
  filter(quarteryear !="2016Q5") %>%
  filter(quarteryear !="")%>%
  select(quarteryear, totalencounters)

summary(encountersub.df)

#Plot yearquarters on x axis and total encounters on y axis
plot(encountersub.df$quarteryear, encountersub.df$totalencounters, col='blue')
```
##I believe I successfully masked the Q5 scores based on the following datachecks:
```{r}
summary(encountersub.df)
head(encountersub.df)
```
#One can see that there is no longer a 2012Q5. However for some reason that still shows up in the x-axis label. It is not clear to me why that is the case.

##NB: I spent some time trying to plot using ggplot - continuously having difficulty with the ggplot package on VA computers, so I am unable to use commands from ggplot still (after troubleshooting for over an hour). I also attempted to use smoothScatter from KernSmooth package; this was recommended for datasets with large Ns. However, I found that this was difficult to distinguish mild shifts in color. So, for now, I am just sharing a bare bones plot of the encounter data over quarters to assist us in visualization; if necessary, I can explore this further.


###3. PTSD encounters within the merged dataset. Variables present in the dataset are # of initial PE appointments scheduled,  # of initial CPT appointments scheduled (as numerators) and # of PTSD EBPsy eligible patients (denominator)

#examine PE initial appointments: this is a continuous variable ranging from 1-129
```{r}
describe(merge.df$pe_initial_appoints)
```


#I explored several different graphical representations including "continuous" histogram options and scatterplots and thought that a density plot might organize the visualization better. All density plots have the count of the variable of interest on the X-axis, with frequency/density on the y-axis
```{r}

plot(density(merge.df$pe_initial_appoints))

#can also generate this visualization with a histogram that has the density lines drawn over it if that seems useful. Example code is here:

#hist(merge.df$pe_initial_appoints, prob=TRUE, col="grey")# prob=TRUE for probabilities not counts

#lines(density(merge.df$pe_initial_appoints), col="blue", lwd=2) # add a density estimate with defaults

#lines(density(merge.df$pe_initial_appoints, adjust=2), lty="dotted", col="darkgreen", lwd=2)

```

#examine CPT initial appointments
```{r}
describe(merge.df$cpt_initial_appoints)
```

```{r}

plot(density(merge.df$cpt_initial_appoints))
```
#examine PTSD EBPsy eligible (the denominator)

```{r}
describe(merge.df$ptsd_ebpsyeligible)
```

```{r}

plot(density(merge.df$ptsd_ebpsyeligible))
```

#calculating a ratio of EBPsy PTSD scheduled over those eligible where the numerator is the sum of the two ebspy appointments and the denominator is the number of those eligible
```{r}
merge.df$ebpsyptsdratio <- ((merge.df$pe_initial_appoints + merge.df$cpt_initial_appoints) / merge.df$ptsd_ebpsyeligible)

describe(merge.df$ebpsyptsdratio)
```
#This is interesting because for some reason the range on this proportion is so large. Although the max numbers for PE & CPT initial appointments are 129 and 228 (respectively) while the max for the eligibility is a much larger number 4147 (ostensibly all 3 have face vailidity), there appear to be some ratio values that greatly exceed 1, i.e., max = 71.4.  I'm not sure how best to inspect this but we will need to.
```{r}

plot(density(merge.df$ebpsyptsdratio))
```
###4. PTSD encounters within the comparator dataset, examining them as a function of time as well. (Again, variables present in the dataset are # of initial PE appointments scheduled,  # of initial CPT appointments scheduled (as numerators) and # of PTSD EBPsy eligible patients (denominator))

#I'm using the same code as above in order to remove Q5 from the yearquarter information in the comparator dataset
```{r}
encountersub.df <- comparator.df %>%
  filter(quarteryear !="2011Q5") %>%
  filter(quarteryear !="2012Q5") %>%
  filter(quarteryear !="2013Q5") %>%
  filter(quarteryear !="2014Q5") %>%
  filter(quarteryear !="2015Q5") %>%
  filter(quarteryear !="2016Q5") %>%
  filter(quarteryear !="")%>%
  select(quarteryear, totalencounters, pe_initial_appoints, cpt_initial_appoints, ptsd_ebpsyeligible)
```

#Plot yearquarters on x axis and ptsd encounters on y axis
#beginning with PE appointments
```{r}
plot(encountersub.df$quarteryear, encountersub.df$pe_initial_appoints, col='blue')
```
CPT appointments
```{r}

plot(encountersub.df$quarteryear, encountersub.df$cpt_initial_appoints, col='blue')
```
##I am not that clear on how to interpret this box/whisker plot at the moment with the data prior to 2014Q3 so 
