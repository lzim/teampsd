## Savet Hong
## Date: January 21, 2017
## Purpose: Build Interactive Sankey Graph for User

library(shiny)
library(shinyWidgets)
library(networkD3)
library(plotly)
library(tidyverse)


  ui <- fluidPage(
      tags$h2("Psychotherapy Engagement"),
      p(strong("The Sankey graph, on the left, shows the visitation pattern of a cohort of patients
        over a course of three months, under a given set of transition rates. The bar graph, on 
        the right, shows the average appointment time slots over the course of a year for each 
        one of Sankey flow groups. Adjust the conditions of cohort, flow rate, and average appointments,
        to see how the flow groups and appointment slots change."), 
        style = "font-family: 'myriad pro'; font-si26pt; color:#003F72"),
      br(),
      numericInput("cohort", "Cohort Size",200, min = 1, max = 1000000),
      br(),
      fluidRow(
        column(6,
               dropdown(
                 tags$h4("Sankey Flow Conditions", align = "center"),
                 sliderInput("GoInit",
                             "Percent transitioned from One Visit to Initiators:",
                             min = 0,
                             max = 100,
                             value = 60),
                 sliderInput("GoDone",
                             "Percent transioned from One Visit to Done:",
                             min = 0,
                             max = 100,
                             value = 20),
                 
                 sliderInput("GoComp",
                             "Percent transitioned from Initiators to Completers:",
                             min = 0,
                             max = 100,
                             value = 60),
                 
                 sliderInput("GoInit_Ret",
                             "Percent transitioned from Initiators to Return:",
                             min = 0,
                             max = 100,
                             value = 57),
                 sliderInput("GoRet",
                             "Percent transitioned from Completers to Return:",
                             min = 0,
                             max = 100,
                             value = 95),
                 style = "unite", icon = icon("gear"),
                 status = "danger", width = "300px",
                 tooltip = tooltipOptions(title = "Click to change paramenters")
                 # animate = animateOptions(
                 #   enter = animations$fading_entrances$fadeInLeftBig,
                 #   exit = animations$fading_exits$fadeOutRightBig)
               ),
               tags$h4("Patient Engagement Patterns", align = "center"),
               sankeyNetworkOutput("SankeyD3", width = "100%", height = "500px")
        ),
        column(6,
               dropdown(
                 tags$h4("Average Appointments Conditions", align = "center"),
                 sliderInput("Mn_Init",
                             "Average number of visits for Initiators:",
                             min = 2,
                             max = 7,
                             value = 6),
                 sliderInput("Mn_Comp",
                             "Average number of visits for Completers:",
                             min = 8,
                             max = 14,
                             value = 9),
                 sliderInput("Mn_one_return",
                             "Average number of visits for One Visit who Return:",
                             min = 2,
                             max = 30,
                             value = 12),
                 sliderInput("Mn_Init_return",
                             "Average number of visits for Initiators who Return:",
                             min = 8,
                             max = 80,
                             value = 35),
                 sliderInput("Mn_Comp_return",
                             "Average number of visits for Completers who Return:",
                             min = 9,
                             max = 100,
                             value = 42),
                 style = "unite", icon = icon("gear"),
                 status = "danger", width = "300px",
                 tooltip = tooltipOptions(title = "Click to change paramenters")
               ),
               #tableOutput("appt"),
               tags$h4("Appointment Usage", align = "center"),
               plotlyOutput("appointments", width = "100%", height = "530px")
        )
      )
    )


  server <- function(input, output, session) {
      # reactive Input panel
      observe({
        val <- input$GoInit
        updateSliderInput(session, "GoDone", value = (100 - val)/2,
                          min = 0, max = (100 - val))
        val2 <- input$GoComp
        updateSliderInput(session, "GoInit_Ret", value = (100 - val2)/2,
                          min = 0, max = (100 - val2))
      })
      
      #############
      # Setup Data
      #############
      # Sankey DF 
      edgesD3 <- reactive({
        prop1 <- c(input$GoDone, 100 - (input$GoInit + input$GoDone), input$GoInit, input$GoComp, input$GoInit_Ret,100 - (input$GoComp + input$GoInit_Ret),
                   input$GoRet, 100 - input$GoRet)
        temp <- data.frame(source = c(0,0,0,1,1,1,2,2), target = c(3,4,1,2,4,3,4,3),
                           N1 = c("One Visit","One Visit","One Visit","Initiators","Initiators","Initiators",
                                  "Completers","Completers"), 
                           N2 = c("Done","Return","Initiators","Completers","Return","Done","Return",
                                  "Done"), prop1)
        temp <- temp %>%
          mutate(prop1 = prop1/100,
                 prop2 = 1,
                 prop2 = replace(prop2, N1 != "One Visit", prop1[ N1 == "One Visit" & N2 == "Initiators"]),
                 prop3 = 1,
                 prop3 = replace(prop3, N1 == "Completers", prop1[N1 =="Initiators" & N2 == "Completers"]),
                 cumprop = prop1 * prop2 * prop3,
                 Value = round(cumprop * input$cohort, 0))
        
        temp <- as.data.frame(temp)
        
        return(temp)
      })
      
      # Appointment Slots DF 
      visit_slots <- reactive({
        temp <- edgesD3() %>%
          select(N1, N2, Value) %>%
          filter(N2 == "Done" | N2 == "Return") %>%
          mutate(Flow_group = ifelse( N2 == "Done", paste0(N1), paste0(N1, " who ", N2)),
                 Flow_group = factor(Flow_group, levels = c("One Visit", "Initiators","Completers",
                                                            "One Visit who Return", "Initiators who Return",
                                                            "Completers who Return")),
                 mean_visit = 1,
                 mean_visit = replace(mean_visit, N1 == "One Visit" & N2 == "Return", input$Mn_one_return),
                 mean_visit = replace(mean_visit, N1 == "Initiators" & N2 == "Done", input$Mn_Init),
                 mean_visit = replace(mean_visit, N1 == "Completers" & N2 == "Done", input$Mn_Comp),
                 mean_visit = replace(mean_visit, N1 == "Initiators" & N2 == "Return", input$Mn_Init_return),
                 mean_visit = replace(mean_visit, N1 == "Completers" & N2 == "Return", input$Mn_Comp_return)
          ) %>%
          arrange(Flow_group) %>%
          mutate( w = cumsum(Value),
                  wm = w - Value,
                  wt = wm + (w - wm)/2,
                  slots_mn = Value * mean_visit,
                  `Flow Group` = paste0(Flow_group, "\nAppointment Slots: ", slots_mn),
                  vacol = ifelse(N2 == "Done", "#665DC6","#C4262E"))
        return(temp)
      })
      
      #############
      # Generate the Output
      #############
      # Sankey Table 
      output$edges <- renderTable({edgesD3()})
      
      #Sankey Graph
      output$SankeyD3 <- renderSankeyNetwork({
        va_color <- 'd3.scaleOrdinal() .domain(["One Visit", "Initiators","Completers", "Done","Return"]) 
        .range(["#003F72","#0083BE","#598527", "#665DC6", "#C4262E"])'
        
        nodes <- data.frame(ID = c("One Visit", "Initiators", "Completers", "Done","Return"))
        sankeyNetwork(Links = edgesD3(), Nodes = nodes,
                      Source = "source", Target = "target",
                      Value = "Value", NodeID = "ID",
                      fontSize= 16, nodeWidth = 30,  units = "patients",
                      colourScale = va_color, fontFamily = "Myriad Pro")
      })
      
      #Appointment Table
      output$appt <- renderTable(visit_slots())
      
      # Appointment Slots Graph
      output$appointments <- renderPlotly({
        vacol <- c(rep("#665DC6", 3), rep( "#C4262E",3))
        
        p <- ggplot(visit_slots(), aes(ymin = 0)) +
          geom_rect(aes(xmin= w, xmax= wm, ymax = mean_visit, "Group" = `Flow Group`), fill = vacol,  colour="black") +
          #geom_text(aes(x = wt, y = 3.5, label = `Appointment Slots`)) +
          labs(x = "Patients", y = "Visits", fill ="Flow Group") +
          coord_flip() +
          scale_x_reverse() +
          scale_fill_manual(values = visit_slots()$vacol, labels = visit_slots()$`Flow Group`) +
          guides(fill = FALSE) + 
          theme_minimal() +
          theme(text=element_text(family="Myriad Pro"))
        
        
        ggplotly(p) %>%
          layout(showlegend = FALSE) 
        
      })
    }
    

  shinyApp(ui = ui, server = server)
  

