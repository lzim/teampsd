## Project: CPT Collaboration
## Purpose: Merge CDW administrative data and CPT dropout data
## Author: Joyce Yang
## Date: 2017/12/19
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

# Recommend require magrittr if error related to pipe operator is produced
#require(magrittr)

############################################################

# test savet's code for pipe operator

data1 <- data.frame(A= rep(c("Tim", "Susan", "Bob"), each= 3), B= rep(c(1:3), each =3))
data2 <- data.frame(A= c("Tim","Bob","C", "D","D"), C= c(2:6))

#test for creation
data1
data2

#try pipe operator
data1a <- data1 %>%  mutate(A = as.character(A),     C = paste0(A, B)) 

#test for data1a
data1a

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

#attach the dropout df in order to work with individual variables
attach(dropout2.df)

#change the format of DATE_1 into something readable by lubridate package
as.Date.character(DATE_1, "%m/%d/%y")

summary(DATE_1)

#create combined variable in dropout2.df

dropout2.df <- data2 %>% 
  mutate(year = year(DATE_1), 
                    quarter = quarter(DATE_1), 
                   year_q = paste0(year, "-", quarter)) %>% 
group_by(sta6a,year_q) %>% 
summarise(obs = n()) %>% 
mutate(site_yq = paste0(sta6a,"-",year_q)) 








                    