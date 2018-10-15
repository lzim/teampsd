## Savet Hong
## Date: September 22, 2018
## Purpose: Build Interactive Descriptive Graphs for Comparator Data


library(shiny)
library(tidyverse)
library(plotly)
library(readxl)

comp <- read_xlsx("../Original Data/comparator_20180823.xlsx")
comp <- comp %>%
  filter(visyear < 2018)

vacol <- c("#003F72", "#0083BE", "#C4262E", "#772432", "#598527", "#f3cf45",
           "#f7955b","#839097", "#dcddde", "#cccc99", "#bec292")


ui <- fluidPage(
  tags$h2("Comparator Data"),
  p(strong("Designed to allow user to view basic descriptive graphs of the comparator data
           pulled by Andrew Holbrook."), 
    style = "font-family: 'myriad pro'; font-si26pt; color:#003F72"),
  br(),
  sidebarPanel(
    selectInput(inputId = "plt", "Select a Plot type:",
                choices = c(histograph = "hist", boxplot = "box", normal = "normal", 
                            points = "scatter", line = "line")),
    conditionalPanel(condition = "input.plt != 'box'",
                     selectInput(inputId = "var1", "Select a Variable:",
                                 names(comp))),
    conditionalPanel(condition = "input.plt == 'box'",
                     selectInput(inputId = "var1_1", "Select a Variable:",
                                 names(comp)[-c(1:3)])),
    # conditionalPanel(condition = "input.plt == 'box'",
    #                  selectInput(inputId = "vartime", "Select a time Variable:",
    #                              names(comp)[1:2]), selected = NULL),
    conditionalPanel(condition = "input.plt == 'scatter'|| input.plt == 'line'",
                     selectInput("var2", "Select a second variable:",
                                 names(comp), selected = NULL))

  ),
  mainPanel(
    #Output: Graphs
    #plotOutput(outputId = "varPlot"),
    verbatimTextOutput(outputId = "summary"),
    conditionalPanel('input.plt =="scatter"', plotOutput("plotS")),
    conditionalPanel('input.plt =="line"', plotOutput("plotL")),
    conditionalPanel('input.plt =="hist"', plotOutput("plotH")),
    conditionalPanel('input.plt =="box"', plotOutput("plotB")),
    conditionalPanel('input.plt =="normal"', plotOutput("plotN"))
  )

)

server <- function(input, output){
  # #Dataset
  # datasetInput <- reactive({
  #   switch (input$dataset,
  #     "comparator" = comparator,
  #     "other" = data)
  # })
  
  
  
  #Summary Table
  stats <- reactive({
    stats1 <- comp %>%
      select(input$var1,input$var1_1, input$var2)
    
    stats2 <- summary(stats1)
    return(stats2)
  })
  output$summary <- renderPrint({
    stats()
  })
  
  
  #Graph
  output$plotS <- renderPlot({
    
    ggplot(comp, aes_string(x = input$var1, y = input$var2)) +
      geom_point(shape =1) +
      geom_smooth()
      
      
  })
  
  output$plotL <- renderPlot({
    ggplot(comp, aes_string(x = input$var1, y = input$var2)) +
      geom_line()
  })
  
  output$plotH <- renderPlot({
    #validate(need(input$plt=="hist", message=FALSE))
    ggplot(comp, aes_string(x = input$var1)) +
      geom_histogram()
  })
  
  output$plotN <- renderPlot({
    ggplot(comp, aes_string(x = input$var1)) +
      geom_density(color="darkblue", fill="lightblue")
      # geom_histogram(aes(y =..density..),
      #                breaks = seq(-50, 50, by = 10), 
      #                colour = "black", 
      #                fill = "white") +
      # stat_function(fun = dnorm, args = list(mean = mean(comp[,input$var1]), 
      #                                        sd = sd(comp[,input$var1])))
    
    # geom_histogram(aes(y = ..density..)) + 
    #   stat_density(geom = "line", aes(colour = "black")) + 
    #   stat_function(fun = dnorm, aes(x = z, colour = "blue")) + 
    #   scale_colour_manual(name = "", values = c("red", "green"), 
    #                       breaks = c("bla", "blabla"), 
    #                       labels = c("kernel_est", "norm_curv")) + 
    #   theme(legend.position = "bottom", legend.direction = "horizontal")
  })
  
    Bdata <- reactive({
      
      dat <- comp %>%
        select(visyear, vismonth, y = input$var1_1) %>%
        mutate( visyear = factor(visyear))
      return(dat)
    })
    
    output$plotB <- renderPlot({
     ggplot(Bdata(), aes(visyear, y, fill = visyear)) +
        geom_violin(trim = FALSE, scale = "count") +
        scale_fill_manual(values = vacol[1:7]) +
        facet_wrap(~ vismonth) +
        guides(fill=FALSE) +
        labs(x = "", y = input$var1_1, 
             title = paste0(input$var1_1, " by year and month")) +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    })
    
  
  
}

shinyApp(ui = ui, server = server)