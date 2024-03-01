library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  icon("rocket"),
  dualListBoxInput(
    "ID",
    label = "Dual list box example:",
    options = list(
      list(value = "one", label = "Option one"),
      list(value = "two", label = "Option two"),
      list(value = "three", label = "Option three")
    ),
    width = 500
  ),
  verbatimTextOutput("res")
)

server <- function(input, output, session) {
  output$res <- renderPrint({
    input$ID
  })
}

shinyApp(ui, server)
