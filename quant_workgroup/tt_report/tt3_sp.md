---
title: 'Team Time Report 3 SP'
author: "TeamPSD"
date: "`r format(Sys.Date(), '%b %d, %Y')`"
output:
     html_document: default 
---

Instructions: To use the code in this Rmarkdown, please follow the steps below::
  
1. Click on Raw

2. To ensure all necessary packages are installed, Copy + Paste the below lines in a new RMarkdown file in R Studio and hit Enter:  
pkgs <- c("readxl", "tidyverse", "huxtable","htmlTable", "Hmisc")  
install.packages(pkgs)

3. Copy + Paste necessary sections of below in the RMarkdown file created in #1 based on which TeamTime Report is being produced (look for places in code indicating where to stop for each tt report).

4. Set working directory in RStudio to the location of the RMarkdown file from #2.  

5. Add the below items to the same working directory as #3. For instructions on where to find these items, check out the [tt_report READ.ME file](https://github.com/lzim/teampsd/tree/master/quant_workgroup/tt_report):
   + "tt_title.png"
   + "mtl_menu.csv"
   + "ModelParameters.xlsx"
   + "sp_bc.xlsx"
   + "sp_exp1.xlsx"
   + "sp_exp2.xlsx" 
   + "sp_exp3.xlsx"
   + "pchart_data.xlsx"

   
6. In the code copied in RMarkdown, update the first chunk called "{r filters}" to specify team location (tm) and start date (launch_date) of MTL launch with this team.

7. In the code copied in RMarkdown, add the TeamTime Report # and Team Vision.

8. Click on the dropdown next to "Knit" in RStudio. Click on "Knit to HTML."

9. Click on "Open in Browser" once the code finishes running and the report pops up.

