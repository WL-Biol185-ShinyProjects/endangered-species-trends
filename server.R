library(shiny)
library(tidyverse)
library(ggplot2)

worldData <- read.table("worldData.txt")

function(input, output)   {
  
  output$countryPlot <- renderPlot({
    
    worldData %>%
      filter(country == input$country) %>%
      ggplot(aes(species, value, fill = iucn.category)) + geom_bar( stat = "identity")
      
  })
  
}


