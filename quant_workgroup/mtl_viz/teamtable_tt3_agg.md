---
title: 'Team Time Report 3'
author: "TeamPSD"
date: "`r format(Sys.Date(), '%b %d, %Y')`"
output:
     html_document: default 
     word_document: default
     pdf_document:  default
---

To use the code in this Rmarkdown for each Team/Model in separate Rmarkdown, please do as follow:
  
- ensure that all library packages (as listed in the library chunk) are installed
- change the working directory in RStudio to the location of the RMarkdown and include datafiles:  
   + "mtl_menu.csv"
   + "ModelParameters.xlsx"
   + "agg_bc.xlsx"
   + "agg_exp1.xlsx"
   + "agg_exp2.xlsx" 
   + "agg_exp3.xlsx"
   + "teamsprepostMayEBPsy.xlsx"

install.packages("readxl")
install.packages("dplyr")
install.packages("tibble")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("huxtable")
install.packages("htmlTable")
install.packages("plyr")
install.packages("zoo")


```{r library, include=FALSE}
library(readxl)
library(dplyr)
library(tibble)
library(tidyr)
library(ggplot2)
library(huxtable)
library(htmlTable)
```

## MTL Menu
``` {r,echo=FALSE, fig.width=4, fig.height=4,fig.show='hold'}
#Read Data from MTL Menu
data=read.csv('mtl_menu.csv')

#Create vector of new column names using question title instead of variable descriptor
cols <- c("x",
          "y",
          "Schedule - How to manage team schedules 
          (i.e. clinics/grids) to meet patients needs.",
          "New patients - How to get new patients in care, 
          while meeting existing patients needs.",
          "Return to clinic - How return to clinic orders free 
          free us to get patients to the right treatment 
          at the right time.",
          "Overwork - How overbooking or overworking
          increases patient no shows.",
          "Psychotherapy - How to improve team psychotherapy 
          and patients' patterns of engagement.",
          "Evidence-based Psychotherapy - How to improve 
          evidence-based psychotherapy in our team.",
          "Evidence-based Pharmacotherapy - How to improve 
          evidence-based pharmacotherapy in our team.",
          "Referrals - How to manage referrals to our team and
          services (e.g. meds, therapy, group) within our team.",
          "Mix of services - How our patients engage in our 
          teams mix of services.",
          "Improvement - Which improvements will have the best 
          effects across our mix of services?",
          "Burnout - How to reduce provider burnout and improve 
          patient satisfaction with care.",
          "Staffing - How to improve team care with our 
          existing staff mix.",
          "Intake evaluations",
          "Care coordination",
          "Medication management",
          "Psychotherapy",
          "Groups",
          "Adjunctive services (i.e. art and recreation therapy, 
          peer support specialists)",
          "Depression",
          "PTSD",
          "Alcohol use disorder",
          "Opioid use disorder")
          
#Replace column names of original data set with new column name vector 
colnames(data) <- cols

#For loop for creating barplots of responses for questions with 5 point likert scale
for (x in 3:14){
par(cex.main=0.7)
barplot(table(factor(data[,x], levels = -2:2)),
        main=colnames(data)[x],
        names.arg = expression("Very High", "High", "Neutral", "Low", "Very Low"),
        cex.names=0.5,
        col="#003F72",
)
}

#For loop for creating barplots of responses for questions with 3 point likert scale
for (x in 15:24){
par(cex.main=0.7)
barplot(table(factor(data[,x], levels = -1:1)),
        main=colnames(data)[x],
        names.arg = expression("Yes", "Neutral", "No or doesn't apply"),
        cex.names=0.5,
        col="#003F72",
)
}
```

