library(shiny)
library(tidyverse)
library(ggplot2)

worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean.txt")

function(input,output){ 
                        output$countryPlot <- renderPlot({ colnames(worldData)[2] <- "classification"
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
                                                           
                                                             theme( axis.text.x = element_text( angle = 60
                                                                                              , hjust = 1
                                                                                              )
                                                                  )
                                                        })

                        
                        
                        output$endangeredMammals <- renderLeaflet({ endangeredMammals <- worldData%>%
                                          filter( iucn == "ENDANGERED"
                                                  , species == "Mammals"
                                          )
                                        countriesGeo <- rgdal::readOGR("countries.geo.json", "OGRGeoJSON")
                                        
                                        countriesGeo@data <-
                                          countriesGeo@data %>%
                                          left_join( endangeredMammals
                                                     , by = c( "name" = "country"
                                                     )
                                          )
                                        
                                        pal <- colorNumeric("YlOrRd", c(1, 50))
                                        leaflet(data = countriesGeo)%>%
                                          addTiles()%>%
                                          addPolygons( fillColor = ~pal(value)
                                                       , weight = 1
                                                       , opacity = 0.1
                                                       , fillOpacity = 0.7
                                          )%>%
                                          addLegend( pal = pal
                                                     , values = ~value
                                                     , title = NULL
                                                     , position = "bottomright"
                                          )%>%
                                          setView( lat = 38.0110306, lng = -110.4080342, zoom = 4)
                          
                                                         })




                        output$usDataPlot <- renderPlot({ usData %>%
                                                          filter(State == input$State
                                                                ) %>%
                                                          ggplot( aes( Organism.Type
                                                                     )
                                                                ) + geom_bar(
                                                                            ) 
                                                       })
                        output$usPie <- renderPlot({
                                                     usData %>%
                                                      filter(State == input$State
                                                            ) %>%
                                                      ggplot( aes( x = State
                                                                 , fill = Organism.Type
                                                                 )
                                                            ) + geom_bar( width = 1
                                                                        ) + coord_polar(
                                                                                       ) + theme_void(
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
                            ggplot( aes( x = State, fill = Organism.Type)) + geom_bar(width = 1) + coord_polar(theta = "y") + theme_void() + geom_text(aes(y = Organism.Type, label=percentage))
                        }
                        )

                        

                      }



