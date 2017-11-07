library(shiny)
library(tidyverse)
library(ggplot2)

worldData <- read.table("worldData.txt")
usData <- read.table("usStateData.txt")

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
    
                                                        filter(State == input$State) %>%
                                                        ggplot( aes(Organism.Type)) + geom_bar() 
                                                          }
                                                         )
                        output$usPie <- renderPlot({
                          usData %>%
                            
                            filter(State == input$State) %>%
                            ggplot( aes( x = State, fill = Organism.Type)) + geom_bar(width = 1) + coord_polar() + theme_void()
                        }
                        )
                        
}


