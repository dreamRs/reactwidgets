
#' React Dual Listbox
#'
#' A feature-rich dual listbox.
#'
#' @inheritParams shiny::textInput
#' @param options Specifies the list of options that may exist on either side of the dual list box.
#' @param canFilter If `TRUE`, search boxes will appear above both list boxes, allowing the user to filter the results.
#' @param showOrderButtons If true, a set of up/down buttons will appear near the selected list box to allow the user to re-arrange the items.
#' @param preserveSelectOrder If `TRUE`, the order in which the available options are selected are preserved when the items are moved to the right.
#' @param alignActions A value specifying whether to align the action buttons to the 'top' or 'middle'.
#'
#' @importFrom htmltools tags css validateCssUnit
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
#' @name dualListBoxInput
dualListBoxInput <- function(inputId,
                             label,
                             options,
                             canFilter = FALSE,
                             showOrderButtons = FALSE,
                             preserveSelectOrder = FALSE,
                             alignActions = c("middle", "top"),
                             width = 500) {
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
    configuration = list(
      options = options,
      canFilter = isTRUE(canFilter),
      showOrderButtons = isTRUE(showOrderButtons),
      preserveSelectOrder = isTRUE(preserveSelectOrder),
      alignActions = match.arg(alignActions)
    ),
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
