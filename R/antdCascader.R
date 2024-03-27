#' Ant Design Cascader
#' 
#' Cascade selection box.
#' 
#' @inheritParams shiny::textInput
#' @param options Specify the options the user can select from.
#' @param isDisabled Disable the control.
#' 
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags validateCssUnit
#' 
#' @noRd
antdCascaderInput <- function(inputId,
                              label,
                              options,
                              selected = NULL,
                              multiple = FALSE,
                              placeholder = "Select...",
                              ...,
                              className = "d-block w-100",
                              width = 500) {
  createReactShinyInput(
    inputId = inputId,
    class = "antdCascader",
    dependencies = htmlDependency(
      name = "antd-cascader-input",
      version = "1.0.0",
      src = "www/reactwidgets/antdCascader",
      package = "reactwidgets",
      script = "antdCascader.js"
    ),
    default = if (is.null(selected)) list() else list1(selected),
    configuration = list(
      options = options,
      props = list(
        placeholder = placeholder,
        className = className,
        multiple = multiple,
        ...
      ),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
}
