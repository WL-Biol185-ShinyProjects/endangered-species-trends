usData <- read.table( "usStateData.txt"
                    )

# Define UI for application that draws a bar graph
stateBar <- tabPanel( "Species Groups by State"
                    , sidebarLayout( 
                                     sidebarPanel(
                                                   selectInput( inputId = "State"
                                                              , label = "Select a State" 
                                                              , choices = unique( usData$State
                                                                                )
                                                              )
                                                 )
                                                         
                                                         
                                   # Show a plot of the endangered species by country
                                   , mainPanel(
                                                plotOutput( "usDataPlot"
                                                          )
                                              )
                                   )
                    )
                    
      







