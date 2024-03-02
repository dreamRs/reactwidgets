library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("dualListBoxInput Example"),
  icon("rocket"),
  fluidRow(
    column(
      width = 6,
      dualListBoxInput(
        "ID1",
        label = "Basic Dual list box example:",
        options = prepareDualListBoxOptions(c(
          "luna", "phobos", "deimos", "io", "europa", "ganymede", "callisto",
          "mimas", "enceladus", "tethys", "rhea", "titan", "iapetus"
        )),
        selected = "tethys",
        width = "100%"
      ),
      verbatimTextOutput("res1")
    ),
    column(
      width = 6,
      dualListBoxInput(
        "ID2",
        label = "Dual list box with options example:",
        options = prepareDualListBoxOptions(list(
          earth = list("luna"),
          mars = c("phobos", "deimos"),
          jupiter = c("io", "europa", "ganymede", "callisto")
        )),
        canFilter = TRUE,
        showOrderButtons = TRUE,
        preserveSelectOrder = TRUE,
        alignActions = "top",
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
