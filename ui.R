library(shiny)
library(plotly)
#library(shinyFiles)
ui <- fluidPage(
  titlePanel("Stock Price Analysis Tool"),
  
  sidebarLayout(
    sidebarPanel(
    textInput("stocks","Enter Stock Symbols Separated by Comma",value="GOOGL,AMZN"), sliderInput("days","Enter the number of days",value = 20,
                                                                               min=1,max=49),
    checkboxInput("somevalue", "Log scale for stock price axis?",FALSE),
    checkboxInput("featureplot", "Generate Paired X-Y Plot?", TRUE),
    checkboxInput("corrplot", "Generate Paired Correlation Plot?", TRUE),
    
    
      submitButton(text="Go!")
      
    ),
    
    
    mainPanel(
    plotlyOutput("plot"),plotOutput("plot2"),plotOutput("plot3")
    )
  )
)