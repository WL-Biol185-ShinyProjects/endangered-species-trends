library(shiny)

library(tidyverse)
library(ggplot2)
library(leaflet)
library(shinythemes)

worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean.txt")

firstup <- function(x) { substr( x
                               , 1
                               , 1
                               ) <- toupper( substr( x
                                                   , 1
                                                   , 1
                                                   )
                                           ) 
                         return( x
                               )
                       }


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

                        
                        
                        output$EndangeredClass <- renderLeaflet({ 
                                                                  EndangeredClass <- worldData%>%
                                                                    filter( iucn == "ENDANGERED"
                                                                          , species == input$EndangeredClass
                                                                          )
                                                                  
                                                                  ECountriesGeo <- rgdal::readOGR( "countries.geo.json"
                                                                                                 , "OGRGeoJSON"
                                                                                                 )
                                                                
                                                                  ECountriesGeo@data <- ECountriesGeo@data %>%
                                                                    left_join( EndangeredClass
                                                                             , by = c( "name" = "country"
                                                                                     )
                                                                             )
                                                                
                                                                  pal <- colorNumeric( "YlOrRd"
                                                                                     , c( min
                                                                                            ( EndangeredClass$value
                                                                                            )
                                                                                        , max( EndangeredClass$value
                                                                                             )
                                                                                        )
                                                                                     )
                                                                  
                                                                  leaflet( data = ECountriesGeo)%>%
                                                                    addTiles()%>%
                                                                    addPolygons( fillColor = ~pal( value)
                                                                               , weight = 1
                                                                               , opacity = 0.1
                                                                               , fillOpacity = 0.7
                                                                               )%>%
                                                                    addLegend( pal = pal
                                                                             , values = ~value
                                                                             , title = "number of species"
                                                                             , position = "bottomright"
                                                                             )%>%
                                                                    setView( lat = 38.0110306
                                                                           , lng = 0
                                                                           , zoom = 1.5
                                                                           )
                                                  
                                                               })
                        
                        output$ThreatenedClass <- renderLeaflet({ 
                                                                  ThreatenedClass <- worldData%>%
                                                                    filter( iucn == "THREATENED"
                                                                          , species == input$ThreatenedClass
                                                                          )
                                                                  
                                                                  TCountriesGeo <- rgdal::readOGR( "countries.geo.json"
                                                                                                 , "OGRGeoJSON"
                                                                                                 )
                                                                  
                                                                  TCountriesGeo@data <- TCountriesGeo@data %>%
                                                                    left_join( ThreatenedClass
                                                                             , by = c( "name" = "country"
                                                                                     )
                                                                             )
                                                                  
                                                                  pal <- colorNumeric( "YlOrRd"
                                                                                     , c( min( ThreatenedClass$value
                                                                                             )
                                                                                             , max( ThreatenedClass$value
                                                                                                  )
                                                                                             )
                                                                                     )
                                                                  
                                                                  leaflet( data = TCountriesGeo)%>%
                                                                    addTiles()%>%
                                                                    addPolygons( fillColor = ~pal(value)
                                                                               , weight = 1
                                                                               , opacity = 0.1
                                                                               , fillOpacity = 0.7
                                                                               )%>%
                                                                    addLegend( pal = pal
                                                                             , values = ~value
                                                                             , title = "number of species"
                                                                             , position = "bottomright"
                                                                             )%>%
                                                                    setView( lat = 38.0110306
                                                                           , lng = 0
                                                                           , zoom = 1.5
                                                                           )
                                                                  
                                                               })
                  
                        output$VulnerableClass <- renderLeaflet({ 
                                                                  VulnerableClass <- worldData%>%
                                                                    filter( iucn == "VULNERABLE"
                                                                          , species == input$VulnerableClass
                                                                          )
                                                                  
                                                                  VCountriesGeo <- rgdal::readOGR( "countries.geo.json"
                                                                                                 , "OGRGeoJSON"
                                                                                                 )
                                                                  
                                                                  VCountriesGeo@data <- VCountriesGeo@data %>%
                                                                    left_join( VulnerableClass
                                                                             , by = c( "name" = "country"
                                                                                     )
                                                                             )
                                                                  
                                                                  pal <- colorNumeric( "YlOrRd"
                                                                                     , c( min( VulnerableClass$value
                                                                                             )
                                                                                        , max( VulnerableClass$value
                                                                                             )
                                                                                        )
                                                                                     )
                                                                  leaflet(data = VCountriesGeo)%>%
                                                                    addTiles()%>%
                                                                    addPolygons( fillColor = ~pal(value)
                                                                               , weight = 1
                                                                               , opacity = 0.1
                                                                               , fillOpacity = 0.7
                                                                               )%>%
                                                                    addLegend( pal = pal
                                                                             , values = ~value
                                                                             , title = "number of species"
                                                                             , position = "bottomright"
                                                                             )%>%
                                                                    setView( lat = 38.0110306
                                                                           , lng = 0
                                                                           , zoom = 1.5
                                                                           )
                                                                  
                                                               })
                        
                        output$CriticalClass <- renderLeaflet({ 
                                                                CriticalClass <- worldData%>%
                                                                  filter( iucn == "CRITICAL"
                                                                        , species == input$CriticalClass
                                                                        )
                                                                CCountriesGeo <- rgdal::readOGR( "countries.geo.json"
                                                                                               , "OGRGeoJSON"
                                                                                               )
                                                                
                                                                CCountriesGeo@data <- CCountriesGeo@data %>%
                                                                  left_join( CriticalClass
                                                                           , by = c( "name" = "country"
                                                                                   )
                                                                           )
                                                                
                                                                pal <- colorNumeric( "YlOrRd"
                                                                                   , c( min( CriticalClass$value
                                                                                           )
                                                                                      , max( CriticalClass$value
                                                                                           )
                                                                                      )
                                                                                   )
                                                                
                                                                leaflet(data = CCountriesGeo)%>%
                                                                  addTiles()%>%
                                                                  addPolygons( fillColor = ~pal(value)
                                                                             , weight = 1
                                                                             , opacity = 0.1
                                                                             , fillOpacity = 0.7
                                                                             )%>%
                                                                  addLegend( pal = pal
                                                                           , values = ~value
                                                                           , title = "number of species"
                                                                           , position = "bottomright"
                                                                           )%>%
                                                                  setView( lat = 38.0110306
                                                                         , lng = 0
                                                                         , zoom = 1.5
                                                                         )
                                                                
                                                             })


                        output$usPie <- renderPlot({
                                                     usData %>%
                                                       filter( as.character( usData$State) == input$StatePie) %>%
                                                       count( State
                                                            , Organism.Type
                                                            ) %>%
                                                       ggplot( aes( x = State
                                                                  , y = n
                                                                  , fill = Organism.Type
                                                                  , label = n
                                                                  )
                                                             ) + geom_bar( width = 1
                                                                         , stat = "identity"
                                                                         ) + coord_polar( theta = "y"
                                                                                        ) + theme_void(
                                                                                                      ) + geom_text( size = 12
                                                                                                                   , position = position_stack( vjust = 0.5
                                                                                                                                              )
                                                                                                                   ) 
                                                  })
                                                    
                        
                        
                         
                        
                        output$usPieTable <- renderDataTable({ 
                                                               usData$Species.Name <- 
                                                                 firstup( tolower( usData$Species.Name
                                                                                 )
                                                                        ) %>%
                                                                 gsub( pattern = " "
                                                                     , replacement = "_"
                                                                     , fixed = TRUE
                                                                     ) %>%
                                                                 sapply( function(x) { as.character( a( href = 
                                                                                                        paste0( "https://en.wikipedia.org/wiki/"
                                                                                                              , x
                                                                                                              )
                                                                                                      , target = "_blank"  
                                                                                                      , x
                                                                                                      )
                                                                                                   ) 
                                                                                     }
                                                                       )
                                                               
                                                               filter( usData
                                                                     , as.character( usData$State
                                                                                   ) == input$StatePie
                                                                     )
                                                                  
                                                             } 
                                                             , escape = FALSE
                                                            )  
                            
                              

                        
                       
                      }

                      




