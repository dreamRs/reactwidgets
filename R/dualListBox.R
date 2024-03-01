#' React Dual Listbox
#'
#' A feature-rich dual listbox.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
#' @name dualListBoxInput
#'
#' @importFrom htmltools tags css validateCssUnit
dualListBoxInput <- function(inputId, label, ..., width = NULL) {
  input_tag <- reactR::createReactShinyInput(
    inputId = inputId,
    class = "dualListBox",
    dependencies = htmltools::htmlDependency(
      name = "dualListBox-input",
      version = "1.0.0",
      src = "www/reactwidgets/dualListBox",
      package = "reactwidgets",
      script = "dualListBox.js"
    ),
    default = NULL,
    configuration = list(...),
    container = tags$div
  )
  tags$div(
    class = "form-group shiny-input-container",
    style = css(width = validateCssUnit(width)),
    tags$label(
      label,
      class = "control-label",
      class = if (is.null(label)) "shiny-label-null",
      id = paste0(inputId, "-label"),
      `for` = inputId
    ),
    input_tag
  )
}


#' @rdname dualListBoxInput
#' @export
updateDualListBoxInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
