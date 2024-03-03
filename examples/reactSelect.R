library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("reactSelectInput Example"),
  fluidRow(
    column(
      width = 6,
      reactSelectInput(
        "ID1",
        label = "Basic react select example:",
        options = prepareDualListBoxOptions(c(
          "luna", "phobos", "deimos", "io", "europa", "ganymede", "callisto",
          "mimas", "enceladus", "tethys", "rhea", "titan", "iapetus"
        )),
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6,
      reactSelectInput(
        "ID2",
        label = "Multi react select example:",
        options = prepareDualListBoxOptions(c(
          "luna", "phobos", "deimos", "io", "europa", "ganymede", "callisto",
          "mimas", "enceladus", "tethys", "rhea", "titan", "iapetus"
        )),
        selected = "tethys",
        placeholder = "Search for an option by typing",
        isMulti = TRUE,
        isSearchable = TRUE,
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
