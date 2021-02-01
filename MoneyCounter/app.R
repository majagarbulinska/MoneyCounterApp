#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(shinydashboard)
library(shinyWidgets)


ui <- fluidPage(
    theme = shinytheme("simplex"),
    titlePanel("The Aussi Money Counter"),
    sidebarLayout(position = "left",
        sidebarPanel(
            h2("About This App"),
            p("Ever made a mistake while adding up your business cash at the end of the day? 
            With this simple app you just have to count how many coins/notes of a particular 
              denomination you have and input the number. 
              The app will perform the rest of some calculations and tell you how much money you have"),
            br(),
            br(),
            img(src = "KoalaTransparent.png", height = 200, width = 250),
            br(),
            "The author of this app is Maja Garbulinska ", 
        ),
        
        mainPanel(
            
            fluidRow(
                column(7),
                column(3,
                       img(src = "Money.png", height = 150, width = 200),
                )
            ),
            
            h2("Please enter how many of each you have:"),
            
            hr(),
            
            h3("Coins"),
            
            fluidRow(
                column(4,
                       numericInput("c1", "1c coins", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("c2", "2c coins", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("c5", "5c coins", 0, min = 0, max = 10000, width = 100)
                )
            ),
            
            fluidRow(
                column(4,
                       numericInput("c10", "10c coins", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("c20", "20c coins", 0, min = 0, max = 10000, width = 100),
                ),
                column(4,
                       numericInput("c50", "50c coins", 0, min = 0, max = 10000, width = 100),
                ),
            ),
            
            fluidRow(
                column(4,
                       numericInput("d1", "$1 coins", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("d2", "$2 coins", 0, min = 0, max = 10000, width = 100),
                ),
                column(4),
            ),
            
            
            
            h3("Notes"),
            
            fluidRow(
                column(4,
                       numericInput("d5", "$5 note", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("d10", "$10 note", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("d20", "$20 note", 0, min = 0, max = 10000, width = 100)
                )
            ),
            
            fluidRow(
                column(4,
                       numericInput("d50", "$50 note", 0, min = 0, max = 10000, width = 100)
                ),
                column(4,
                       numericInput("d100", "$100 note", 0, min = 0, max = 10000, width = 100)
                ),
                column(4)
            ),
        

            h3(strong(span(textOutput("calc"), style="color:black"))),
            
            
            hr()
            
            
        )
    )
)

# Define server logic ----
server <- function(input, output) {
    
    
    output$calc <- renderText({ 
        
        vectorMoney <- c(input$c1 * 0.01, 
                         input$c2 * 0.02, 
                         input$c5 * 0.05, 
                         input$c10 * 0.1,
                         input$c20 * 0.2,
                         input$c50 * 0.5,
                         input$d1, 
                         input$d2 * 2, 
                         input$d5 * 5, 
                         input$d10 * 10, 
                         input$d20 * 20, 
                         input$d50 * 50, 
                         input$d100 * 100)
        
        total <-  sum(vectorMoney, na.rm = TRUE)
        
        paste("Your money = AU$", total
              )
        })
    
}

# Run the app ----
shinyApp(ui = ui, server = server)