10. In your browser, hit "Ctrl + P" to print and either "Print" or "Save as PDF" (name file as teamname _ tt# _ modulename i.e. teamabe_tt3_agg).

------------------------------------------------------------------------------------------------------------------


```{r filters, include=FALSE}
tm <- "MP" # Team Location
launch_date <-  "2015-11" # MTL launch date in the clinic, format must be "yyyy-mm"

## True pre-condition is April 2014- Mar 2015; however data doesn't exist until Nov 2014
## Mixed Precondition:  Nov 2014 - Oct 2015 
```

```{r library, include=FALSE}
library(tidyverse)
library(readxl)
library(huxtable)
library(htmlTable)
library(Hmisc)
```

![](tt_title.png){style="width:50%"}

# Team Time Report (insert # here)
# Team Vision: (insert team vision here)

<P style="page-break-before: always">

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
          "Suicide Prevention - How to manage 
          high risk patients.",
          "Stepped Care - How to decide when to step patients 
          up to specialty care.",
          "Stepped Care - How to decide when to step patients 
          down to primary care.",
          "Care Continuum - How to manage patient care 
          across care settings, e.g., primary care, 
          general mental health and specialty mental health.",
          "Measurement Based Care - How implementation of 
          measurement based care will improve 
          patient care or reduce patient risk.",         
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

<P style="page-break-before: always">

## Team Data Table - Suicide Prevention Module

```{r sppar_datafiles, include=FALSE}
sppar1 <- read_excel("ModelParameters.xlsx", sheet = "SPParams", col_names = paste("X", 1:4, sep = "__"), range = "A2:D45")

unique_colA <- sppar1$X__1[which(!is.na(sppar1$X__1))] #unique group (in order)
group_pos <- diff(which(!is.na(sppar1$X__1))) # position/rows between group
max.pos <- length(unique_colA) 
group_vec <- c(rep(unique_colA[-max.pos], group_pos),rep(unique_colA[max.pos], 3)) # repeat values until next occurance 
unique_colD <- sppar1$X__4[which(!is.na(sppar1$X__4))] #unique desc group (in order)
group_pos2 <- diff(which(!is.na(sppar1$X__4))) # position/rows between group
max.pos2 <- length(unique_colD)
uni_colD <- sppar1$X__4[which(!is.na(sppar1$X__4))] 
def_vec <- c(rep(uni_colD[-max.pos2], group_pos2), rep(unique_colD[max.pos2],3))

mcc <- sppar1 %>%
  mutate(X__2 = sub(" \\(threshold 39 wks\\)", "", X__2),
         group = group_vec,
         def = def_vec,
         col_lab = sub("(.*) \\(.*\\)$", "\\1", X__2),
         col_lab = sub(" %$", "", col_lab),
         col_lab2 = sub("(\\w) .*", "\\1", col_lab),
         col_lab = replace(col_lab, grepl("Threshold", col_lab), 
                           col_lab2[grepl("Threshold", col_lab)]),
         msr = sub(".* (\\(.*\\))$", "\\1", X__2),
         msr = sub(".* %", "%", msr),
         time = sub(".* (\\(.*\\))$", "\\1", group),
         time = sub("^High .*", "", time),
         group2 = sub("(.*) \\(.*\\)$", "\\1", group),
         # Adjust Lables
         time = replace(time, group2 == "New Episode of Care Wait Time", "(wks)"), 
         time = replace(time, time == "New Episode of Care Start Rate", "(pts/wk)"), 
         group2 = replace(group2, group2 == "High Risk Flag Rate", 
                          "High Risk Patient Flag Rates"), 
         time = replace(time, group2 == "High Risk Patient Flag Rates", "(pts/wk)"), 
         time = replace(time, time == "Time to Unflag High Risk Patients", "(wks)"), 
         time = replace(time, time == "Wait Time", "(wks)"), 
         group2 = replace(group2, group2 == "Wait Time", 
                         "Wait Times" ), 
         msr = replace(msr, time == "Time from Flag to Step up/down", ""),
         time = replace(time, time == "Time from Flag to Step up/down", ""),  
         time = replace(time, time == "Engagement Time Before Step up/down", "(wks)"), 
         msr = replace(msr, group2 == "Engagement Time Before Ending", 
                          "(median)"), 
         time = replace(time, group2 == "Engagement Time Before Ending", "(wks)"),
         
         time = replace(time, time == "User-supplied Gap Threshold", "(wks)"), 
         msr = replace(msr, group2 == "User-supplied Gap Threshold", "(median)"),
         time = replace(time, time == "Time to Improve", "(wks)"), 
         msr = replace(msr, group2 == "Time to Improve", ""),
         
         group = paste0(group2, " ", msr, time),
         group = trimws(group),
         col_lab = gsub("^ *|(?<= ) | *$", "", col_lab, perl = TRUE),
         col_lab = sub(" High Symptom", "", col_lab),
         group = replace(group, group == "Symptom Proportions %Symptom Proportions",
                         "Symptom Proportions (High Symptom %)")
         #def = replace(def, group2 == "New Patient Wait Time", ""),
         #def = replace(def, group2 == "Time to Improve", "")
         ) %>%
  select(group, col_lab, X__3, def) 


rw_ord1 <- c("New Episode of Care Start Rate (mean)(pts/wk)",
             "User-supplied Gap Threshold (median)(wks)",
             "New Episode of Care Wait Time (median)(wks)",
             "High Risk Patient Flag Rates (mean)(pts/wk)", 
             "Time to Unflag High Risk Patients (median)(wks)",
             "Engagement Time Before Ending (median)(wks)", 
             "Symptom Proportions (High Symptom %)",
             "Time to Improve (wks)")
mcc1 <- mcc %>%
  filter(group %in% rw_ord1) %>%
  mutate(col_lab = replace(col_lab, col_lab == "PCMHI", "PC/PCMHI")) %>%
  spread(col_lab, X__3) %>%
  slice(match(rw_ord1, group)) %>%
  select(-def, everything()) %>%
  mutate_if(is.numeric, round, 2)


col_ord2 <- c("Time from Flag to Step up/down",
             "Engagement Time Before Step up/down (median)(wks)", 
             "Wait Times (median)(wks)")
rw_ord2 <- c("GMH to PC/PCMHI", "GMH to SMH", "GMH to Residential", "PC/PCMHI to SMH", 
             "PC/PCMHI to GMH",
             "PC/PCMHI to Residential", "SMH to GMH", "SMH to PC/PCMHI", "SMH to Residential")
mcc2 <- mcc %>%
  filter(group %in% col_ord2) %>%
  select(-def) %>%
  mutate(col_lab = sub("PCMHI", "PC/PCMHI", col_lab),
         col_lab = sub("Res", "Residential", col_lab),
         col_lab = sub("PC/PC/PCMHI", "PC/PCMHI", col_lab)
         ) %>%
  spread(group, X__3) %>%
  slice(match(rw_ord2,col_lab)) %>%
  select(col_lab, col_ord2) %>%
  mutate_if(is.numeric, round, 1)

```



#### SPParam Table without definition (similar to the UI)

```{r sp_table, echo=FALSE}

htmlTable(mcc1[,-5], header = c("", names(mcc1[-c(1,5)])), cgroup = c("Measurement Based Care"), align.cgroup = "l", rnames = FALSE,  css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lccc")

```


```{r sp_table2, echo=FALSE}

htmlTable(mcc2, header = c("", names(mcc2[-1])), cgroup = c("Stepped Care"), align.cgroup = "l",, rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lccc")

```



#### SPParam Table with definition (similar to the UI)

```{r sp_table_def, echo=FALSE}

htmlTable(mcc1, header = c("", names(mcc1[-c(1,5)]),"Definition"), cgroup = c("Measurement Based Care"), align.cgroup = "l", rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lcccl")

```

<P style="page-break-before: always">
     
(STOP HERE FOR tt1 and delete this text)

## Sim UI Experiments - Suicide Prevention Module

```{r dtfiles, include=FALSE}
#List of files in Working Directory
files <- list.files()
files <- files[grepl("\\.xls",files)]
files <- files[-grep("ModelParameters.xlsx|pchart_data.xlsx", files)]

# Read in files related to Experimental design
dgn_read <- function(x){
  dt <- read_excel(files[x], col_names = paste("X",1:2, sep = "__"), range = "A12:B15")
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
  dt <- read_excel(files[x], col_names = TRUE, range = "A17:DA133")
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


bc <- read_excel(files[grep("bc", files)], col_names = paste("X",1:2, sep = "__"), range = "A101:B133")


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

<P style="page-break-before: always">

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


```{r graphs, echo=FALSE}
#### GMH Patient Load
sim %>%
  filter(Services == "GMH Patient Load")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH Patient Load")

```



```{r graphs2, echo=FALSE}
#### GMH Ratio of High to Low Symptom Patients
sim %>%
  filter(Services == "GMH Ratio of High to Low Symptom Patients")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH Ratio of High to Low Symptom Patients")

```



```{r graphs3, echo=FALSE}
#### GMH High Risk Flag Patients
sim %>%
  filter(Services == "GMH High Risk Flag Patients")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH High Risk Flag Patients")

```



```{r graphs4, echo=FALSE}
#### GMH Patients Waiting to Start
sim %>%
  filter(Services == "GMH Patients Waiting to Start")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH Patients Waiting to Start")

```



```{r graphs5, echo=FALSE}
sim %>%
  filter(Services == "GMH to SMH Recommend Step up Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH to SMH Recommend Step up Rate")

```



```{r graphs6, echo=FALSE}
#### GMH to PC/PCMHI Patients Waiting for Step down
sim %>%
  filter(Services == "GMH to PC/PCMHI Patients Waiting for Step down")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) +
  ggtitle("GMH to PC/PCMHI Patients Waiting for Step down")

