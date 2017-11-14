library(shiny)
library(tidyverse)
library(ggplot2)
library(leaflet)
library(maps)

usData <- read.table("usStateDataClean.txt")

mapStates <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)
