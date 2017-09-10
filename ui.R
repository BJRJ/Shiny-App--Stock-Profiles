library(shiny)
library(plotly)
#library(shinyFiles)
ui <- fluidPage(
  titlePanel("Stock Price Analysis Tool"),
  
  sidebarLayout(
    sidebarPanel(
    textInput("stocks","Enter Stock Symbols Separated by Comma"), sliderInput("days","Enter the number of days",value = "",
                                                                               min=1,max=49),
    checkboxInput("somevalue", "Log scale for stock price axis?",FALSE),
    checkboxInput("featureplot", "Generate Feature Plot?", FALSE),
    checkboxInput("corrplot", "Generate Correlation Plot?", FALSE),
    
    
      submitButton(text="Go!")
      
    ),
    mainPanel(
    plotlyOutput("plot"),plotOutput("plot2"),plotOutput("plot3")
    )
  )
)