---
title: 'Sim UI Experiments'
author: "TeamPSD"
date: "`r format(Sys.Date(), '%b %d, %Y')`"
output:
    html_document: default   
    word_document: default 
  
---

To use the code in this Rmarkdown for each Team/Model in separate Rmarkdown, please do as follow:
  
- ensure that all library packages (as listed in the library chunk) are installed
   + uncomment the line pkgs (list of packages)
   + uncomment the line  install.packages(pkgs)
   + run the two lines in the console
   + comment out these lines before kniting the Rmd file
- change the working directory in RStudio to the location of the RMarkdown and include datafiles:
   + "mtl_menu.csv"
   + "ModelParameters.xlsx"
   + "psy_bc.xlsx", 
   + "psy_exp1.xlsx", and/or
   + "psy_exp2.xlsx", and/or 
   + "psy_exp3.xlsx" 
   + "pchart_data.xlsx"
- update the filter chuck to specify team and start date of MLT launch  

```{r filters, include=FALSE}
tm <- "MP" # Team Location
launch_date <- "2015-11" # MTL launch date in the clinic, format must be "yyyy-mm"

## For initial location
## True pre-condition is April 2014- Mar 2015; however data doesn't exist until Nov 2014
## Mixed Precondition:  Nov 2014 - Oct 2015 
## Therefore, enter "2015-11" for first MTL location

```

```{r library, include=FALSE}
# pkgs <- c("readxl", "tidyverse", "huxtable","htmlTable", "networkD3", "plotly")
# install.packages(pkgs)

library(tidyverse)
library(readxl)
library(huxtable)
library(htmlTable)
library(networkD3)
library(plotly)

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


## Team Data Table - Psychotherapy Module


```{r psy_datafiles, include=FALSE}
psypar1a <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B35:D36")

psypar1b <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B44:D47")

flow <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B3:D7")

rvi <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B8:D12")

med <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B13:D14")

rvi_after <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B15:D23")

med_after <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:3, sep = "__"), range = "B24:D32")
```

```{r psy_setup, include=FALSE}
# Team Data Table/Appointment Supply columns
ord1 <- c("Appointment Supply (75th percentile)", "AUD within 3 months %", "DEP within 3 months %",
          "OUD within 3 months %", "PTSD within 3 months %")
psypar1 <- rbind.data.frame(psypar1a[2,], psypar1b) %>%
  mutate_if(is.numeric, funs(round(.,1))) %>%
  mutate_if(is.numeric, funs(as.character)) %>%
  slice(match(ord1, X__1))

#Patient Flow 
flow.order <- c("Starters Who Initiate %","Starters Who Return Later %", "Starters Who Quit %",
                "Initiators Who Complete %","Initiators Who Return Later %", 
                "Initiators Who Quit Early %", 
                "Completers Who Graduate %","Completers Who Return %")

## Need to calculate
## Starters who Quit
## Initiators who Return Later
## Completers who Return
flow1 <- flow %>%
  add_row(X__1 = "Starters Who Quit %") %>% 
  add_row(X__1 = "Initiators Who Return Later %") %>%
  add_row(X__1 = "Completers Who Return %") %>%
  mutate( X__2 = replace(X__2, X__1 == "Starters Who Quit %", 1 - 
                           (X__2[which(X__1 == "Starters Who Initiate %")] + 
                              X__2[which(X__1 == "Starters Who Return Later %")])),
          X__2 = replace(X__2, X__1 == "Initiators Who Return Later %", 1 - 
                           (X__2[which(X__1 == "Initiators Who Complete %")] + 
                              X__2[which(X__1 == "Initiators Who Quit Early %")])),
          X__2 = replace(X__2, X__1 =="Completers Who Return %", 1 - 
                           (X__2[which(X__1 == "Completers Who Graduate %")]))) %>%
  slice(match(flow.order, X__1)) %>%
  mutate(X__2 = round(X__2, 2) * 100)

# Return Visit Interval less than 3months
rvi1 <- c("N/A", "See table below", "See table below",  
          round(rvi$X__2[which(rvi$X__1 == "Initiators Who Complete RVI")],2) ,
          "See table below",
          round(rvi$X__2[which(rvi$X__1 == "Initiators Who Quit Early RVI")],2), 
          round(rvi$X__2[which(rvi$X__1 == "Completers RVI")],2),
          "See table below")

# Median Engagement Duration less than 3months
med1 <- c("NA", "See table below", "See table below",
          round(med$X__2[which(med$X__1 == "Initiators Who Quit Early Duration")], 2),
          "See table below", 
          round(med$X__2[which(med$X__1 == "Initiators Who Graduate Duration")],2),
          "12 wks", "See table below")


