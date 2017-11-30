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
          
          , tabPanel( "Sources",
                      
                      titlePanel("Data Sources"),
                      
                      br(),
                      
                      
                      helpText( a("U.S. FWS Threatened & Endangered Species", href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html", target = "_blank")),
                      helpText( a("OECD Threatended Species by Country", href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html", target = "_blank"))
                    )
          )
          


