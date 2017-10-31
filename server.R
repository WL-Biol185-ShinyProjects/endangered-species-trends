library(shiny)
library(tidyverse)
library(ggplot2)

function(input,output){

worldData <- read.table("worldData.txt")
  output$countryPlot <- renderPlot({
      worldData%>%
        filter(country == input$country) %>%
        ggplot(aes(species, value, fill = iucn.category)) + geom_bar(stat = "identity")
  })
  
  }