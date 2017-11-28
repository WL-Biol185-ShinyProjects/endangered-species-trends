usData <- read.table( "usStateDataClean.txt"
                    )

# Define UI for application that draws a bar graph
stateBar <- tabPanel( "Species Groups by State combined"
                    , tabsetPanel(
                                   tabPanel( "State Bar"
                                           , sidebarPanel(
                                                           selectInput( inputId = "StateBarCombined"
                                                                      , label = "Select a State" 
                                                                      , choices = sort( unique( 
                                                                                                usData$State
                                                                                              )
                                                                                      )
                                                                      )
                                                         )
                                             
                                             
                                              # Show a plot of the endangered species by country
                                           , mainPanel(
                                                        plotOutput( "usDataPlotCombined"
                                                                  )
                                                      )
                                           )
                                 , tabPanel( "State Pie"
                                           , sidebarPanel(
                                                           selectInput( inputId = "StatePieCombined"
                                                                      , label = "Select a State" 
                                                                      , choices = sort( unique( 
                                                                                                usData$State
                                                                                              )
                                                                                      )
                                                                      )
                                                         )
                                           
                                           
                                           # Show a plot of the endangered species by country
                                           , mainPanel(
                                                        plotOutput( "usPieCombined"
                                                                  )
                                                      )
                                           )
                                 )
                    )
                    













