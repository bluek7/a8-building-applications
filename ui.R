library(shiny)
library(plotly)

choicelist <- list("Sepal Length" = "Sepal.Length", 
                   "Sepal Width" = "Sepal.Width",
                   "Petal Length" = "Petal.Length",
                   "Petal Width" = "Petal.Width")

shinyUI(fluidPage(
  
  titlePanel("Iris"),
  
  sidebarLayout(
    
    sidebarPanel(
      radioButtons("y", label = h3("y-Axis"),
                   choices = choicelist, 
                   selected = "Sepal Length"),
      
      radioButtons("x", label = h3("x-Axis"),
                   choices = choicelist, 
                   selected = "Sepal Length"),
      
      radioButtons("species", label = h3("Species"),
                   choices = list("Setosa" = "setosa",
                                  "Versicolor" = "versicolor",
                                  "Virginica" = "virginica"), 
                   selected = "Setosa")
    ),
    
    mainPanel(
      plotlyOutput("plotScatter")
    )
    )
))