# Return Visit Interval after 3months
visit.order <- c("From 1 Visit", "From 2 to 7 Visits", "From 8 or More Visits")
rvi2 <- rvi_after %>%
  mutate(Visit = sub("^(.*) Who .*", "\\1", X__1),
         X__3 = sub(".* (.*) RVI$", "\\1", X__1)) %>%
  select(-X__1) %>%
  spread(X__3, X__2) %>%
  mutate(Visit = replace(Visit, Visit =="Starters", "From 1 Visit"),
         Visit = replace(Visit, Visit =="Initiators", "From 2 to 7 Visits"),
         Visit = replace(Visit, Visit =="Completers", "From 8 or More Visits")) %>%
  slice(match(visit.order, Visit)) %>%
  select(Visit, Low, Medium, High) %>%
  rename(`1st Quartile` = Low, Mean = Medium, `4th Quartile` = High) %>%
  mutate_if(is.numeric, funs(round(.,2)))


# Median Engagement Duration after than 3months
med2 <- med_after %>%
  mutate(X__3 = sub(".* (.*) Duration$", "\\1", X__1),
         Visit = sub("^(.*) Who.*","\\1", X__1)) %>%
  select(-X__1) %>%
  spread(X__3, X__2) %>%
  mutate(Visit = replace(Visit, Visit =="Starters", "From 1 Visit"),
         Visit = replace(Visit, Visit =="Initiators", "From 2 to 7 Visits"),
         Visit = replace(Visit, Visit =="Completers", "From 8 or More Visits"))%>%
  slice(match(visit.order, Visit)) %>%
  select(Visit, Low, Medium, High) %>%
  #rename(`1st Quartile` = Low, Mean = Medium, `4th Quartile` = High) %>%
  mutate_if(is.numeric, funs(round(.,2)))


# Upper Table without Definition
psy1 <- psypar1[,-3] %>%
  rename(AppSupply = X__1, rate = X__2) %>%
  add_row(AppSupply = "", rate = "") %>%
  add_row(AppSupply = "", rate = "") %>%
  add_row(AppSupply = "", rate = "") %>%
  cbind(.,flow1[,-3], rvi1, med1)

# Lower Table without Definition
psy2 <- merge.data.frame(rvi2, med2, by = "Visit") %>%
  add_row(`1st Quartile` = "1st Quartile", Mean = "Mean", 
          `4th Quartile` = "4th Quartile", `Low` = "1st Quartile",
          `Medium` = "Mean", `High` = "4th Quartile", .before = 1)

```

```{r psy_datafiles2, include=FALSE}
vacolor <- c("#003F72", "#0083BE","#598527")
rvi_graph <- read_excel("ModelParameters.xlsx", sheet = "PSYParams", col_names = paste("X",1:2, sep = "__"), range = "B15:C32")

rvi_mod <- rvi_graph %>%
  mutate(Type = ifelse(grepl("RVI", X__1), "Freq", "Time"),
        `Flow Group` = sub("(.*) Low|Medium|High", "\\1", X__1),
         `Flow Group` = sub("RVI", "Later", `Flow Group`),
         `Flow Group` = sub(" Duration", "", `Flow Group`),
         `Flow Group` = gsub("^ *|(?<= ) | *$", "", `Flow Group`, perl = TRUE),
         percentile = sub(".* (Low|Medium|High) .*", '\\1', X__1),
         percentile = replace(percentile, percentile == "Medium", "Median")) %>%
  rename( week = X__2) %>%
  select(Type,`Flow Group`, percentile, week)

eng <- rvi_mod %>%
  filter(Type == "Freq") %>%
  mutate(week = 1 / week,
         week = replace(week, week==Inf, 0),
         `Flow Group` = factor(`Flow Group`, levels = c("Starters Who Return Later",
                                                        "Initiators Who Return Later",
                                                        "Completers Who Return Later")),
         percentile = factor(percentile, levels = c("Low", "Median", "High")))


rvi_only <- rvi_mod %>%
  filter(Type == "Time") %>%
  mutate(`Flow Group` = factor(`Flow Group`, levels = c("Starters Who Return Later",
                                                        "Initiators Who Return Later",
                                                        "Completers Who Return")),
         percentile = factor(percentile, levels = c("Low", "Median", "High")))

```



```{r single,echo= FALSE, warning=FALSE, message=FALSE, fig.align="center", include= FALSE}
## Option 1: Side-by-side

