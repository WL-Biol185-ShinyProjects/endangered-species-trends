usData <- read.table("usStateDataClean.txt"
)

# Define UI for application that draws a bar graph
statePie <- tabPanel( "Species Groups by State"
                      , fluidPage( # Sidebar with a dropdown for selecting Country
                        sidebarLayout( 
                          sidebarPanel(
                            selectInput( inputId = "StatePie"
                                         , label = "Select a State" 
                                         , choices = sort(unique(usData$State))
                            )
                          )
                          
                          
                          # Show a plot of the endangered species by country
                          , mainPanel(
                            plotOutput( "usPie")
                          )
                        )
                      )
)



