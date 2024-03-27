library(shiny)
library(bslib)
# library(reactwidgets)
pkgload::load_all()

options <- list(
  list(
    value = "europe",
    label = "Europe",
    children = list(
      list(
        value = "france",
        label = "France",
        children = list(
          list(value = "paris", label = "Paris"),
          list(value = "marseille", label = "Marseille"),
          list(value = "lyon", label = "Lyon")
        )
      ),
      list(
        value = "uk",
        label = "United Kingdom",
        children = list(
          list(value = "london", label = "London"),
          list(value = "liverpool", label = "Liverpool"),
          list(value = "manchester", label = "Manchester")
        )
      )
    )
  ),
  list(
    value = "africa",
    label = "Africa",
    children = list(
      list(
        value = "tunisia",
        label = "Tunisia",
        children = list(
          list(value = "tunis", label = "Tunis"),
          list(value = "monastir", label = "Monastir")
        )
      )
    )
  )
)

ui <- page_fluid(
  titlePanel("antdCascaderInput Example"),
  fluidRow(
    column(
      width = 6,
      antdCascaderInput(
        "ID1",
        label = "Basic Cascader example:",
        options = options,
        # selected = "marseille",
        showSearch = TRUE,
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6,
      antdCascaderInput(
        "ID2",
        label = "Multiple Cascader example:",
        options = options,
        multiple = TRUE,
        allowClear = TRUE,
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
