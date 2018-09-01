---
title: "CPT Dropout Descriptives"
author: "Joyce Yang"
date: "March 12, 2018"
output:
  word_document: default
  pdf_document: default
  html_document:
    df_print: paged
---
#update March 16, 2018

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Setting up the R environment and datasets
```{r}
#clear memory 
rm(list=ls()) 

#set working directory
setwd("set to your own WD; masked for safety")

#check working directory
getwd()

# Packages required for merging CDW and CPT

library(magrittr)
library(lubridate)
library(dplyr)
library(psych)
```

#library(ggplot2) unable to install ggplot: see error message
```{r}
#install.packages("ggplot2")
#library(ggplot2)
```
##ggplot2 continuously will not load for me on VA computers. I'm not sure if anyone else has had this issue. The R version that is running on my computer:
```{r}
version
```
The R version running on my computer is 3.4.2; is it possible that this has something to do with it? Lindsey can you tell me what version of R you are running? I'm concerned that requesting an administrative re-installation may cause additional code problems, please let me know what you think.

```{r}
#set up both files as dataframes
comparator.df <- read.csv(file="ENTER ACTUAL FILE NAME.csv", header=TRUE) 
dropout.df <- read.csv(file="ENTER ACTUAL FILE NAME.csv",header=TRUE) 

#set all variable names as lower case
names(comparator.df) <- tolower(names(comparator.df))
variable.names(comparator.df)

names(dropout.df) <- tolower(names(dropout.df))
variable.names(dropout.df)

variable.names(comparator.df)
variable.names(dropout.df)

```

```{r}
##Set variables as numeric in order to manipulate later
#set up in original CDW 

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

##FYI sometimes there is a bug where the select code results in a new dataset that has the 31 variables called for, but zero observations. Although this exact code was how I generated the 

#This code may no longer be necessary; however if the variables' numeric quality did not get transfered, below is code to set it as numeric.
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

```

##Describe variables within CDW and CPT datasets in order to understand measures of frequency, central tendency, range, and change over time. All comparator visualizations will be in blue and the CPT visualizations in red.

##1. Sta6aComplexity
Sta6aComplexity is a variable with the following possible values: Values: 1,2,3,999 describing the complexity of a facility, where the level 1 facilities are the most complex and the level 3 facilities are the least complex.  The complexity score is using an algorithm including variables such as ICU levl, number of residents, research dollars, presence of complex clinical programs usch as SCI, blind rehab, caridac surgery, etc. For more, see: http://opes.vssc.med.va.gov/Pages/Default.aspx



```{r}

describe(merge.df$sta6acomplexity)


#Comparing sta6acomplexity in CPT merged database versus original CDW database

xtabs(~sta6acomplexity, data=merge.df)
xtabs(~sta6acomplexity, data=comparator.df)

```
```{r}
#Visualize
par(mfrow=c(1,2)) 
hist(comparator.df$sta6acomplexity, col='blue', main = "Sta6a in CDW", xlab ="Sta6a Complexity")
#hist(merge.df$sta6acomplexity, col='red', main = "Sta6a in CPT", xlab = "Sta6a Complexity")
```

```{r}
#Generating percentages of each frequency; entries are percentages

complexity_percentages <- matrix(c(19.86, 71.96, 5.16, 15.72, 5.23, 11.83, .001, .001, 69.73, .001), ncol=5)
colnames(complexity_percentages) <- c('1', '2', '3', '4', '5')
rownames(complexity_percentages) <- c('CDW', 'CPT')
complexity_percentages_table <- as.table(complexity_percentages)
print(complexity_percentages)
```
#Percentages appear to be very different. However, it could be due to large amount of missing data in CDW. If missingness was removed, the precentages are recalculated as follows, with the denominator as (36327+9429+9569 = 55325 instead of 182880):
```{r}
complexity_percentages_nomiss <- matrix(c(65.66, 71.96, 17.04, 15.72, 17.30, 11.83), ncol=3)
colnames(complexity_percentages_nomiss) <- c('1', '2', '3')
rownames(complexity_percentages_nomiss) <- c('CDW', 'CPT')
complexity_percentages_nomiss_table <- as.table(complexity_percentages_nomiss)
print(complexity_percentages_nomiss)
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
complexity_dropout_nomiss <- matrix(c(36327, 2074, 9429, 453, 9569, 341), ncol=3)
colnames(complexity_dropout_nomiss) <- c('1', '2', '3')
rownames(complexity_dropout_nomiss) <- c('CDW', 'CPT')
complexity_dropout_nomiss_table <- as.table(complexity_dropout_nomiss)
print(complexity_dropout_nomiss_table)

#set matrix as chi square data
complexity_dropout_nomiss.data <- complexity_dropout_nomiss_table

#run chi square
print(chisq.test(complexity_dropout_nomiss.data))
```
###Distribution of complexity is Still significantly different

