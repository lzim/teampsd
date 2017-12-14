
# Comparator Dataset
# Concatonate Sta6, Year, and Date

# Update 12/14/2017- Base code was from Savet, Joyce adapted for PSD/CPT Collaboration
# Lindsey added working directory and package instructions to resolve an error

# Packages required to use Savet's code for merging CDW and CPT

library(tidyverse)

# Recommend require magrittr if error related to pipe operator is produced
require(magrittr)

# Set working directory to My Documents location 
# where tidyverse packages should be installed. 
# For example: setwd("//r01palhsm07.r01.med.va.gov/homedir$/VHAPALZIMMEL2/My Documents/R/win-library/3.4")
setwd()
getwd()

########################################################################################

data1 <- data.frame(A= rep(c("Tim", "Susan", "Bob"), each= 3), B= rep(c(1:3), each =3))
data2 <- data.frame(A= c("Tim","Bob","C", "D","D"), C= c(2:6))

data1a <- data1 %>%  mutate(A = as.character(A),     C = paste0(A, B)) 

## to concatenate columns together: 
data1a <- data1 %>%
  +   mutate(A= as.character(A),
             +          C = paste0(A,B))

## in CDW data, concatenate Quarter and Year variable)

file="comparatorsites_nov23_16.csv"
data=read.csv(file,header=TRUE)

comparator.df <- read.csv("comparatorsites_nov23_16.csv")

comparator.df <- comparator.df %>%
  mutate(Year_Q  = paste0(year, "-", quarter),
         site_YQ = paste0(sta6a,"-",Year_Q))

file2="dropout.csv"
data2=read.csv(file,header=TRUE)

dropout2.df <- data2

## use lubridate library to manage date information. commands like year and quarter are embedded
library(lubridate)

dropout2.df <- data2 %>%
  mutate(Year = year(Date1),
         Quarter = quarter(Date1),
         Year_Q = paste0(Year, "-", Quarter)) %>%
  group_by(sta6a,Year_Q) %>%
  summarise(obs = n()) %>% ## you may also want to consider using mutate instead of summarise
  mutate(site_YQ = paste0(sta6a,"-",Year_Q))

newdf <- merge.data.frame(comparator.df, dropout2.df, by = "site_YQ")