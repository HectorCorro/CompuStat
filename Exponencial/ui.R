library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Generador exponencial"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("bins",
                   "N?mero de simulaciones:",
                   value = 300),
      numericInput("lambda",
                   "Par?metro:",
                   value = 1),
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
