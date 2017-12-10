library(leaflet)
library(shiny)
library("ggmap")
library(maptools)
library(maps)

#Draw world map
globalTab <- tabPanel( "Global Heat Map"
                     , tabsetPanel( 
                                    tabPanel( "Threatened Species"
                                            , sidebarPanel(
                                                            selectInput( inputId = "ThreatenedClass"
                                                                       , label = "Select a Class of Animal" 
                                                                       , choices = unique( worldData$species
                                                                                         )
                                                                       )
                                                          )
                                            , mainPanel(
                                                         leafletOutput( "ThreatenedClass"
                                                                      )
                                                       )
                                            )
                                    
                                  , tabPanel( "Endangered Species"
                                            , sidebarPanel(
                                                            selectInput( inputId = "EndangeredClass"
                                                                       , label = "Select a Class of Animal" 
                                                                       , choices = unique( worldData$species
                                                                                         )
                                                                       )
                                                                      )
                                                          , mainPanel(
                                                                       leafletOutput( "EndangeredClass"
                                                                                  )
                                                                     )
                                                          )
                                                
                                             
                                              
                                  , tabPanel( "Vulnerable Species"
                                            , sidebarPanel(
                                                            selectInput( inputId = "VulnerableClass"
                                                                       , label = "Select a Class of Animal" 
                                                                       , choices = unique( worldData$species
                                                                                         )
                                                                       )
                                                          )
                                              
                                              , mainPanel(
                                                           leafletOutput( "VulnerableClass"
                                                                        )
                                                         )
                                              )
                                    
                                              
                                  , tabPanel( "Critically Endangered Species"
                                            , sidebarPanel(
                                                            selectInput( inputId = "CriticalClass"
                                                                       , label = "Select a Class of Animal" 
                                                                       , choices = unique( worldData$species)
                                                                       )
                                                          )
                                  
                                            , mainPanel(
                                                         leafletOutput( "CriticalClass"
                                                                      )
                                                       )
                                            )
                                  
                                  )
                     )