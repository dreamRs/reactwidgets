library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  icon("rocket"),
  fluidRow(
    column(
      width = 6,
      dualListBoxInput(
        "ID1",
        label = "Basic Dual list box example:",
        options = list(
          list(value = "one", label = "Option one"),
          list(value = "two", label = "Option two"),
          list(value = "three", label = "Option three")
        ),
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6,
      dualListBoxInput(
        "ID2",
        label = "Dual list box with options example:",
        options = list(
          list(value = "one", label = "Option one"),
          list(value = "two", label = "Option two"),
          list(value = "three", label = "Option three")
        ),
        canFilter = TRUE,
        showOrderButtons = TRUE,
        preserveSelectOrder = TRUE,
        width = "100%"
      ),
      verbatimTextOutput("res2")
    )
  )
)

server <- function(input, output, session) {
  output$res1 <- renderPrint({
    input$ID1
  })
  output$res2 <- renderPrint({
    input$ID2
  })
}

shinyApp(ui, server)
