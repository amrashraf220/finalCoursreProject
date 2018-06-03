#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    car <- lm(dist ~ speed, cars)
    car_pred <- reactive({
        (input$speed)*(coef(car)[2]) + coef(car)[1]
    })
    
    output$text <- renderText({
        car_pred()
    })
    
    kmh_car <- reactive({
        1.609344 * (input$speed)
    })
    
    output$kmh <- renderText({
        kmh_car()
    })
    meters_car <- reactive({
        0.3048 * car_pred()
    })
    
    output$meters <- renderText({
        meters_car()
    })
})
