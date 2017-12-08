
library( shiny)
library( maptools)
library( maps)
library( shinythemes)

source( "speciesByCountry.R")
source( "statePie.R")
source( "worldMaps.R")
source( "homePage.R")
source( "sourcesPage.R")


worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean2.txt")



# Application title
navbarPage( theme = shinytheme( "cerulean"
                              )
          , "Endangered Species App"
            #Tab Title
            
          , homePage 
          
          , statusTab

          , statePie

          , globalTab

          , sourcesPage

          )
          


