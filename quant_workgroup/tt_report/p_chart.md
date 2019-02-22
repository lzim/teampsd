---
title: 'Team Data Table: p-chart'
author: "Savet Hong"
date: "`r format(Sys.Date(), '%b %d, %Y')`"
output: html_document
---

To use the code in this Rmarkdown for each Team/Model in separate Rmarkdown, please do as follow:
  
- ensure that all library packages (as listed in the library chunk) are installed
- copy chuck containing R libraries 
- copy appropriate section of code
+ datafile, setup, output for each model
+ table for base and experiment(s)
- include "teamsprepostEBPsy.xlsx", if not then change file pathway to the data source    

```{r library, include=FALSE}
library(readxl)
library(plyr)
library(dplyr)
library(tibble)
library(tidyr)
library(ggplot2)
library(htmlTable)
library(zoo)

```


## ALL Data

```{r all_setup, include=FALSE}
dt <- read_excel("teamsprepostMayEBPsy.xlsx", sheet = "Sheet1")

dt_fmt <- dt %>%
  filter(!is.na(team)) %>%
  mutate(templatecount = as.numeric(templatecount)) %>%
  mutate_at(vars(templatecount: diagvisitcount), funs(replace(., is.na(.), 0))) %>%
  mutate(pct = templatecount / diagvisitcount,
         Date = as.Date(paste(year, month, "01", sep = "-"))
         )%>%
  select(Date, team, pct) %>%
  filter(Date >= as.Date("2014-11-01"))
    ## True pre-condition is April 2014- Mar 2015; however data doesn't exist until Nov 2014
    ## Mixed Precondition:  Nov 2014 - Oct 2015 


dt_yr1mn_sub <- dt_fmt %>%
  group_by(team) %>%
  filter(Date <= as.Date("2015-10-01")) %>%
  mutate(avg_yr1 = mean(pct),
         ucl_yr1 = avg_yr1 + 3*sd(pct),
         lcl_yr1 = avg_yr1 - 3*sd(pct)) %>%
  filter(row_number() == 1,
         team != "Stockton") %>%
  select(-Date, -pct)


dt_yr1mn_all <- dt_fmt %>%
  group_by(team) %>%
  filter((Date >= as.Date("2016-10-01")) & (Date <= as.Date("2017-09-01")) ) %>%
      ## Stockton Launch was October 2017: therefore, precondition is Oct 2016-Sept 2017
  mutate(avg_yr1 = mean(pct),
         ucl_yr1 = avg_yr1 + 3*sd(pct),
         lcl_yr1 = avg_yr1 - 3*sd(pct)) %>%
  filter(row_number() == 1,
         team == "Stockton") %>%
  select(-Date, -pct) %>%
  rbind(dt_yr1mn_sub)

  
dt_lims <- dt_fmt %>%
  left_join(dt_yr1mn_all, by = "team") %>%
  mutate(team = gsub("([a-z])([A-Z])", "\\1 \\2", team)) %>%
  gather(type, Percentage, -Date, -team) %>%
  filter(team != "wcc") %>%
  filter(team != "VAPAH") %>%
  mutate(type = replace(type, type == "avg_yr1", "average (first year)" ),
         type = replace(type, type == "ucl_yr1", "UCL (first year)"),
         type = replace(type, type == "lcl_yr1", "LCL (first year)"),
         type = replace(type, type == "pct", paste0(team[type == "pct"], " Data")),
         Percentage = round(Percentage * 100,0),
         team = factor(team, levels = c("Other", "Menlo Park", "Stockton")),
         team2 = mapvalues(team, from = c("Other", "Menlo Park", "Stockton"), 
                          to = c("Other 7 clinics from the same HCS", 
                                 "PSD Partner Clinic 1", "MTL Partner Clinic 2")))

dt_shd <- data.frame(team = unique(dt_lims$team),
                     team2 = unique(dt_lims$team2),
                     xmin=as.Date("2014-11-01"), 
                     xmax=as.Date("2015-10-01"), 
                     ymin=-Inf, ymax=Inf) %>%
  mutate(xmin = replace(xmin, team == "Stockton", as.Date("2016-10-01")),
         xmax = replace(xmax, team == "Stockton", as.Date("2017-09-01")))


## Color Palette
# vacol <- c("#003F72", "#0083BE", "#C4262E", "#772432", "#598527", "#f3cf45","#f7955b","#839097",
#              "#dcddde", "#cccc99", "#bec292")

vacol <- c( "average (first year)" = "#C4262E",
            "LCL (first year)" = "#685BC7",
            "UCL (first year)" = "#598527",
            "Other Data" = "#0083BE",
            "Menlo Park Data" = "#0083BE",
            "Stockton Data" = "#0083BE" )
```

<!---
#### All location data

```{r all_graph, echo=FALSE, include=FALSE }

ggplot(dt_lims[grep("Data", dt_lims$type),], aes(x = Date, y = Percentage, group = team, colour = team)) +
  geom_line() + 
  scale_color_manual(values = vacol) +
  labs( y = "Evidence-based Psychotherapy (%)") +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") 

```

```{r all_graph_shd, echo=FALSE }
ggplot(dt_lims[grep("Data", dt_lims$type),], aes(x = Date, y = Percentage, group = team, colour = team)) +
  geom_line() + 
  scale_color_manual(values = vacol[3:5]) +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  labs( y = "Evidence-based Psychotherapy (%)") +
  geom_rect(data = dt_shd, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw()

```

#### All location data: no legend
```{r all_graph_fct, echo=FALSE, include=FALSE }


  ggplot(dt_lims, aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  scale_color_manual(values = vacol, guide = FALSE) +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  facet_grid(. ~ team) +
  labs(x = "")

```

--->

#### All location data: with legend

```{r all_graph_fct2, echo=FALSE }


  ggplot(dt_lims, aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)")) +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  facet_grid(. ~ team) +
  labs(x = "", y = "Evidence-based Psychotherapy (%)") +
  geom_rect(data = dt_shd, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank(), axis.text.x = element_text(angle = 90, hjust = -1)) 
   
  
```

```{r all_graph_fct3, echo=FALSE }


  ggplot(dt_lims, aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)"))  +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  facet_grid(. ~ team2) +
  labs(x = "", y = "Evidence-based Psychotherapy (%)") +
  geom_rect(data = dt_shd, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank(), axis.text.x = element_text(angle = 90, hjust = -1)) 
   
  
```

## Individual Location Data
#### Menlo Park


```{r mpd_graph, echo=FALSE }

dt_lims %>%
  filter(team == "Menlo Park") %>%
  ggplot(aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)")) +
  guides(colour = guide_legend(reverse=T)) +
  labs( y = "Evidence-based Psychotherapy (%)") +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  geom_rect(data = dt_shd[dt_shd$team == "Menlo Park",], aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.title=element_blank())

```

#### Stockton

```{r stc_graph, echo=FALSE }
dt_lims %>%
  filter(team == "Stockton") %>%
  ggplot(aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  labs( y = "Evidence-based Psychotherapy (%)") +
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)"))  +
  guides(colour = guide_legend(reverse=T)) +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  geom_rect(data = dt_shd[dt_shd$team == "Stockton",], aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.title=element_blank())
  
```

#### Other
```{r va_graph, echo=FALSE }
dt_lims %>%
  filter(team == "Other") %>%
  ggplot(aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  labs( y = "Evidence-based Psychotherapy (%)") +
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)"))  +
  guides(colour = guide_legend(reverse=T)) +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  geom_rect(data = dt_shd[dt_shd$team == "Other",], aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.title=element_blank())
```

