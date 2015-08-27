# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    u1    <-runif(input$bins/2,0,1)   # Old Faithful Geyser data
    u2    <-runif(input$bins/2,0,1)   # Old Faithful Geyser data
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    #hist(x, breaks = 20, col = 'darkgray', border = 'white')
    
    n1<-sqrt(-2*log(u1))*cos(2*pi*u2)
    #bins <- seq(min(n1), max(n1), length.out = input$bins + 1)
   # hist(n1, col = 'darkgray', border = 'white')
    
     n2<-sqrt(-2*log(u1))*sin(2*pi*u2)
     # hist(n2, col = 'darkgray', border = 'white')
      x<-c(n1,n2)
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = 20, col = 'orange', border = 'white')
      
      
    # Generate a summary of the data
    output$summary <- renderPrint({
      summary(x)

    })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
      #data.frame(n1, n2)
      data.frame(x)
    })
    output$downloadData <- downloadHandler(
      filename = function() { paste(input$dataset, '.csv', sep='') },
      content = function(file) {
        write.csv(x, file)
        
      })})
})