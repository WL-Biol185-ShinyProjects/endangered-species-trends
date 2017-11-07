library(shiny)
library("ggmap")
library(maptools)
library(maps)
source("speciesByCountry.R")
source("stateBarGraph.R")
source("statePie.R")

worldData <- read.table("worldData.txt")
usData <- read.table("usStateData.txt")

# Define UI for application that draws a histogram

# Application title
navbarPage( "Endangered Species App"
            #Tab Title
          , statusTab
            
          , stateBar  
          
          , statePie)
 

