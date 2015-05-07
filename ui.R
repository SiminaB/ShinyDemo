library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello World!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30),
      selectInput("colHist", "Histogram color", 
                  choices=c("skyblue","darkgray","red")),
      helpText("Here is some plain text"),
      selectInput("pch", "Point type", 
                  choices=0:25),
      helpText("Here is more text. More and more and more and more and more. 
               Like a whole paragraph's worth...")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),

      plotOutput("distPlot2"),
      
      plotOutput("distPlot3")      
    )
  )
))
