library(shiny)
library(bslib)
# library(reactwidgets)
pkgload::load_all()

ui <- page_fluid(
  titlePanel("reactSelectInput Example"),
  fluidRow(
    column(
      width = 6,
      reactSelectInput(
        "ID1",
        label = "Basic react select example:",
        options = prepareReactSelectOptions(c(
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
        options = prepareReactSelectOptions(list(
          earth = list("luna"),
          mars = c("phobos", "deimos"),
          jupiter = c("io", "europa", "ganymede", "callisto")
        )),
        selected = "ganymede",
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
