library(shiny)


worldData <- read.table("worldData.txt")

fluidPage(
  
  # Application title
  titlePanel("Species Data by Country"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(selectInput(inputId = 'country', 
                             label = 'select a country', 
                             choices = unique(worldData$country)
                             )
                
            ),
                 
                 
  # Show a plot of the generated distribution
    mainPanel(
      plotOutput("countryPlot")
                 )
  )
)