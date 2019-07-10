## title: "Authorship Scorecard"
## Code written by: "Savet Hong"
## date: "July 1, 2019"
## Purpose: Build Interactive Scorecard
##
##  NOTE: The same as auth.R but broken into ui and server scrip for ease of code
##  editing
##################################################

library(tidyverse)
library(writexl)
library(stringr)
library(shiny)
library(shinyWidgets)
library(DT)
library(rhandsontable)

load("auth.Rdata")
# Define UI for Authorship Scorecard application 
shinyUI(fluidPage(
    navbarPage("Authorship Scorecard",
               tabPanel("Editor",
                        fluidRow(width = 11, offset = 1,
                                 HTML('<p><img src="team_psd_logo_sm.png", height = "200", width = "600"/></p>')
                                 ),
                        hr(),
                        h4("Please enter your name:"),
                        textInput("usr_in", ""),
                        actionButton("submit1", "Done"),
                        htmlOutput("usr_out")
               ),
               tabPanel("Manuscript",
                        fluidRow(
                            column(width = 4,
                                   h4("1. Select a Manuscript"), 
                                   uiOutput("manuUI"),
                                   hr(),
                                   conditionalPanel(
                                       condition = "input.paper == 'Other'",
                                       textInput("np", "Enter New Manuscript Name:", NULL),
                                       actionButton("Addmanu", "Add Manuscript")
                                   )
                                   
                            ),
                            column(width = 4,
                                   h4("2. Select Overall Eligible Weight Relative to Responsible"),
                                   sliderInput("elig", "Overall Eligible Weight", value = 50, min = 0, max = 100),
                                   h4("3. Enter Weights for Each Eligible Contribution Category"),
                                   dropdownButton(
                                       helpText("Weights are percentage (%) and must total to 100%."),
                                       
                                       numericInput("ees", "Accreditation and EES", value = 0, min = 0, max = 100),
                                       numericInput("dui", "Data UI", value = 0, min = 0, max = 100),
                                       numericInput("hq", "HQ & Facilitator", value = 0, min = 0, max = 100),
                                       numericInput("model", "Models", value = 0, min = 0, max = 100),
                                       numericInput("qual", "Qualitative Workgroup", value = 0, min = 0, max = 100),
                                       numericInput("research", "Research Tasks", value = 0, min = 0, max = 100),
                                       numericInput("sui", "Sim UI", value = 0, min = 0, max = 100),
                                       numericInput("ttr", "Team Time Report", value = 0, min = 0, max = 100),
                                       
                                       # numericInput("dev", "Development", value = 0, min = 0, max = 100),
                                       # numericInput("Analysis", "Analysis", value = 0, min = 0, max = 100),
                                       # numericInput("Manuscript", "Manuscript", value = 0, min = 0, max = 100),
                                       # numericInput("msprocess", "Managing Submission Process", value = 0, min = 0, max = 100),
                                       # numericInput("lit", "Literature Search", value = 0, min = 0, max = 100),
                                       # numericInput("irb", "Institutional Review Board", value = 0, min = 0, max = 100),
                                       # numericInput("dcp", "Data Collection and Preparation (DCP)", value = 0, min = 0, max = 100),
                                       # numericInput("oad", "Other administrative duties", value = 0, min = 0, max = 100),
                                       circle = FALSE,
                                       icon = icon("dumbbell") #icon("weight-hanging")
                                   )
                            ),
                            
                            column(width = 4, 
                                   h4("4. Select Contributor"), 
                                   pickerInput(
                                       inputId = "auth", 
                                       #label = "Select potential manuscript project contributors:", 
                                       choices = people$fname, 
                                       options = list(
                                           `actions-box` = TRUE, 
                                           size = 10,
                                           `selected-text-format` = "count > 2"), 
                                       multiple = TRUE
                                   ),
                                   h4("5. Go to the Score tab")
                            )),
                        
                        hr(),
                        fluidRow(
                            column(2),
                            column(6,
                                   h4("Identified Project Content Areas:"),
                                   tableOutput("wgt"),
                                   span(h5("Total should add to 100."), style = "color:red")
                            ),
                            column(4,
                                   h4("Identified Project Potential Contributors:"),
                                   tableOutput("authlist")
                            )
                        )
                        
               ),
               tabPanel("Score",
                        h6("Please enter the score for each individual for each sub
                           section under Eligible and Responsible. \nNOTE: the points allocated to individuals should
                           sum to the same points as the 'Points Possible'column. When done
                           click on the 'Add Score Value' button."),
                        actionButton("runButton","Add Score Value"),
                        br(),
                        textOutput("score_msg"),
                        hr(),
                        tabsetPanel(
                            tabPanel("Eligible", rHandsontableOutput("tbscore")),
                            tabPanel("Responsible", rHandsontableOutput("tbresp"))
                        )
               ),
               tabPanel("Rank",
                        h6("This page shows the ranking based on the scores entered in 
                      the 'Score' tab and the weight from the Manuscript tab. 
                      If you need to make changes, please go back to these tabs 
                         to make your edits, otherwise go to the 'Save' tab."),
                        br(),
                        dataTableOutput("rank")
               ),
               tabPanel("Save",
                        h5("Clicking on the 'Download' button below, will download an 
                         excel file of the tables from the 'Manuscript', 'Score' and 'Rank' tabs."),
                        #downloadButton("dl", "Download")
                        div(style="display:inline-block", downloadButton("dl", "Download"), style="float:right")
               )
    )

))
