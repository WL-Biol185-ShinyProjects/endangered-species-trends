library(shiny)
library("ggmap")
library(maptools)
library(maps)

worldData <- read.table("worldData.txt"
                       )

# Define UI for application that draws a histogram
fluidPage( # Application title
           titlePanel("World Map"
                     )
         , #Using GGPLOT, plot the Base World Map
           mp <- NULL 
         , # create a layer of borders
           mapWorld <- borders("world"
                              , colour="gray50"
                              , fill="gray50"
                              ) 
         , mp <- ggplot(
                       ) + mapWorld
         , # Show a plot of the generated distribution
           mainPanel(
                      plotOutput("worldMap"
                                )
                    )
         )