## Team Data Table - Aggregate Module
```{r agg_setup, include=FALSE}
aggpar <- read_excel("ModelParameters.xlsx", sheet = "AggParams", col_names = FALSE, range = "A1:I12")

#Table data setup
aggpar.table.head <- aggpar[c(6,2),]
aggpar.table.body <- aggpar[c(2,1,5,3,4),] %>%
  mutate_at(vars(2:8), funs(formatC(as.numeric(.),digits = 2, format = "f"))) %>%
  rename(Intake = X__2, Psy = X__3, EBPsy = X__4, CC = X__5, MM = X__6, 
         Adjunctive = X__7, Group = X__8, Variable = X__1, Definition = X__9)

aggpar.table.body.shrt <- t(aggpar.table.body[,2:8]) 
colnames(aggpar.table.body.shrt) <- aggpar.table.body$Variable

aggpar.test <- as.data.frame(aggpar.table.body.shrt) %>%
  mutate(X__1 = row.names(.)) %>%
  select(X__1, everything()) %>%
  mutate_if(is.factor,funs(as.character)) %>%
  add_row(X__1 = as.character(aggpar[6,1]), `Appointment Supply (median)` =
            as.character(round(as.numeric(aggpar[6,2]), 1)), 
          `True Missed Appointment %` = "pts/wk",.before = 1) %>%
  add_row(`Appointment Supply (median)` = "Appointment Supply (median)", 
          `True Missed Appointment %` =
            "True Missed Appointments %",`Return Visit Interval (median)` = 
            "Return Visit Interval (median)",
          `Median Engagement` = "Median Engagement", 
          `Service Proportions from Team Data` = "Service Proportions from Team Data", .before = 2) 


#Table definition
agg_def <- aggpar[c(6,2,1,5,3,4),c(1,9)]
```

#### Aggregate Table without definition (similar to the UI)

```{r agg_table, echo=FALSE}

htmlTable(aggpar.test, header = c(rep("",6)), rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lrrrr")

```
#### Aggregate Table Definition

```{r agg_table_def, echo=FALSE}
htmlTable(agg_def, header = c("Concept", "Definition"), rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data: Aggregate Table Concept Definition", align = "ll")

```

## Sim UI Experiments - Aggregate Module

```{r dtfiles, include=FALSE}
#List of files in Working Directory
files <- list.files()
files <- files[grepl("\\.xls",files)]
files <- files[-grep("ModelParameters.xlsx", files)]
files <- files[-grep("teamsprepostMayEBPsy.xlsx", files)]
# Read in files related to Experimental design
dgn_read <- function(x){
  dt <- read_excel(files[x], col_names = FALSE, range = "A12:B15")
  dt <- dt %>%
    mutate(file_name = files[x],
           Experiment = sub(".*_(.*)\\.xls.*", "\\1", file_name),
           Experiment = replace(Experiment, Experiment == "bc", "Base Case"),
           Experiment = replace(Experiment, Experiment == "exp1", "Experiment 1"),
           Experiment = replace(Experiment, Experiment == "exp2", "Experiment 2"),
           Experiment = replace(Experiment, Experiment == "exp3", "Experiment 3"),
           Model = sub("^(.*)_.*", "\\1", file_name),
           X__1 = sub("[[:punct:]]$", "", X__1)) %>%
    rename(`QHFD Process` = X__1) %>%
    select(-file_name)
  return(dt)
}
dgn_list <- lapply(1:length(files), dgn_read)
dgn <- do.call("rbind", dgn_list)
#Read in files related to graph paramenters
sim_read <- function(x){
  dt <- read_excel(files[x], col_names = TRUE, range = "A17:DA256")
  dt <- dt %>%
    mutate(file_name = files[x],
           Experiment = sub(".*_(.*)\\.xls.*", "\\1", file_name),
           Experiment = replace(Experiment, Experiment == "bc", "Base Case"),
           Experiment = replace(Experiment, Experiment == "exp1", "Experiment 1"),
           Experiment = replace(Experiment, Experiment == "exp2", "Experiment 2"),
           Experiment = replace(Experiment, Experiment == "exp3", "Experiment 3"),
           Model = sub("^(.*)_.*", "\\1", file_name))%>%
    select(-file_name) %>%
    gather(week, values, - c(Model, Experiment, `Model Variables`)) %>%
  mutate(week = gsub(".* (\\d+)$", "\\1", week),
         week = as.numeric(week)) %>%
  filter(!(`Model Variables` %in%  unique(dt$`Model Variables`[is.na(dt$`Week 1`)]))) %>%
  separate(`Model Variables`, c("Services", "Variables"), " - ") %>%
    select(Model, Experiment, everything())
}
sim_list <- lapply(1:length(files), sim_read)
sim <- do.call("rbind", sim_list)
bc <- read_excel(files[grep("bc", files)], col_names = FALSE, range = "A216:B256")
## VA Color Pallete
vacol <- c("#003F72", "#0083BE", "#C4262E", "#772432", "#598527", "#f3cf45","#f7955b","#839097",
             "#dcddde", "#cccc99", "#bec292")
```

