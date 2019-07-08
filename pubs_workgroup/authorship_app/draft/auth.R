## title: "Authorship Scorecard"
## Code written by: "Savet Hong"
## date: "July 1, 2019"
## Purpose: Build Interactive Scorecard
##
##################################################

library(tidyverse)
library(writexl)
library(stringr)
library(shiny)
library(shinyWidgets)
library(DT)
library(rhandsontable)

load("auth.Rdata")

ui <- fluidPage(
  navbarPage("Authorship Scorecard",
             tabPanel("Editor",
                      HTML('<p><img src="team_psd_logo_sm.png", height = "200", width = "600"/></p>'),
                      hr(),
                      h4("Please enter your name:"),
                      textInput("usr_in", ""),
                      actionButton("submit1", "Done"),
                      textOutput("usr_out")
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
                               #h4("2. Enter Weight for Overall Eligible Section Relative to Responsible"),
                               #numericInput("elig", "Overall Eligible Weight", value = 0, min = 0, max = 100),
                               h4("2. Enter Weights for Each Eligible Contribution Category"),
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
                                 
                                 numericInput("dev", "Development", value = 0, min = 0, max = 100),
                                 numericInput("Analysis", "Analysis", value = 0, min = 0, max = 100),
                                 numericInput("Manuscript", "Manuscript", value = 0, min = 0, max = 100),
                                 numericInput("msprocess", "Managing Submission Process", value = 0, min = 0, max = 100),
                                 numericInput("lit", "Literature Search", value = 0, min = 0, max = 100),
                                 numericInput("irb", "Institutional Review Board", value = 0, min = 0, max = 100),
                                 numericInput("dcp", "Data Collection and Preparation (DCP)", value = 0, min = 0, max = 100),
                                 numericInput("oad", "Other administrative duties", value = 0, min = 0, max = 100),
                                 circle = FALSE,
                                 icon = icon("weight-hanging")
                               )
                        ),
                        
                        column(width = 4, 
                               h4("3. Select Contributor"), 
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
                               h4("4. Go to the Score tab")
                        )),
                      
                      hr(),
                      fluidRow(
                        column(2),
                        column(6,
                               h4("Identified Project Content Areas:"),
                               tableOutput("wgt")
                               ),
                        column(4,
                               h4("Identified Project Potential Contributors:"),
                               tableOutput("authlist")
                               )
                      )
                      
                        ),
             tabPanel("Score",
                      sidebarLayout(
                        sidebarPanel(actionButton("runButton","Add Score Value"),
                                     br(),
                                     textOutput("score_msg")),
                          mainPanel(#dataTableOutput("tbscore")
                            rHandsontableOutput("tbscore"))
                      )
                      ),
             tabPanel("Rank",
                      h6("This page shows the ranking based on the scores entered in 
                      the 'Score' tab and the weight from the Contribution Category. 
                      If you need to make changes, please go back to the 'Score' tab 
                         to make your edits, otherwise go to the 'Save' tab."),
                      br(),
                      dataTableOutput("rank")
                      ),
             tabPanel("Save",
                      h5("Clicking on the 'Download' button below, will download an 
                         excel file of the tables from the 'Category Weight', 'Score' and 'Rank'."),
                      #downloadButton("dl", "Download")
                      div(style="display:inline-block", downloadButton("dl", "Download"), style="float:right")
                      )
             )
  
)


server <- function(input, output, session) {
  #Messages
  output$usr_out <- eventReactive(input$submit1,{
    print(paste0( "Thank you ",input$usr_in, ". Please go to the Manuscript tab."))
  })
  
  output$score_msg <- eventReactive(input$runButton, {
    print("\nIf you are satisfied please go to the Rank tab. \nOtherwise, make changes and click on the 'Add Score Value' again. ")
  })
    
  output$manuUI <- renderUI({
    papers <- c(names(manu_list), "Other") 
    selectInput("paper", "", papers, 1)
    #Select a Manuscript:
  })
  
  #authdf <- reactive(input)
  
  output$authlist <- renderTable({
    input$auth 
    }, colnames = FALSE)
  
  # BUild the dataset
  df1 <- reactive({
    #Scoring table
    Section <- c('Accreditation and EES', 'Data UI & Splashpage', 'HQ & Facilitator', 
                 'Models', 'Qualitative Workgroup', 'Research tasks', 'Sim UI', 'Team Time Report', 
                 'Development', 'Analysis', 'Manuscript', 'Managing Submission Process', 
                 'Literature search', 'Institutional Review Board', 
                 'Data Collection and Preparation (DCP)', 'Other administrative duties')
    usr_sect_wgt <- c(input$ees, input$dui, input$hq, input$model, input$qual,
                      input$research, input$sui, input$ttr, 
                      input$dev, input$Analysis, input$Manuscript, input$msprocess, 
                      input$lit, input$irb, input$dcp, input$oad)

    dat1 <- data.frame(Section, usr_sect_wgt, stringsAsFactors = FALSE) %>%
      arrange(desc(usr_sect_wgt)) %>%
      add_row(Section = "Total", usr_sect_wgt = sum(usr_sect_wgt)) %>%
      rename(`Content Weight` = usr_sect_wgt)

    return(dat1)
  })
  
  output$wgt <- renderTable({
    df1()
  })
  
  df2 <- reactive({
    dat1 <- df1() %>%
      filter(Section != "Total") %>%
      rename(Category = Section) 
    #Authorlist
    dat2 <-  dat1 %>%
      cbind.data.frame(data.frame(matrix(vector(), nrow(dat1), length(input$auth),
                                         dimnames = list(c(), input$auth)),
                                  stringsAsFactors = FALSE)) %>%
      mutate_at(3:(length(input$auth)+2), as.numeric) %>%
      inner_join(df[,1:4], by = "Category") %>%
      select(names(df)[1:4], everything()) %>%
      filter(`Content Weight` != 0)
      
    
    return(dat2)
  })

  
  values <- reactiveValues()
  output$tbscore <- renderRHandsontable({
    rhandsontable(data = df2() %>% select(-`Content Weight`),
                  rowHeaders = NULL,
                  contextMenu = FALSE,
                  #width = 600,
                  height = 700)
  })
  
  observeEvent(input$runButton,{
    values$data <- hot_to_r(input$tbscore) 
  })
  df3 <- reactive({
    dat1 <- df1() %>%
      filter(Section != "Total") %>%
      rename(Category = Section) 
    
    values$data %>%
      select(-`Points Possible`) %>%
      gather(Author, score,  -Eligibility, -Category, -Subcategory) %>%
      left_join(dat1) %>%
      mutate(Author = sub("\\.\\.", ", ", Author),
             Author = sub("\\.", " ", Author),
             score = score * (`Content Weight`)/100) %>%
      group_by(Author) %>%
      summarise(`Total Score` = sum(score, na.rm = TRUE)) %>% 
      arrange(desc(`Total Score`))
  })
  
  output$rank <- renderDataTable({
    datatable(df3())
  })
  
  #Create Excel output file
  output$dl <- downloadHandler(
    filename = function(){paste0(input$usr_in, '_', input$paper, '.xlsx')},
    content = function(file){
      write_xlsx(list(`Category Weight` = df1(), Score = values$data, Rank = df3()), path = file)
    }
  )


}

# Run the application 
shinyApp(ui = ui, server = server)