library(shiny)
library(tidyverse)
library(ggplot2)

worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean.txt")

function(input,output){ output$countryPlot <- renderPlot({ colnames(worldData)[2] <- "classification"
                                                           worldData %>%
                                                             filter( country == input$country 
                                                                   , classification != "Total number of known species"
                                                                   , classification != "Total number of threatened species"
                                                                   , classification != "Total number of indigenous threatened species"
                                                                   , classification != "Total number of indigenous known species"
                                                                   ) %>%
                                                             ggplot( aes( species
                                                                        , value
                                                                        , fill = classification
                                                                        )
                                                                   ) +
                                                             geom_bar( stat = "identity"
                                                                         , position = "dodge"
                                                                     ) + 
                                                           
                                                             theme(axis.text.x = element_text( angle = 60
                                                                                             , hjust = 1
                                                                                             )
                                                                  )
                                                        })

                      

                      

output$usDataPlot <- renderPlot({
  usData %>%
    
    filter(State == input$StateBar) %>%
    ggplot(aes(Organism.Type)) + geom_bar() 
}
)

                        
                        
                        
                        
                        
                        
                        output$usPie <- renderPlot({
                          usData %>%
                            filter(as.character(usData$State) == input$StatePie) %>%
                               count(State, Organism.Type) %>%
                                ggplot( aes( x = State, y = n, fill = Organism.Type, label = n)) + geom_bar( width = 1, stat = "identity") + coord_polar(theta = "y") + theme_void() + geom_text(size = 12, position = position_stack(vjust = 0.5))
                            
                           
                        }
                        )
                        
                        }

