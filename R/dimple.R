#' dimple
#'
#' A dimple integration with htmlwidgets for R
#'
#' @import htmlwidgets
#'
#' @param data a data.frame
#'
#' @export
dimple <- function(data, ..., chartType = "bar", stacked = ifelse(chartType %in% c("bar","area"), T, F),
                   width = 590, height = 400) {

  config <- list(...)
  config$data <- data
  config$width <- width
  config$height <- height
  config$chartType <- chartType
  config$stacked <- stacked


  # create widget
  htmlwidgets::createWidget(
    name = 'dimple',
    config,
    width = width,
    height = height,
    package = 'dimple'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
dimpleOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'dimple', width, height, package = 'dimple')
}

#' Widget render function for use in Shiny
#'
#' @export
renderdimple <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, dimpleOutput, env, quoted = TRUE)
}