```

<P style="page-break-before: always">

(STOP HERE FOR tt2 and delete this text)

## P-Charts 

```{r all_setup, include=FALSE}
#Filter setup: refer to the filter chunk at the top of this file
ldt <- seq(as.Date(paste(launch_date, "01", sep = "-")), length = 13, by = "-1 months")
edt <- ldt[2] # end date of 1 year precondition
sdt <- ldt[13] # start date of 1 year precondition
dt <- read_excel("pchart_data.xlsx", sheet = "Sheet1")
dt_fmt <- dt %>%
  filter(team == tm) %>%
  rename(templatecount = templateUniqueVisits, diagvisitcount = diagvisitcount) %>% # Rename the variable is necessary
  mutate(templatecount = as.numeric(templatecount)) %>%
  mutate_at(vars(templatecount: diagvisitcount), funs(replace(., is.na(.), 0))) %>%
  mutate(pct = templatecount / diagvisitcount,
         Date = as.Date(paste(year, month, "01", sep = "-"))
  )%>%
  select(Date, team, pct) %>%
  filter(Date >= as.Date("2014-11-01"))
dt_yr1mn <- dt_fmt %>%
  filter((Date >= sdt) & (Date <= edt)) %>%
  mutate(avg_yr1 = mean(pct),
         ucl_yr1 = avg_yr1 + 3*sd(pct),
         lcl_yr1 = avg_yr1 - 3*sd(pct)) %>%
  select(-Date, -pct) %>%
  filter(row_number() == 1)
dt_lims <- dt_fmt %>%
  left_join(dt_yr1mn, by = "team") %>%
  gather(type, Percentage, -Date, -team) %>%
  mutate(type = replace(type, type == "avg_yr1", "average (first year)" ),
         type = replace(type, type == "ucl_yr1", "UCL (first year)"),
         type = replace(type, type == "lcl_yr1", "LCL (first year)"),
         type = replace(type, type == "pct", paste0(team[type == "pct"], " Data")),
         Percentage = round(Percentage * 100,0),
         vacol = "#0083BE",
         vacol = replace(vacol, type == "average (first year)", "#C4262E"),
         vacol = replace(vacol, type == "LCL (first year)", "#685BC7"),
         vacol = replace(vacol, type == "UCL (first year)", "#598527"))
         
dt_shd <- data.frame(team = unique(dt_lims$team),
                     xmin= sdt, 
                     xmax= edt, 
                     ymin=-Inf, ymax=Inf) 
vacol <- unique(dt_lims$vacol)
names(vacol) <- unique(dt_lims$type)
```

## Individual Location Data
#### Site


```{r p_graph, echo=FALSE }
dt_lims %>%
  ggplot(aes(x = Date, y = Percentage, group = type, colour = type)) +
  geom_line() + 
  scale_color_manual(values = vacol, limits = c("LCL (first year)", "average (first year)",
                                                "UCL (first year)")) +
  guides(colour = guide_legend(reverse=T)) +
  labs( y = "Evidence-based Psychotherapy (%)") +
  scale_x_date(date_labels = "%Y %b", date_minor_breaks = "1 month") +
  geom_rect(data = dt_shd, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), 
            fill="grey", alpha=0.3, inherit.aes = FALSE) +
  theme_bw() +
  theme(legend.title=element_blank())
```