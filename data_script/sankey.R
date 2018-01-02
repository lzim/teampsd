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
  mutate(visitcount = 1:n(),
         visittotal = n(),
    first = first(visitdate)) %>%
  mutate(ThreeMonDate = AddMonths(first, 3),
         three_months = 1*(visitdate <= ThreeMonDate) + # 1 within 3 months, 
                        2*(visitdate >ThreeMonDate) # 2 after 3 months
         )  

# Add variables to identify the number of visit within timeframe  
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
visit_graph2 <- visit_sum %>%
  gather(key = timeframe, value = VisitStatus, - patientsid, - `Back After Three Months`, -WithinThreeMonths) %>%
  mutate(VisitStatus = factor(VisitStatus, levels = c("One Visit", "2-7 Within Three Months",
                                                      "8+ Within Three Months", "Back After Three Months",
                                                      "Done Forever")),
         timeframe = factor(timeframe, levels = c("initialVisit","within3months2_7",
                                                  "within3months7pls","terminal")))

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
                          col = "#003F72", srt = 0, 
                          stringsAsFactors= FALSE) %>%
  mutate(x = replace(x, ID == "2-7 Within Three Months", 2),
         x = replace(x, ID == "8+ Within Three Months", 3),
         x = replace(x, ID == "Back After Three Months", 4),
         x = replace(x, ID == "Done Forever", 4),
         col = replace(col, ID == "2-7 Within Three Months", "#f7955b"),
         col = replace(col, ID == "8+ Within Three Months", "#f3cf45"),
         col = replace(col, ID == "Back After Three Months", "#C4262E"),
         col = replace(col, ID == "Done Forever", "#598527")) 
  
# N Visit by Transitional Group  
visit_slots <- visit_sum %>%
  mutate(Flow_group = "One and Done",
         Flow_group = replace(Flow_group,is.na(within3months2_7) & 
                                is.na(within3months7pls) & terminal == "Back After Three Months",
                              "One and Back"),
         Flow_group = replace(Flow_group, within3months2_7=="2-7 Within Three Months" & 
                                is.na(within3months7pls) & terminal == "Back After Three Months",
                              "2-7 and Back"),
         Flow_group = replace(Flow_group, within3months2_7=="2-7 Within Three Months" & 
                                is.na(within3months7pls) & terminal == "Done Forever",
                              "2-7 and Done"),
         Flow_group = replace(Flow_group, within3months7pls =="8+ Within Three Months" & 
                                terminal == "Back After Three Months",
                              "8+ and Back"),
         Flow_group = replace(Flow_group,within3months7pls =="8+ Within Three Months" & 
                                terminal == "Done Forever",
                              "8+ and Done") ,
         Flow_group = factor(Flow_group, levels = c("One and Done","2-7 and Done","8+ and Done",
                                                     "One and Back", "2-7 and Back", "8+ and Back"))
         ) %>%
  mutate(total_visit = rowSums(.[c("Back After Three Months","WithinThreeMonths")], na.rm= TRUE)) %>%
  group_by(Flow_group) %>%
  summarise( Npatients = n(), median_visit = round(median(total_visit),1), 
             mean_visit = round(mean(total_visit),1) ) %>%
  arrange(Flow_group) %>%
  mutate( w = cumsum(Npatients),
          wm = w - Npatients,
          wt = wm + (w - wm)/2,
          slots_med = Npatients * median_visit,
          slots_mn = Npatients * mean_visit)
  



#############
# Graph Data
#############
vacol <- c("#003F72", "#772432", "#f7955b", "#0083BE", "#C4262E", "#f3cf45" )

pdf("sankey_alluvian.pdf")
alluvial(visit_alluv[6:1,1:4], freq = visit_alluv$Freq,
         col = vacol,
         border = ifelse(visit_alluv$terminal == "Done Forever", "#003F72", "#dcddde"),
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
       aes(x = timeframe, stratum = VisitStatus, alluvium = patientsid, 
           fill = VisitStatus, label = VisitStatus)) +
  geom_flow(stat = "alluvium", lode.guidance = "rightleft", color = "#f3cf45") +
  geom_stratum() +
  scale_fill_manual(values = vacol) +
  geom_text(stat = "stratum", size = 3) +
  theme_bw() +
  theme(legend.position = "none") 
  ggsave("sankey_ggplot.pdf")

# Create RiverPlot
library(riverplot)
custom.style <- riverplot::default.style()
custom.style$textcex <- 0.5
visit_graph3 <- makeRiver(visit_nodes, visit_edges)

pdf("sankey_river.pdf") # originally named sankey_ex.pdf
plot(visit_graph3, main = "Sample Sanekey", plot_area = 0.95) 
dev.off()

# Patients Slots

ggplot(visit_slots, aes(ymin = 0)) +
  geom_rect(aes(xmin= w, xmax= wm, ymax = median_visit, fill = Flow_group)) +
  geom_text(aes(x = wt, y = 3.5, label = paste0(slots_med, " slots"))) +
  labs(x = "N Patients", y = "Number of Visits (Median)", fill ="Flow Group") +
  coord_flip() +
  scale_x_reverse() +
  scale_fill_manual(values = vacol) +
  ggtitle("Median Number of Appointment Slots by Patient's Alluvian Flow Group") +
  ggsave("Appointment-Slots-median.jpeg")

ggplot(visit_slots, aes(ymin = 0)) +
  geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, fill = Flow_group)) +
  geom_text(aes(x = wt, y = 3.5, label = paste0(slots_mn, " slots"))) +
  labs(x = "", y = "Number of Visits (Mean)", fill ="Flow Group") +
  coord_flip() +
  scale_x_reverse() +
  scale_fill_manual(values = vacol) +
  ggtitle("Mean Number of Appointment Slots by Patient's Alluvian Flow Group") +
  ggsave("Appointment-Slots-mean.jpeg")
  