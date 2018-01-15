
# Comparator Dataset
# Concatonate Sta6a, Year, and Date

# Update 1/14/2018 - Quarter updated to fiscal quarter

# Update 12/28/2017 - Code debugged and runs

## Project: CPT Collaboration
## Purpose: Merge CDW administrative data and CPT dropout data
## Author: Joyce Yang
## Date: 2017/12/28
## Notes:
##
######################################################################################
 
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
 
########################################################################
 
#set up both files as dataframes
 
file="comparatorsites_nov23_16.csv"
data=read.csv(file,header=TRUE)
 
file2="dropout.csv"
data2=read.csv(file2,header=TRUE)
 
summary(data)
summary(data2)
 
comparator.df <- data
 
dropout2.df <- data2
 
#create combined variable in comparator df
 
comparator.df <- comparator.df %>%
  mutate(year_q  = paste0(year, "-", quarter),
         site_yq = paste0(sta6a,"-",year_q))
 
#check comparator.df to make sure new variables have been created
summary(comparator.df)
 
#create combined variable in dropout2.df
 
dropout2.df <- data2 %>%

  mutate(DATE_1 = as.character(DATE_1),

         DATE_1 = as.Date(DATE_1, "%m/%d/%Y"),

    year = year(DATE_1),

                    quarter = quarter(DATE_1, with_year = FALSE, fiscal_start = 10),

                    quarter = paste0("Q", quarter),

                   year_q = paste0(year, "-", quarter)) %>%

#group_by(STA6A,year_q) %>%

#summarise(obs = n()) %>%

mutate(site_yq = paste0(STA6A,"-",year_q))

#create new dataframe that merges the two datasets on the site_yq variable
newdf <- merge.data.frame(comparator.df, dropout2.df, by = "site_yq")
 
summary (newdf)
 
str(newdf)
 
summary(comparator.df)
