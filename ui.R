library(shiny)
library("ggmap")
library(maptools)
library(maps)
source("speciesByCountry.R")
source("worldMaps.R")

worldData <- read.table("worldData.txt")

# Define UI for application that draws a histogram

# Application title
navbarPage( "Endangeres Species App"
            #Tab Title
          , statusTab
            
          , tabPanel( "US Map"
                    )
            
          , globalTab
          )
 

