library(shiny)
library("ggmap")
library(maptools)
library(maps)
source("speciesByCountry.R")
source("statePie.R")
source("worldMaps.R")


worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean.txt")

# Define UI for application that draws a histogram

# Application title
navbarPage( "Endangered Species App"
            #Tab Title
            
          , tabPanel( "Home"
                    )
          , statusTab
            

          
          , statePie


            
          , globalTab
          
          , tabPanel( "Sources")
          )


