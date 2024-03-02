#' React Select
#'
#' A feature-rich dual listbox.
#'
#' @inheritParams shiny::textInput
#' @param options Specify the options the user can select from.
#' @param selected Control the current value.
#' @param isMulti Allow the user to select multiple values.
#' @param isSearchable Allow the user to search for matching options.
#' @param isDisabled Disable the control.
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
                             isMulti = FALSE,
                             isSearchable = FALSE,
                             isDisabled = FALSE,
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
      isMulti = isTRUE(isMulti),
      isSearchable = isTRUE(isSearchable),
      isDisabled = isTRUE(isDisabled),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}
