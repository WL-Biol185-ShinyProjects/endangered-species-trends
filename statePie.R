usData <- read.table( "usStateDataClean.txt")

# Define UI for application that draws a bar graph

statePie <- tabPanel( "Species Groups by State"
                    , sidebarLayout( 
                                     sidebarPanel(
                                                   selectInput( inputId = "StatePie"
                                                              , label = "Select a State" 
                                                              , choices = sort( unique( usData$State
                                                                                      )
                                                                              )
                                                              )
                                                 )

                          
                          
                                        # Show a plot of the endangered species by state
                                   , mainPanel(
                                                plotOutput( "usPie"
                                                          )
                                              , dataTableOutput( "usPieTable"
                                                               )
                                              )
                                   )
                      
                    )



