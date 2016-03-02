# Including libraries
library(shiny)
library(plotly)

# Making list for choices for x and y axis variables
choicelist <- list("Sepal Length" = "Sepal.Length", 
                   "Sepal Width" = "Sepal.Width",
                   "Petal Length" = "Petal.Length",
                   "Petal Width" = "Petal.Width")

# Defining fluid page
shinyUI(fluidPage(
  
  # Setting the title of the app
  titlePanel("Iris Analysis"),
  
  # Defining the sidebar layout
  sidebarLayout(
    
    # Defining sidebar panel
    sidebarPanel(
      
      # Radio button widget for y-axis
      radioButtons("y", label = h3("y-Axis"),
                   choices = choicelist, 
                   selected = "Sepal Length"),
      
      # Radio button widget for x-axis
      radioButtons("x", label = h3("x-Axis"),
                   choices = choicelist, 
                   selected = "Sepal Length"),
      
      # Radio button widget for species
      radioButtons("species", label = h3("Species"),
                   choices = list("Setosa" = "setosa",
                                  "Versicolor" = "versicolor",
                                  "Virginica" = "virginica"), 
                   selected = "Setosa")
      ),
    
    # Defining main panel
    mainPanel(
      # Making scatter plot
        plotlyOutput("plotScatter")
      )
    )
))