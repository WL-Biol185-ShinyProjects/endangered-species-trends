library(shiny)
library("ggmap")
library(maptools)
library(maps)
library(shinythemes)

source("speciesByCountry.R")
source("statePie.R")
source("worldMaps.R")
source("homePage.R")
source("sourcesPage.R")

worldData <- read.table("worldData.txt")
usData <- read.table("usStateDataClean2.txt")

# Define UI for application that draws a histogram

# Application title
navbarPage( theme = shinytheme("cerulean"),
            
  "Endangered Species App"
            #Tab Title
            
          , homePage 
          
          , statusTab

          , statePie

          , globalTab

          , sourcesPage

          )
          