p1 <- ggplot(eng, aes(percentile, week, fill = percentile)) +
  geom_bar( stat = "identity", width = 1) +
  scale_fill_manual(values = vacolor, name=element_blank(), guide = FALSE) +
  facet_wrap(~`Flow Group`, strip.position = "bottom", scales = "free_x") +
  labs(x = "", y = "Weeks", title = "Return Visit Interval", #subtitle = "(Weeks Between Visit)",
       caption = "Low = 25th %ile, Median = 50th %ile, High = 75th %ile") +
  theme_bw() +
  theme(panel.spacing = unit(0, "lines"), 
         strip.background = element_blank(),
         strip.placement = "outside",
        strip.text.x = element_text(size = 11),
        axis.text.x = element_text( hjust = 1, colour = vacolor),
        plot.title =  element_text(hjust = 0.5))

p2 <- ggplot(rvi_only, aes(percentile, week, fill = percentile)) +
  geom_bar( stat = "identity", width = 1) +
  scale_fill_manual(values = vacolor, name=element_blank(), guide = FALSE) +
  facet_wrap(~`Flow Group`, strip.position = "bottom", scales = "free_x") +
  labs(x = "", y= "Weeks", title = "Duration of Engagement", subtitle = "(Weeks Between Visit)",
       caption = "Low = 25th %ile, Median = 50th %ile, High = 75th %ile") +
  theme_bw() +
  theme(panel.spacing = unit(0, "lines"), 
         strip.background = element_blank(),
         strip.placement = "outside",
        strip.text = element_text(size = 11),
        axis.text.x = element_text( hjust = 1, colour = vacolor),
        plot.title =  element_text(hjust = 0.5),
        plot.subtitle =  element_text(hjust = 0.5))

