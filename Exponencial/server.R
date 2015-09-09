# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <-runif(input$bins,0,1)   # Old Faithful Geyser data
    x=-1*(input$lambda)*log(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = 20, col = 'darkgray', border = 'white')
    
    # Generate a summary of the data
    output$summary <- renderPrint({
      summary(x)
    })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
      data.frame(x)
    })
    output$downloadData <- downloadHandler(
      filename = function() { paste(input$dataset, '.csv', sep='') },
      content = function(file) {
        write.csv(x, file)
        
      })})
})