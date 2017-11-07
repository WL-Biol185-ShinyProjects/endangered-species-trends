library(shiny)
library("ggmap")
library(maptools)
library(leaflet)

#Draw world map
globalTab <- tabPanel( "Global Heat Map"
                     , tabsetPanel( tabPanel( "Endangered Species"
                                            )
                                  , tabPanel( "Threatened Species"
                                            )
                                  , tabPanel( "Vulnerable Species"
                                            )
                                  , tabPanel( "Critically Endangered Species"
                                            )
                                  )
                     )