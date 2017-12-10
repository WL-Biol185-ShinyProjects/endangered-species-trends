
usData <- read.table("usStateDataClean2.txt")

# Define UI for application that draws a bar graph

statePie <- tabPanel( "Species Status by State"
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



