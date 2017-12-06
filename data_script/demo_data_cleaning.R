## Project: PSD
## Purpose: Demo code for Joyce
## Author: Savet Hong
## Date: 2017/12/07
## Notes:
##
#########################################

library(tidyverse)

data1 <- data.frame(A= rep(c("Tim", "Susan", "Bob"), each= 3), B= rep(c(1:3), each =3))
data2 <- data.frame(A= c("Tim","Bob","C", "D","D"), C= c(2:6))

## Demo 1: combine two columns together
data1a <- data1 %>%
  mutate(A = as.character(A),
     C = paste0(A, B)) 

## Demo 2: add up one column by another
data1b <- data1 %>%
  mutate(A = as.character(A),
         C = paste0(A, B)) %>%
  group_by(A) %>%
  summarise(tot = sum(B))

## Demo 3: merge two dataset together
data3 <- merge.data.frame(data1, data2, by.x = "A", by.y = "A", all = TRUE)

######
#  Possible use for project 
#  - based on your code in simplified_merge_code
# - and discussion 
######

comparator.df <- comparator.df %>%
  mutate(Year_Q  = paste0(Year, "-", Quarter),
         site_YQ = paste0(stat6a,"-",Year_Q))

library(lubridate)
dropout2.df <- data2 %>%
  mutate(Year = year(dropout_date),
         Quarter = quarter(dropout_date),
         Year_Q = paste0(Year, "-", Quarter)) %>%
  group_by(sta6a,Year_Q) %>%
  summarise(obs = n()) %>% ## you may also want to consider using mutate instead of summarise
  mutate(site_YQ = paste0(stat6a,"-",Year_Q))

newdf <- merge.data.frame(comparator.df, dropout2.df, by = "site_YQ")

  
  
  