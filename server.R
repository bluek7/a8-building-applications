library(shiny)
library(plotly)
library(dplyr)


shinyServer(function(input, output) {
  
  output$plotScatter <- renderPlotly({
    data <- iris %>% filter(Species == input$species)
    data %>% plot_ly(type = 'scatter',
                     x = eval(parse(text = input$x)), 
                     y = eval(parse(text = input$y)),
                     mode = 'markers') %>% 
      layout(yaxis = list(title = input$y),
             xaxis = list(title = input$x),
             title = paste0(input$species, ": ", input$y, " v.s. ", input$x))
  })  

})