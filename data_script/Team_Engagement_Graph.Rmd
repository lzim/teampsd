---
title: "RVI Engagement"
author: "Savet Hong"
date: "`r format(Sys.Date(), '%b %d, %Y')`"
output: html_document

---

## Psy Model 
```{r library, include=FALSE}

library(readxl)
library(tidyverse)
library(plotly)

```


```{r psy_datafiles, include=FALSE}
vacolor <- c("#003F72", "#0083BE","#598527")
rvi <- read_excel("ModelParameters (2).xlsx", sheet = "PSYParams", col_names = FALSE, range = "A15:C32")

# Expand Column A as vector
unique_Appointment_Group <- rvi$X__1[which(!is.na(rvi$X__1))] #unique `Appointment Group` (in order)
Appointment_Group_pos <- diff(which(!is.na(rvi$X__1))) # position/rows between `Appointment Group`
max.pos <- length(unique_Appointment_Group) 
Appointment_Group_vec <- c(rep(unique_Appointment_Group[-max.pos], Appointment_Group_pos),
                 rep(unique_Appointment_Group[max.pos], 3)) # repeat values until next occurance 

rvi_mod <- rvi %>%
  mutate(`Appointment Group` = Appointment_Group_vec,
         Type = ifelse(grepl("Freq", X__2), "Freq", "Time"),
         `Appointment Group` = sub("vis", "visit", `Appointment Group`),
         `Appointment Group` = sub("27", "2-7", `Appointment Group`),
         `Flow Group` = sub("(.*) Low|Medium|High", "\\1", X__2),
         `Flow Group` = sub(" Frequency", "", `Flow Group`),
         `Flow Group` = sub(" Duration", "", `Flow Group`),
         `Flow Group` = sub("(\\s)$", "", `Flow Group`),
         percentile = sub(".* (Low|Medium|High) .*", '\\1', X__2),
         percentile = replace(percentile, percentile == "Medium", "Median")) %>%
  rename( week = X__3) %>%
  select(Type,`Flow Group`, percentile, week)

eng <- rvi_mod %>%
  filter(Type == "Freq") %>%
  mutate(week = 1 / week,
         week = replace(week, week==Inf, 0),
         `Flow Group` = factor(`Flow Group`, levels = c("Starters Who Come Back Later",
                                                        "Initiators Who Come Back Later",
                                                        "Completers Who Return")),
         percentile = factor(percentile, levels = c("Low", "Median", "High")))
  # mutate(`Flow Group` = gsub(" Frequency","", `Flow Group`),
  #        `Appointment Group` = gsub(" freq", "", `Appointment Group`))

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

cowplot::plot_grid(p1, p2)
```



```{r p1,echo= FALSE, warning=FALSE, message=FALSE, fig.align="center"}
p1
```

```{r p2,echo= FALSE, warning=FALSE, message=FALSE, fig.align="center"}
p2
```

