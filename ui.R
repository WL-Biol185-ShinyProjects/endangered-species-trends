library(shiny)
library("ggmap")
library(maptools)
library(maps)
source("speciesByCountry.R")

worldData <- read.table("worldData.txt")

# Define UI for application that draws a histogram

# Application title
navbarPage( "Endangeres Species App"
            #Tab Title
          , statusTab
            
          , tabPanel( "Global Heat Map"
                    )
            
          , tabPanel( "U.S. Map"
                    )
          )
 

