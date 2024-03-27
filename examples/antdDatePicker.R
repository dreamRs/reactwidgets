library(shiny)
library(bslib)
# library(reactwidgets)
pkgload::load_all()

ui <- page_fluid(
  titlePanel("antdDatePickerInput Example"),
  fluidRow(
    column(
      width = 6,
      antdDatePickerInput(
        "ID1",
        label = "Basic Date Picker example:",
        value = Sys.Date(),
        # format = "YYYY-MM-DD",
        # selected = "marseille",
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6,
      antdDateRangePickerInput(
        "ID2",
        label = "Range Date Picker example:",
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

if (interactive())
  shinyApp(ui, server)
