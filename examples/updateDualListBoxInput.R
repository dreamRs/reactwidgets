library(shiny)
# library(reactwidgets)
pkgload::load_all()

ui <- fluidPage(
  titlePanel("updateDualListBoxInput Example"),
  dualListBoxInput(
    "ID1",
    label = "Update Dual list box example:",
    options = prepareDualListBoxOptions(c(
      "luna", "phobos", "deimos", "io", "europa", "ganymede", "callisto",
      "mimas", "enceladus", "tethys", "rhea", "titan", "iapetus"
    )),
    width = 600
  ),
  verbatimTextOutput("res1"),
  selectInput(
    "update_selected",
    "Update selected value:",
    choices = c(
      "luna", "phobos", "deimos", "io", "europa", "ganymede", "callisto",
      "mimas", "enceladus", "tethys", "rhea", "titan", "iapetus"
    ),
    multiple = TRUE
  )
)

server <- function(input, output, session) {
  output$res1 <- renderPrint({
    input$ID1
  })
  observeEvent(input$update_selected, {
    updateDualListBoxInput(
      inputId = "ID1",
      selected = input$update_selected
    )
  }, ignoreNULL = FALSE, ignoreInit = TRUE)
}

if (interactive())
  shinyApp(ui, server)
