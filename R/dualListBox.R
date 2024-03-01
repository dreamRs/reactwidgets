#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
dualListBoxInput <- function(inputId, default = "") {
  reactR::createReactShinyInput(
    inputId,
    "dualListBox",
    htmltools::htmlDependency(
      name = "dualListBox-input",
      version = "1.0.0",
      src = "www/reactwidgets/dualListBox",
      package = "reactwidgets",
      script = "dualListBox.js"
    ),
    default,
    list(),
    htmltools::tags$div
  )
}


#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateDualListBoxInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
