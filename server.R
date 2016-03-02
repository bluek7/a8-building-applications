# Including libraries
library(shiny)
library(plotly)
library(dplyr)

# Defining the server of the app
shinyServer(function(input, output) {
  
  # Defining the scatterplot graph function
  output$plotScatter <- renderPlotly({
    # Filtering relevant data
    data <- iris %>% filter(Species == input$species)
    
    # Making scatterplot using plotly
    data %>% plot_ly(type = 'scatter',
                     x = eval(parse(text = input$x)), 
                     y = eval(parse(text = input$y)),
                     mode = 'markers') %>% 
      
      # Defining the layout of the graph
      layout(yaxis = list(title = input$y),
             xaxis = list(title = input$x),
             title = paste0(input$species, ": ", input$y, " v.s. ", input$x))
  })  

})