```



#### Psy Table without definition (similar to the UI)
```{r psy_table, echo=FALSE}
htmlTable(psy1, header = c(rep("",2), "Patient Flow", "", "Return Visit \nInterval (wks)", "Median Engagement \nDuration (wks)"), rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", caption ="Team Data", align = "lllrcc")


htmlTable(psy2, header = c("", "Return Visit", "Interval after 3", "Months (wks)",
                           "Engagement Duration", "after 3", "Months (wks)"),
          rnames = FALSE, css.cell = "padding-left: 1em; padding-right: 1em;", 
          #caption ="Team Data", 
          align = "lcccccc" )

```


```{r p1,echo= FALSE, warning=FALSE, message=FALSE, fig.align="center"}
p1
```

```{r p2,echo= FALSE, warning=FALSE, message=FALSE, fig.align="center"}
p2
```


## Sim UI Experiments - Psychotherapy Module

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
  dt <- read_excel(files[x], col_names = TRUE, range = "A17:DA83")
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


bc <- read_excel(files[grep("bc", files)], col_names = paste("X",1:2, sep = "__"), range = "A73:B82")


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
#### Compare Services: Supply Used by Pts <3mo

```{r graphs, echo=FALSE}
sim %>%
  filter(Services == "Supply Used by Pts <3mo")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  #facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Supply Used by Pts >3mo

```{r graphs2, echo=FALSE}
sim %>%
  filter(Services == "Supply Used by Pts >3mo")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Supply Used by New Patients

```{r graphs3, echo=FALSE}
sim %>%
  filter(Services == "Supply Used by New Patients")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Starting Rate

```{r graphs4, echo=FALSE}
sim %>%
  filter(Services == "Starting Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Initiation Rate

```{r graphs5, echo=FALSE}
sim %>%
  filter(Services == "Initiation Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```

#### Compare Services: Graduation Rate

```{r graphs6, echo=FALSE}
sim %>%
  filter(Services == "Graduation Rate")  %>%
  ggplot(aes(x = week, y = values, group = Experiment, colour = Experiment)) +
  geom_line(aes(linetype = Experiment)) +
  scale_color_manual(values = vacol) +
  facet_wrap( ~ Services) +
  theme_bw() +
  theme(legend.position="top", legend.title=element_blank()) 

```


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

## Sankey Visual

```{r sankey_setup, include=FALSE}
# Read in files related to Sankey Experimental
snk_read <- function(x){
  dt <- read_excel(files[x], col_names = paste("X",1:2, sep = "__"), range = "A86:B101")
  dt <- dt %>%
    mutate(file_name = files[x],
           Experiment = sub(".*_(.*)\\.xls.*", "\\1", file_name),
           Experiment = replace(Experiment, Experiment == "bc", "Base Case"),
           Experiment = replace(Experiment, Experiment == "exp1", "Experiment 1"),
           Experiment = replace(Experiment, Experiment == "exp2", "Experiment 2"),
           Experiment = replace(Experiment, Experiment == "exp3", "Experiment 3"),
           Model = sub("^(.*)_.*", "\\1", file_name),
           X__1 = sub("[[:punct:]]$", "", X__1),
           Code_A = sub("^(.*)-.*", "\\1", X__1),
           Code_A = replace(Code_A, Code_A != "Exp", "Base"),
           X__1 = sub(".*-", "", X__1),
           N1 = "One Visit",
           N1 = replace(N1, X__1 %in% c("D", "E", "F"), "Initiators"),
           N1 = replace(N1, X__1 %in% c("G", "H"), "Completers"),
           N2 = "Done",
           N2 = replace(N2, X__1 == "A", "Initiators"),
           N2 = replace(N2, X__1 == "F", "Completers"),
           N2 = replace(N2, X__1 %in% c("C", "E", "H"), "Return"),
           source = 0,
           source = replace(source, N1 == "Initiators", 1),
           source = replace(source, N1 == "Completers", 2),
           target = 3,
           target = replace(target, N2 == "Initiators", 1),
           target = replace(target, N2 == "Completers", 2),
           target = replace(target, N2 == "Done", 4)) %>%
    rename(Code = X__1, Value = X__2) %>%
    filter(!grepl("Bar", Code)) %>%
    filter(!(Experiment == "Base Case" & Code_A == "Exp")) %>%
    filter(!(Experiment != "Base Case" & Code_A == "Base")) %>%
    select(-file_name)
  
  dbar <- read_excel(files[x], col_names = paste("X",1:2, sep = "__"), range = "A102:B111")
  dbar <- dbar %>%
    mutate(X__1 = sub("-Bars$", "", X__1),
           Code_A = sub("^(.*)-.*", "\\1", X__1),
           Code_A = replace(Code_A, Code_A != "Exp", "Base"),
           X__1 = sub(".*-", "", X__1)) %>%
    rename(Code = X__1, mean_visit = X__2) %>%
    right_join(dt, by = c("Code", "Code_A")) %>%
    mutate(mean_visit = replace(mean_visit, is.na(mean_visit), 1))
  
  return(dbar)
  }

snk_list <- lapply(1:length(files), snk_read)
snk <- do.call("rbind", snk_list)

nodes <- data.frame(ID = c("One Visit", "Initiators", "Completers", "Return", "Done"))
va_color <- 'd3.scaleOrdinal() .domain(["One Visit", "Initiators","Completers", "Done","Return"]) 
.range(["#003F72","#0083BE","#598527", "#665DC6", "#C4262E"])'


# Appointment Usage Data
visits <- snk %>%
  filter(N2 == "Done" | N2 == "Return") %>%
  mutate(Flow_group = ifelse( N2 == "Done", paste0(N1), paste0(N1, " who ", N2)),
         Flow_group = factor(Flow_group, levels = c("One Visit", "Initiators","Completers",
                                                    "One Visit who Return", 
                                                    "Initiators who Return",
                                                    "Completers who Return"))) %>%
  arrange(Experiment, Flow_group) %>%
  group_by(Experiment) %>% 
  mutate( w = cumsum(Value), 
          wm = w - Value,
          wt = wm + (w - wm)/2,
          slots_mn = Value * mean_visit,
          `Flow Group` = paste0("Visits: ", mean_visit, "\nPatients: ", Value),
          vacol = ifelse(N2 == "Done", "#665DC6","#C4262E"))

```

#### Base Case

<div class = "row">
<div class = "col-md-6">
```{r sankey_bc, echo=FALSE, warning=FALSE, message=FALSE,out.width='90%'}
sankeyNetwork(Links = snk[snk$Experiment == "Base Case",], Nodes = nodes,
              Source = "source", Target = "target",
              Value = "Value", NodeID = "ID",
              fontSize= 8, nodeWidth = 12,  units = "patients",
              colourScale = va_color, fontFamily = "Myriad Pro")%>% 
  htmlwidgets::prependContent(htmltools::tags$h5("Patient Engagement Patterns"))

```

</div>
<div class = "col-md-6">
```{r appt_bc, echo=FALSE, warning=FALSE, message=FALSE ,out.width='95%'}

vacol <- c(rep("#665DC6", 3), rep( "#C4262E",3))

 p <- ggplot(visits[visits$Experiment == "Base Case",], aes(ymin = 0)) +
   geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, "Group" = `Flow Group`), 
             fill = vacol,  colour="black") +
   labs(x = "Patients", y = "Visits", fill ="Flow Group", title = "Appointment Usage") +
   coord_flip() +
   scale_fill_manual(values = visits$vacol, labels = visits$`Flow Group`) +
   guides(fill = FALSE) + 
   theme_minimal() +
   theme(text=element_text(family="Myriad Pro"))


    ggplotly(p) %>%
    layout(showlegend = FALSE)

```
</div>
</div>

#### Experiment 1

<div class = "row">
<div class = "col-md-6">
```{r sankey_exp1, echo=FALSE, warning=FALSE, message=FALSE,out.width='90%'}
sankeyNetwork(Links = snk[snk$Experiment == "Experiment 1",], Nodes = nodes,
              Source = "source", Target = "target",
              Value = "Value", NodeID = "ID",
              fontSize= 8, nodeWidth = 12,  units = "patients",
              colourScale = va_color, fontFamily = "Myriad Pro")%>% 
  htmlwidgets::prependContent(htmltools::tags$h5("Patient Engagement Patterns"))

```

</div>
<div class = "col-md-6">
```{r appt_exp1, echo=FALSE, warning=FALSE, message=FALSE,out.width='95%'}
 p <- ggplot(visits[visits$Experiment == "Experiment 1",], aes(ymin = 0)) +
   geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, "Group" = `Flow Group`), 
             fill = vacol,  colour="black") +
   labs(x = "Patients", y = "Visits", fill ="Flow Group", title = "Appointment Usage") +
   coord_flip() +
   scale_fill_manual(values = visits$vacol, labels = visits$`Flow Group`) +
   guides(fill = FALSE) + 
   theme_minimal() +
   theme(text=element_text(family="Myriad Pro"))


    ggplotly(p) %>%
    layout(showlegend = FALSE)

```
</div>
</div>


#### Experiment 2

<div class = "row">
<div class = "col-md-6">
```{r sankey_exp2, echo=FALSE, warning=FALSE, message=FALSE,out.width='90%'}
sankeyNetwork(Links = snk[snk$Experiment == "Experiment 2",], Nodes = nodes,
              Source = "source", Target = "target",
              Value = "Value", NodeID = "ID",
              fontSize= 8, nodeWidth = 12,  units = "patients",
              colourScale = va_color, fontFamily = "Myriad Pro")%>% 
  htmlwidgets::prependContent(htmltools::tags$h5("Patient Engagement Patterns"))

```

</div>
<div class = "col-md-6">
```{r appt_exp2, echo=FALSE, warning=FALSE, message=FALSE,out.width='95%'}

 p <- ggplot(visits[visits$Experiment == "Experiment 2",], aes(ymin = 0)) +
   geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, "Group" = `Flow Group`), 
             fill = vacol,  colour="black") +
   labs(x = "Patients", y = "Visits", fill ="Flow Group", title = "Appointment Usage") +
   coord_flip() +
   scale_fill_manual(values = visits$vacol, labels = visits$`Flow Group`) +
   guides(fill = FALSE) + 
   theme_minimal() +
   theme(text=element_text(family="Myriad Pro"))


    ggplotly(p) %>%
    layout(showlegend = FALSE)

```
</div>
</div>


#### Experiment 3

<div class = "row">
<div class = "col-md-6">
```{r sankey_exp3, echo=FALSE, warning=FALSE, message=FALSE,out.width='90%'}
sankeyNetwork(Links = snk[snk$Experiment == "Experiment 3",], Nodes = nodes,
              Source = "source", Target = "target",
              Value = "Value", NodeID = "ID",
              fontSize= 8, nodeWidth = 12,  units = "patients",
              colourScale = va_color, fontFamily = "Myriad Pro")%>% 
  htmlwidgets::prependContent(htmltools::tags$h5("Patient Engagement Patterns"))

```

</div>
<div class = "col-md-6">
```{r appt_exp3, echo=FALSE, warning=FALSE, message=FALSE,out.width='95%'}

 p <- ggplot(visits[visits$Experiment == "Experiment 3",], aes(ymin = 0)) +
   geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, "Group" = `Flow Group`), 
             fill = vacol,  colour="black") +
   labs(x = "Patients", y = "Visits", fill ="Flow Group", title = "Appointment Usage") +
   coord_flip() +
   scale_fill_manual(values = visits$vacol, labels = visits$`Flow Group`) +
   guides(fill = FALSE) + 
   theme_minimal() +
   theme(text=element_text(family="Myriad Pro"))


    ggplotly(p) %>%
    layout(showlegend = FALSE)

```
</div>
</div>
