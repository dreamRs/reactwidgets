library(shiny)
library(reactwidgets)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  dualListBoxInput("textInput"),
  textOutput("textOutput")
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })
}

shinyApp(ui, server)