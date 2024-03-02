#' React Select
#'
#' A feature-rich dual listbox.
#'
#' @inheritParams shiny::textInput
#' @param options Specifies the list of options that may exist on either side of the dual list box.
#' @param selected A list of the selected options appearing in the rightmost list box.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags validateCssUnit
#'
#' @export
#' @name reactSelectInput
reactSelectInput <- function(inputId,
                             label,
                             options,
                             selected = NULL,
                             width = 500) {
  createReactShinyInput(
    inputId = inputId,
    class = "react-select",
    dependencies = htmlDependency(
      name = "react-select-input",
      version = "1.0.0",
      src = "www/reactwidgets/reactSelect",
      package = "reactwidgets",
      script = "reactSelect.js"
    ),
    default = if (is.null(selected)) list() else list1(selected),
    configuration = list(
      options = options,
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}
