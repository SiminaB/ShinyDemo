library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    col <- input$colHist
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = col, border = 'white',
         main="New title")
  })
  
  output$distPlot2 <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(log(x)), max(log(x)), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(log(x), breaks = bins, col = 'skyblue', border = 'white',
         main="On log scale")
  })
  
  output$distPlot3 <- renderPlot({
    pch <- as.numeric(input$pch)
    
    plot(faithful[,2] ~ faithful[,1], 
         pch=pch,
         xlab="Eruption time (minutes)",
         ylab="Waiting time to next eruption (minutes)")
  })  
  
})
