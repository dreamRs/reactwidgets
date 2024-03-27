
#' React Dual Listbox
#'
#' A feature-rich dual listbox.
#'
#' @inheritParams shiny::textInput
#' @param options Specifies the list of options that may exist on either side of the dual list box.
#' @param selected A list of the selected options appearing in the rightmost list box.
#' @param canFilter If `TRUE`, search boxes will appear above both list boxes, allowing the user to filter the results.
#' @param showOrderButtons If true, a set of up/down buttons will appear near the selected list box to allow the user to re-arrange the items.
#' @param preserveSelectOrder If `TRUE`, the order in which the available options are selected are preserved when the items are moved to the right.
#' @param alignActions A value specifying whether to align the action buttons to the 'top' or 'middle'.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags findDependencies validateCssUnit
#'
#' @export
#' @name dualListBoxInput
dualListBoxInput <- function(inputId,
                             label,
                             options,
                             selected = NULL,
                             canFilter = FALSE,
                             showOrderButtons = FALSE,
                             preserveSelectOrder = FALSE,
                             alignActions = c("middle", "top"),
                             width = 500) {
  input_tag <- createReactShinyInput(
    inputId = inputId,
    class = "dualListBox",
    dependencies = htmlDependency(
      name = "dualListBox-input",
      version = "1.0.0",
      src = "www/reactwidgets/dualListBox",
      package = "reactwidgets",
      script = "dualListBox.js"
    ),
    default = if (is.null(selected)) list() else list1(selected),
    configuration = list(
      id = inputId,
      options = options,
      canFilter = isTRUE(canFilter),
      showOrderButtons = isTRUE(showOrderButtons),
      preserveSelectOrder = isTRUE(preserveSelectOrder),
      alignActions = match.arg(alignActions),
      width = validateCssUnit(width),
      label = makeLabel(label, inputId)
    ),
    container = tags$div
  )
  tagList(
    input_tag,
    findDependencies(shiny::icon("rocket"))
  )
}

#' @param configuration Other options to update the dual list box.
#' @param session The Shiny session.
#' @rdname dualListBoxInput
#' @export
updateDualListBoxInput <- function(inputId, selected, configuration = NULL, session = shiny::getDefaultReactiveDomain()) {
  message <- list(value = if (is.null(selected)) list() else list1(selected))
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}

#' @param choices A character vector or a named list, similar to [shiny::selectInput()]'s choices argument.
#' @rdname dualListBoxInput
#' @export
prepareDualListBoxOptions <- function(choices) {
  choices <- choicesWithNames(choices)
  if (any(vapply(choices, is.list, logical(1)))) {
    lapply(
      X = seq_along(choices),
      FUN = function(i) {
        list(
          label = names(choices)[i],
          options = makeDualListBoxOptions(choices[[i]])
        )
      }
    )
  } else {
    makeDualListBoxOptions(choices)
  }
}

makeDualListBoxOptions <- function(x) {
  lapply(
    X = seq_along(x),
    FUN = function(i) {
      list(label = names(x)[i], value = unname(x)[[i]])
    }
  )
}
