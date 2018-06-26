# RQDA for Team PSD

# Check working directory

getwd()

# Set working directory

setwd("\\vhapalmpncptsd1\shared research\TeamPSD\qual_data\r")

# Install RQDA Package and Dependencies on your Computer

install.packages("RQDA")

# Use RDQA Package and Dependencies in your Workspace

library(RQDA)
library(xtable)
library(iterators)
library(pkgmaker)
library(registry)
library(rngtools)
library(gridBase)
library(foreach)
library(doParellel)
library(memoise)
library(RSQLite)
library(gWidgetsRGtk2)

# So that R can find everything, make sure that these 
# packages are in your working directory with the files 
# for coding.

# Open the Project

openProject(\\vhapalmpncptsd1\shared research\TeamPSD\qual_data\r)
, updateGUI = FALSE)