#Run Fisher's exact test for proportions: on both data with missingness included and data excluding missingness
```{r}
#fisher.test(complexity_dropout)
#fisher.test(complexity_dropout_nomiss)

#The error i receive is the following: "Error in fisher.test(complexity_dropout) : FEXACT error 40.Out of workspace."
#Although it runs in my Rmarkdown, when I try to knit this file into html, it doesn't save properly, so I have put it in a hashtag here to allow the file to knit.
```
#not sure why there is an error like this; did some examination on stackoverflow etc., it appears as though this is an error others have had before; trying to correct it by manually coercing hte workspace to increase does not work either. There are some assumptions perhaps related to fishertest, e.g., "flaw in Fisher test which was based on Fishers premise that marginal totals carry no useful information". Fisher's test is meant to be used "When you have two nominal variables and want to see whether proportions of one variable are different depending on the value of the other variable". Recommendations are to use Fisher's when the sample size is small. Perhaps our sample size exceeds recommendations.

##Attempting Prop test: on both data with missigness included and data excluding missingness.

```{r}
#with missingness
CPT <- c(2074, 453, 341, 4, 10)
CDW <- c(36327, 9429, 9569, 26, 127529)
prop.test(CPT,CDW)
```
```{r}
#without missingness
CPT <- c(2074, 453, 341)
CDW <- c(36327, 9429, 9569)
prop.test(CPT,CDW)
```


###Does complexity (1,2,3,4,5 categorical IV) predict dropout (0 =No or 1 = Yes, categorical DV)? compute chi square
```{r}
complexity_dropout.data <- data.frame(merge.df$sta6acomplexity, merge.df$dropout)

complexity_dropout.data = table(merge.df$sta6acomplexity, merge.df$dropout)

print(complexity_dropout.data)

#print(chisq.test(complexity_dropout.data))
 

```
###Yes; dropout appears to differ based on complexity
```{r}
#Examining percentages of complexity and dropout:

complexity_dropout_percentages <- matrix(c(71.52, 14.29, 13.68, .15, .36, 73.15, 18.59, 7.83, .11, .33), ncol=2)
colnames(complexity_dropout_percentages) <- c("O-No dropout", "1-Dropout")
rownames(complexity_dropout_percentages) <- c("1", "2", "3", "4", "5")
complexity_dropout_percentages <- as.table(complexity_dropout_percentages)
print(complexity_dropout_percentages)
```

##2. Total encounters recorded for each site. This is a continuous count variable ranging from 1 - 53681.
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
par(mfrow=c(1,2)) 
hist(comparator.df$totalencounters, main = "Total Encounters in CDW Comparator", xlab = "Total Encounters", col='blue')
#hist(merge.df$totalencounters, main = "Total Encounters in CPT Merge", xlab = "Total Encounters", col='red')
```
#Do total encounters differ over time? Examine total encounter data by quarter. 

```{r}
par(mfrow=c(1,2)) 
#Plot yearquarters on x axis and total encounters on y axis
#plot(comparator.df$quarteryear, comparator.df$totalencounters, main = "Total Encounters in CDW Comparator", xlab = "Quarters by Year", ylab = "Total Encounters",  ylim = NULL, col='blue')

#plot(merge.df$year_q, merge.df$totalencounters, main = "Total Encounters in CPT Merge", xlab = "Quarters by Year", ylab = "Total Encounters", col='red', na.exclude)

