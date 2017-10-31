worldData <- read.table("worldData.txt"
                       )

# Define UI for application that draws a bar graph
statusTab <- tabPanel( "Species Status by Country"
                     , fluidPage( # Sidebar with a dropdown for selecting Country
                                  sidebarLayout( 
                                                 sidebarPanel(
                                                               selectInput( inputId = "country"
                                                                          , label = "Select a Country" 
                                                                          , choices = unique(worldData$country)
                                                                          )
                                                             )
                                  
                                  
                                                # Show a plot of the endangered species by country
                                               , mainPanel(
                                                            plotOutput( "countryPlot")
                                                          )
                                               )
                                )
                     )
                              

