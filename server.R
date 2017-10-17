library(shiny)
library(tidyverse)
library(ggplot2)

worldData <- read.table("worldData.txt")


function(input,output){
  
  output$countryPlot <- renderPlot({
    worldData%<%
      filter(country == input$country)
      ggplot(aes(country, value)) + geom_bar(stat = "identity")
      
  })
  
}