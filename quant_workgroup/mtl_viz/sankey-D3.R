## Project: PSD -- Visualization for user/trainers 
## Purpose: Generate sankey graphs for NIH presentatioin
##
## Previous file: 
##
## Subsequent file: 
##
## Notes:
## vacol <- c("#003F72", "#772432", "#f7955b", "#0083BE", "#C4262E", "#f3cf45" )
#########################################


library(networkD3)

nodes <- data.frame(ID = c("One Visit", "Initiators", "Completers", "Done","Return"))

edges <- data.frame(source = c(0,1,1,1,2,2,0,0), target = c(1,2,4,3,4,3,4,3), 
                    Value = c(120, 40, 68, 12, 38, 2, 40, 40))

va_color <- 'd3.scaleOrdinal() .domain(["One Visit", "Initiators","Completers", "Done","Return"]) 
.range(["#003F72","#f7955b","#f3cf45", "#C4262E","#598527"])'


sankeyNetwork(Links = edges, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "Value", NodeID = "ID",
              fontSize= 16, nodeWidth = 30,  units = "patients",
              colourScale = va_color, fontFamily = "Myriad Pro")
