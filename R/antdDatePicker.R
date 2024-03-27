#' Ant Design Date Picker
#' 
#' Cascade selection box.
#' 
#' @inheritParams shiny::textInput
#' @param options Specify the options the user can select from.
#' 
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags validateCssUnit
#' 
#' @noRd
antdDatePickerInput <- function(inputId,
                                label,
                                value = NULL,
                                ...,
                                className = "d-block w-100",
                                width = 500) {
  createReactShinyInput(
    inputId = inputId,
    class = "antdDatePicker",
    dependencies = htmlDependency(
      name = "antd-input",
      version = "1.0.0",
      src = "www/reactwidgets/antd",
      package = "reactwidgets",
      script = "antd.js"
    ),
    default = if (is.null(value)) list() else list1(value),
    configuration = list(
      options = options,
      props = list(
        className = className,
        ...
      ),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}



#' Ant Design Date Picker
#' 
#' Cascade selection box.
#' 
#' @inheritParams shiny::textInput
#' @param options Specify the options the user can select from.
#' 
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags validateCssUnit
#' 
#' @noRd
antdDateRangePickerInput <- function(inputId,
                                     label,
                                     value = NULL,
                                     ...,
                                     className = "w-100",
                                     width = 500) {
  createReactShinyInput(
    inputId = inputId,
    class = "antdDateRangePicker",
    dependencies = htmlDependency(
      name = "antd-input",
      version = "1.0.0",
      src = "www/reactwidgets/antd",
      package = "reactwidgets",
      script = "antd.js"
    ),
    default = if (is.null(value)) list() else list1(value),
    configuration = list(
      options = options,
      props = list(
        defaultValue = value,
        className = className,
        ...
      ),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}