```
##Instead of using quarteryear variable in the compsub.df selection, I had to use the variables in the original comparator and then the saved merged dataframe, as the selection was not working. (See notes above). For some reason, quarteryear was not getting transferred into the compsub.df properly (selection of CDW that we want to work with. Unclear why; attempted this several days in a row). 


##NB: I spent some time trying to plot using ggplot - continuously having difficulty with the ggplot package on VA computers, so I am unable to use commands from ggplot still (after troubleshooting for over an hour). I also attempted to use smoothScatter from KernSmooth package; this was recommended for datasets with large Ns. However, I found that this was difficult to distinguish mild shifts in color. So, for now, I am just sharing a bare bones plot of the encounter data over quarters to assist us in visualization; if necessary, I can explore this further.


###3. PTSD encounters within the merged dataset. Variables present in the dataset are # of initial PE appointments scheduled,  # of initial CPT appointments scheduled (as numerators) and # of PTSD EBPsy eligible patients (denominator)

#examine PE initial appointments: this is a continuous variable ranging from 1-129
```{r}
describe(merge.df$pe_initial_appoints)
```


#I explored several different graphical representations including "continuous" histogram options and scatterplots and thought that a density plot might organize the visualization better. All density plots have the count of the variable of interest on the X-axis, with frequency/density on the y-axis. "A Density Plot visualises the distribution of data over a continuous interval or time period. This chart is a variation of a Histogram that uses kernel smoothing to plot values, allowing for smoother distributions by smoothing out the noise. The peaks of a Density Plot help display where values are concentrated over the interval. An advantage Density Plots have over Histograms is that they're better at determining the distribution shape because they're not affected by the number of bins used (each bar used in a typical histogram)."

```{r}
par(mfrow=c(1,2)) 
#d_pe <- density(merge.df$pe_initial_appoints)
#plot(d_pe, main = "PE appointments in CPT", xlab = "PE appointments", ylab = "relative density")
#can also generate this visualization with a histogram that has the density lines drawn over it if that seems useful. 

#hist(merge.df$pe_initial_appoints, col="grey", main = "PE appointments in CPT data", xlab = "PE appointments")


```


#examine CPT initial appointments
```{r}
describe(merge.df$cpt_initial_appoints)
```

```{r}
#par(mfrow=c(1,2)) 
#d_cpt <- density(merge.df$cpt_initial_appoints)
#plot(d_cpt, main = "CPT appointments in CPT data", xlab = "CPT appointments", ylab = "relative density")

#hist(merge.df$cpt_initial_appoints, col="grey", main = "CPT appointments in CPT data", xlab = "cpt appointments")

```
#examine PTSD EBPsy eligible (the denominator)

```{r}
describe(merge.df$ptsd_ebpsyeligible)
```

```{r}
par(mfrow=c(1,2)) 
#d_ptsdeligible <- density(merge.df$ptsd_ebpsyeligible)
#plot(d_ptsdeligible, main = "PTSD EBPsy Eligible", xlab = "PTSD EBPsy Eligible", ylab = "relative density")

#hist(merge.df$ptsd_ebpsyeligible, col="grey", main = "PTSD EBPsy Eligible in CPT data", xlab = "PTSD EBpsy Eligible")


```

#calculating a ratio of EBPsy PTSD scheduled over those eligible where the numerator is the sum of the two ebspy appointments and the denominator is the number of those eligible
```{r}
merge.df$ebpsyptsdratio <- ((merge.df$pe_initial_appoints + merge.df$cpt_initial_appoints) / merge.df$ptsd_ebpsyeligible)

describe(merge.df$ebpsyptsdratio)
```
#This is interesting because for some reason the range on this proportion is so large. Although the max numbers for PE & CPT initial appointments are 129 and 228 (respectively) while the max for the eligibility is a much larger number 4147 (ostensibly all 3 have face vailidity), there appear to be some ratio values that greatly exceed 1, i.e., max = 71.4.  I'm not sure how best to inspect this but we will need to.


###4. PTSD encounters within the comparator dataset, examining them as a function of time as well. (Again, variables present in the dataset are # of initial PE appointments scheduled,  # of initial CPT appointments scheduled (as numerators) and # of PTSD EBPsy eligible patients (denominator))


#Plot yearquarters on x axis and ptsd encounters on y axis

```{r}
par(mfrow=c(1,2))
#beginning with PE appointments
plot(comparator.df$quarteryear, comparator.df$pe_initial_appoints, col='blue', main = "PE appointments in CDW")


#CPT appointments
plot(comparator.df$quarteryear, comparator.df$cpt_initial_appoints, col='blue', main = "CPT appointments in CDW")
```
