## Project: PSD -- Visualization for user/trainers 
## Purpose: Generate sankey graphs
##    - format raw data
##    - analyze/graph results
##
## Previous file: none
##
## Subsequent file: 
##
## Notes:
##
#########################################

library(tidyverse)
library(readxl)
library(alluvial)
library(DescTools)

#import data
setwd() #individuals need to change it to the location of their file
visit <- read_excel("./data/Sankey.xlsx", sheet = "RawData", col_types = c("text", "text", "text", "date"))

#############
# Setup Data
#############

# Add the necessary variables: if a visit occurs before/after three months
visit <- visit %>%
  group_by(patientsid) %>%
  mutate(visitdate = as.Date(visitdatetime)) %>%
  arrange(patientsid,visitdatetime) %>%
  mutate(visitcount = 1:n()) %>%
  dplyr::mutate(
    first = dplyr::first(visitdate),
    last = dplyr::last(visitdate)
  ) %>%
  mutate(ThreeMonDate = AddMonths(first, 3),
         three_months = 1*(visitdate <= ThreeMonDate) + # 1 within 3 months, 
                        2*(visitdate >ThreeMonDate) # 2 after 3 months
         )  

# Add variables to identify the number of visit timeframe  
visit_sum <- visit %>%
  group_by(patientsid, three_months) %>%
  summarise(Nvisits = n()) %>%
  mutate( three_months = replace(three_months, three_months ==1, "WithinThreeMonths"),
          three_months = replace(three_months, three_months ==2, "Back After Three Months")) %>%
  ungroup() %>%
  spread(three_months, Nvisits) %>%
  mutate(initialVisit = "One Visit",
         within3months2_7 = ifelse( WithinThreeMonths >=2,
                                    "2-7 Within Three Months", NA),
         within3months7pls = ifelse( WithinThreeMonths >=8,
                                     "8+ Within Three Months", NA),
         terminal = ifelse( is.na(`Back After Three Months`),
                            "Done Forever", "Back After Three Months"))
  

# Setup datatable for alluvian graph
visit_alluv <- visit_sum %>%
  group_by(initialVisit, within3months2_7, within3months7pls, terminal) %>%
  summarise(Freq = n()) %>%
  replace_na(list(within3months2_7 = " ", within3months7pls =" "))

##ggalluvial
visit_graph2 <- visit_alluv %>%
  gather(VisitCat, visitType, -Freq) %>%
  mutate( VisitCat = factor(VisitCat, levels =c ("initialVisit", "within3months2_7",
                                                    "within3months7pls", "terminal")),
          visitType = as.factor(visitType))


## riverplot data
visit_edges <- visit_sum %>%
  group_by(initialVisit, within3months2_7) %>%
  rename(N1 = initialVisit, N2 = within3months2_7) %>%
  summarise(Value = n()) %>%
  rbind.data.frame(.,
                   {visit_sum %>%
                       filter(!is.na(within3months2_7)) %>%
                       group_by( N1 = within3months2_7, N2 = within3months7pls) %>%
                       summarise(Value = n())
                   }) %>%
  rbind.data.frame(.,
                   {visit_sum %>%
                       filter(is.na(within3months7pls)) %>%
                       filter(!is.na(within3months2_7)) %>%
                       group_by( N1 = within3months2_7, N2 = terminal) %>%
                       summarise(Value = n())
                   }) %>%
  rbind.data.frame(.,
                   {visit_sum %>%
                       filter(!is.na(within3months7pls)) %>%
                       group_by( N1 = within3months7pls, N2 = terminal) %>%
                       summarise(Value = n())
                   }) %>%
  rbind.data.frame(.,
                   {visit_sum %>%
                       filter(is.na(within3months2_7)) %>%
                       group_by( N1 = initialVisit, N2 = terminal) %>%
                       summarise(Value = n())
                   }) %>%
  filter(!is.na(N2)) %>%
  ungroup() 

visit_edges <- as.data.frame(visit_edges)

visit_nodes <- data.frame(ID = unique(c(visit_edges$N1, visit_edges$N2)),x =1, 
                          col = "dark blue", srt = 0, 
                          stringsAsFactors= FALSE) %>%
  mutate(x = replace(x, ID == "2-7 Within Three Months", 2),
         x = replace(x, ID == "8+ Within Three Months", 3),
         x = replace(x, ID == "Back After Three Months", 4),
         x = replace(x, ID == "Done Forever", 4),
         col = replace(col, ID == "2-7 Within Three Months", "light blue"),
         col = replace(col, ID == "8+ Within Three Months", "orange"),
         col = replace(col, ID == "Back After Three Months", "red"),
         col = replace(col, ID == "Done Forever", "green")) 
  
  
  



#############
# Graph Data
#############
pdf("sankey_alluvian.pdf")
alluvial(visit_alluv[6:1,1:4], freq = visit_alluv$Freq,
         col = ifelse(visit_alluv$terminal == "Done Forever", "green", "brown"),
         #border = ifelse(visit_alluv$terminal == "Done Forever", "green", "yellow"),
         cex = 0.8,
         alpha = 0.8,
         xw = 0.2,
         axis_labels = c("Initial","Within 3 Months","Within 3 Months","Terminal"),
         blocks = FALSE,
         cex.axis = 0.7
         )

dev.off()

library(ggalluvial)
ggplot(visit_graph2,
       aes(x = VisitCat, stratum = visitType, alluvium = Freq,
           label = visitType)) +
  geom_alluvium(fill = "darkgrey", na.rm = FALSE) +
  geom_stratum(aes(fill = visitType), color = NA, na.rm = FALSE) +
  theme_bw()


ggplot(visit_alluv, aes(weight = Freq, 
                        axis1 = initialVisit, axis2 = within3months2_7,
                        axis3 = within3months7pls, axis4 = terminal)) +
  geom_alluvium(aes(fill = terminal), width = 0, knot.pos = 0, reverse = FALSE) +
  guides(fill = FALSE) +
  geom_stratum(width = 1/8, reverse = FALSE) +
  geom_text(stat = "stratum", label.strata = TRUE, reverse = FALSE) +
  scale_x_continuous(breaks = 1:4, labels = c("Initial", "","", "Terminal")) +
  scale_fill_brewer(type = "qual", palette = "Dark2") +
  ggsave("sankey_ggplot.pdf")

# Create Small text
library(riverplot)
custom.style <- riverplot::default.style()
custom.style$textcex <- 0.5

visit_graph3 <- makeRiver(visit_nodes, visit_edges)
pdf("sankey_river.pdf") # originally named sankey_ex.pdf
#plot(visit_graph3, main = "Sample Sanekey", plot_area = 0.95, default.style = custom.style) 
plot(visit_graph3, main = "Sample Sanekey", plot_area = 0.95) 

dev.off()

