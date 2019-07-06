---
title: 'Team Time Report 3 CC’
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

2. Copy + Paste necessary sections of below in the RMarkdown file created in #1 based on which TeamTime Report is being produced (look for places in code indicating where to stop for each tt report).

3. Set working directory in RStudio to the location of the RMarkdown file from #2.  

4. Add the below items to the same working directory as #3. For instructions on where to find these items, check out the [tt_report READ.ME file](https://github.com/lzim/teampsd/tree/master/quant_workgroup/tt_report):
   + "mtl_menu.csv"
   + "ModelParameters.xlsx"
   + "agg_bc.xlsx"
   + "agg_exp1.xlsx"
   + "agg_exp2.xlsx" 
   + "agg_exp3.xlsx"
   + "pchart_data.xlsx"
   + "tt_title.png"
   
5. In the code copied in RMarkdown, update the first chunk called "{r filters}" to specify team location (tm) and start date (launch_date) of MTL launch with this team.

6. In the code copied in RMarkdown, add the TeamTime Report # and Team Vision.

7. Click on the dropdown next to "Knit" in RStudio. Click on "Knit to HTML."

8. Click on "Open in Browser" once the code finishes running and the report pops up.

9. In your browser, hit "Ctrl + P" to print and either "Print" or "Save as PDF" (name file as teamname _ tt# _ modulename i.e. teamabe_tt3_agg).

------------------------------------------------------------------------------------------------------------------

---
output:
     html_document: default 
---

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

## Team Data Table - Care Coordination Module

```{r cc_setup, include=FALSE}
ccpar <- read_excel("ModelParameters.xlsx", sheet = "CCParams", col_names = paste("X",1:3, sep = "__"), range = "A1:C12")

stu <- c("(wks)", "(appt/wk)", "(wks)", "","(pts/wk)", "(wks)")
ccpar.table <- ccpar[c(12,10,5,3,1,7),1:3] %>% # Select row and order to match UI
  mutate(X__2 = formatC(X__2, digits = 2, format = "f"),
         X__1 = sub(" in CC", "", X__1),
         X__1 = paste0(X__1, stu))


```

#### CC Table without definition (similar to the UI)

```{r cc_table_NOdef, echo=FALSE}

htmlTable(ccpar.table[,-3], header = c("",""), rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lr")
```

#### CC Table with definition

```{r cc_table_def, echo=FALSE}
htmlTable(ccpar.table, header = c("","",""), rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lrl")
```

<P style="page-break-before: always">
     
(STOP HERE FOR tt1 and delete this text)

## Sim UI Experiments - Care Coordination Module

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
  dt <- read_excel(files[x], col_names = TRUE, range = "A17:DA47")
  dt <- dt %>%
    mutate(file_name = files[x],
           Experiment = sub(".*_(.*)\\.xls.*", "\\1", file_name),
           Experiment = replace(Experiment, Experiment == "bc", "Base Case"),
           Experiment = replace(Experiment, Experiment == "exp1", "Experiment 1"),
           Experiment = replace(Experiment, Experiment == "exp2", "Experiment 2"),
           Experiment = replace(Experiment, Experiment == "exp3", "Experiment 3"),
           Model = sub("^(.*)_.*", "\\1", file_name))%>%
    select(-file_name) %>%
    group_by(`Model Variables`) %>%
    mutate(n = row_number(),
           mv2 = paste0(`Model Variables`,"_",n)) %>%
    select(-n) %>%
    ungroup() %>%
    gather(week, values, - c(Model, Experiment, mv2, `Model Variables`)) %>%
  mutate(week = gsub(".* (\\d+)$", "\\1", week),
         week = as.numeric(week)) %>%
  filter(!(`Model Variables` %in%  unique(dt$`Model Variables`[is.na(dt$`Week 1`)]))) %>%
  separate(`Model Variables`, c("Services", "Variables"), " - ") %>%
    select(Model, Experiment, everything())
}

sim_list <- lapply(1:length(files), sim_read)
sim <- do.call("rbind", sim_list)


bc <- read_excel(files[grep("bc", files)], col_names = paste("X",1:2, sep = "__"), range = "A37:B47")


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
  filter(!(mv2 %in% c("Engagement Duration_1", "Referral Rate_1"))) %>%
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
#### Compare Services: Booking Rate

```{r graphs, echo=FALSE}
sim %>%
  filter(Services == "Booking Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Appointments in CC

```{r graphs2, echo=FALSE}
sim %>%
  filter(Services == "Appointments in CC")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Completing Rate

```{r graphs3, echo=FALSE}
sim %>%
  filter(Services == "Completing Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Referral Rate

```{r graphs4, echo=FALSE}
sim %>%
  filter(Services == "Referral Rate")  %>%
  filter(mv2 != "Referral Rate_1") %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Waiting to Start

```{r graphs5, echo=FALSE}
sim %>%
  filter(Services == "Waiting to Start")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Starting Rate

```{r graphs6, echo=FALSE}
sim %>%
  filter(Services == "Start Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

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


```{r mpd_graph, echo=FALSE }
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
