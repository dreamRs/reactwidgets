library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("antdCascaderInput Example"),
  fluidRow(
    column(
      width = 6,
      antdCascaderInput(
        "ID1",
        label = "Basic Cascader example:",
        options = list(
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
        ),
        # selected = "tethys",
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6
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
