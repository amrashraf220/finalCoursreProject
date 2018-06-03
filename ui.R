#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Developing Data Products Final Project"),
  
  sidebarLayout(
      sidebarPanel(
          h1("Select the speed!"),
          sliderInput("speed",
                      "Select speed (mph):",
                      min = 10,
                      max = 100,
                      value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
          h4("As we know that the larger the speed , the longer the distance to stop , which means that the speed is directly proportional to the distance required to stop the car,
             here we will try to estimate the exact relation based on the famously and widly used", em('cars') ,"data set"),
          h3("The stopping distance in feet for the selected speed was:"),
          textOutput("text"),
          h3("The speed you selected is equivalent in km/h to:"),
          textOutput("kmh"),
          h3("The stopping distance in meters for the selected speed was:"),
          textOutput("meters")
      )
  )
))
