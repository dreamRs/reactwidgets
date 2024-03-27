#' React Select
#'
#' A feature-rich dual listbox.
#'
#' @inheritParams shiny::textInput
#' @param options Specify the options the user can select from.
#' @param selected Control the current value.
#' @param isMulti Allow the user to select multiple values.
#' @param closeMenuOnSelect Close the select menu when the user selects an option.
#' @param isSearchable Allow the user to search for matching options.
#' @param isDisabled Disable the control.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags validateCssUnit
#'
#' @export
#' @name reactSelectInput
#' 
#' @example examples/reactSelect.R
reactSelectInput <- function(inputId,
                             label,
                             options,
                             selected = NULL,
                             placeholder = "Select...",
                             isMulti = FALSE,
                             closeMenuOnSelect = !isMulti,
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
      selected = selectedChoices(options, selected),
      placeholder = placeholder,
      isMulti = isTRUE(isMulti),
      closeMenuOnSelect = isTRUE(closeMenuOnSelect),
      isSearchable = isTRUE(isSearchable),
      isDisabled = isTRUE(isDisabled),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}

#' @param choices A character vector or a named list, similar to [shiny::selectInput()]'s choices argument.
#' @rdname reactSelectInput
#' @export
prepareReactSelectOptions <- prepareDualListBoxOptions


selectedChoices <- function(choices, selected) {
  if (is.null(selected)) {
    return(character(0))
  }
  if (length(selected) == 0) {
    return(character(0))
  }
  options <- unlist(lapply(X = choices, FUN = `[[`, "options"), recursive = FALSE)
  if (!is.null(options)) {
    choices <- options
  }
  values <- unlist(lapply(X = choices, FUN = `[[`, "value"), use.names = FALSE)
  selected <- which(values %in% selected)
  if (length(selected) == 0) {
    return(character(0))
  }
  choices[selected]
}
