usData <- read.table("usStateData.txt"
)

# Define UI for application that draws a bar graph
statePie <- tabPanel( "Species Groups by State"
                      , fluidPage( # Sidebar with a dropdown for selecting Country
                        sidebarLayout( 
                          sidebarPanel(
                            selectInput( inputId = "State"
                                         , label = "Select a State" 
                                         , choices = unique(usData$State)
                            )
                          )
                          
                          
                          # Show a plot of the endangered species by country
                          , mainPanel(
                            plotOutput( "usPie")
                          )
                        )
                      )
)


