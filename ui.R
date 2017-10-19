library(shiny)

worldData <- read.table("worldData.txt")

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Species Status by Country"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "country",
                 label = "Select a Country", 
                 choices = unique(worldData$country)
                  )
         ),
                   
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("countryPlot")
    )
  )
)