```{r q_setup, include=FALSE}
rsh_ord <- c("Our Question", "Our Hypothesis", "Our Findings", "Our Decisions")
  
dgn <- dgn %>%
  spread(`QHFD Process`, X__2) %>%
  select( Experiment, rsh_ord)
  
```


```{r exp_setup, include=FALSE}
## Identify Changing variable
var_exp <- bc %>%
  rename(`Model Variables` = X__1, base_value = X__2) %>%
  filter(!is.na(base_value)) %>%
  mutate(Variable = `Model Variables`) %>%
  separate(`Model Variables`, c("Services", "Variables"), " - ") 
par_chng <- sim %>%
  filter(week == 1) %>%
  inner_join(var_exp, by = c("Services", "Variables")) %>%
  filter(Experiment != "Base Case") %>%
  mutate(chng = values - base_value) %>%
  filter(chng != 0) %>%
  select(Experiment, Services, Variables,Variable, values)
```


#### Team Experimental Design


```{r tab-word, echo=FALSE, warning=FALSE}
tt_ht <- hux(dgn, add_colnames = TRUE) %>%
  set_bold(1, 1:5,TRUE) %>%
  set_bottom_border(1:nrow(dgn), 1:5, TRUE) %>%
  set_wrap(TRUE)
tt_ht
```

#### Changes to Model Parameters Relative to Base Case

```{r mpar, echo=FALSE, warning=FALSE}
hux(par_chng) %>%
  select(Experiment, Variable, values) %>%
  add_colnames() %>%
  set_bold(1, 1:3,TRUE) %>%
  set_bottom_border(1, 1:3, TRUE) %>%
  set_col_width(c(0.3, 0.5, 0.2)) %>%
  set_number_format(,3,2) %>%
  map_align(by_cols("left", "left", "right"))
  
```


#### Team Graphs
#### Compare Services: Patients Waiting for Intake Evaluation

```{r graphs, echo=FALSE}
sim %>%
  filter(Variables == "Patients Waiting for Intake Evaluation")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```

#### Compare Services: Patients Waiting to Start a Service

```{r graphs2, echo=FALSE}
sim %>%
  filter(Variables == "Patients Waiting to Start a Service")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```

#### Compare Services: Patients in Service

```{r graphs3, echo=FALSE}
sim %>%
  filter(Variables == "Patients in Service")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```

#### Compare Services: Work Pressure

```{r graphs4, echo=FALSE}
sim %>%
  filter(Variables == "Work Pressure")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```

#### Compare Services: Actual Return Visit Interval

```{r graphs5, echo=FALSE}
sim %>%
  filter(Variables == "Actual Return Visit Interval")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```

#### Compare Services: Actual Hours Available for Service

```{r graphs6, echo=FALSE}
sim %>%
  filter(Variables == "Actual Hours Available for Service")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 
```



## P-Charts 
```{r all_setup, include=FALSE}
library(plyr)
library(zoo)
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

