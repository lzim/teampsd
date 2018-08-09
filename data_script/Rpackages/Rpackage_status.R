## Project: Updating R libraries
## Purpose: Assess which packages needed for IT install
##
## Notes:
##
##
##############################################

############
## Part1 : Run to identify missing packages
############

installed <- as.data.frame(installed.packages())

quant3.4 <- list.files("..\\..\\quant_workgroup\\r\\3.4\\")
qual3.4 <- list.files("..\\..\\qual_workgroup\\r\\")


quant_only <- quant3.4[!quant3.4 %in% installed$Package]
qual_only <-qual3.4[!qual3.4 %in% installed$Package]

others <- unique(c(quant_only, qual_only))

write.csv(others,"..\\Rpackages\\packages_to_install.csv")


############
## Part2 : Install missing packages
############
others <- read.csv("..\\Rpackages\\packages_to_install.csv")

library(dplyr)
others_clean <- others %>%
  mutate(install = T,
         install = replace(install, grepl("file", x) == TRUE, "N"),
         install = replace(install, grepl(".R", x) == TRUE, "N"),
         install = replace(install, grepl(".zip", x) == TRUE, "N"),
         install = replace(install, grepl("tidyverse|callr|rvest|reprex", x) == TRUE, "N"),
         install = replace(install, grepl("bit|blob", x) == TRUE, "N")) 

others_clean_short <- others_clean %>%
  filter(install == T)

install.packages(others_clean_short$x)

## List for Team
pck_missing <- data.frame(missing = c("processx", as.vector(others_clean$x[1:4]),
                                      "rgdal", "tigris", "choroplethr"),
                          notes = c("contains an .exe file, permission denied", 
                                    "requires processx",
                                    "requires processx and callr", 
                                    "unable to overwrite previous install", 
                                    "requires all packages listed above",
                                    "contains .MID file, permission denied", 
                                    "requires rgdal",
                                    "requires rgdal and tigris"))
site <- NULL
for (i in 1:nrow(pck_missing)) {
  site[i] <- paste0("https://cran.r-project.org/web/packages/", 
                 pck_missing$missing[i], "/index.html")
}

pck_missing$site <- site

############
## Part2 : Packages Status
############
library(openxlsx)
note1 <- "Workbook created using Rpackage_status.R. Code needs to be rerun with each new install."
note2 <- "Requires IT (Mike) to install"

wb <- createWorkbook("packages")
headerStyle <- createStyle(textDecoration = "bold", border = "Bottom", 
                           borderStyle = "thick", wrapText = TRUE )
colstyle <- createStyle(fgFill = "#f3cf45", fontColour = "black")

addWorksheet(wb, "Packages")
#Add style
addStyle(wb, "Packages", colstyle, rows = 2:2, cols = 1:1)
addStyle(wb, "Packages", headerStyle, rows = 4:4, cols = 1:4)
addStyle(wb, "Packages", colstyle, rows = 5:5, cols = 2:4)
addStyle(wb, "Packages", colstyle, rows = 10:10, cols = 2:4)
#Add Column Width
setColWidths(wb, "Packages", cols = 1:4, widths = c(27, 27, 40, 71))
# Write Data
writeData(wb, "Packages", note1, startRow = 1, startCol = 1)
writeData(wb, "Packages", note2, startRow = 2, startCol = 1)
writeData(wb, "Packages", "Package installed", startRow = 4, startCol = 1)
writeData(wb, "Packages", "Package missing", startRow = 4, startCol = 2)
writeData(wb, "Packages", "Missing Package notes", startRow = 4, startCol = 3)
writeData(wb, "Packages", "Missing Package Download Site", startRow = 4, startCol = 4)
writeData(wb, "Packages", installed$Package, startRow = 5, startCol = 1, colNames = FALSE, rowNames = FALSE )
writeData(wb, "Packages", pck_missing, startRow = 5, startCol = 2, colNames = FALSE, rowNames = FALSE )
saveWorkbook(wb, "..\\Rpackages\\packages_status.xlsx", overwrite = TRUE)

