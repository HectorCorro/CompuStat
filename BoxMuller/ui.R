library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Box-Muller"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("bins",
                   "Número de simulaciones:",
                   value = 300),
      
      downloadButton('downloadData', 'Download')
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("distPlot")), 
        tabPanel("Table", tableOutput("table")),
        tabPanel("Summary", verbatimTextOutput("summary"))
        
      )      
    )
  )
))
