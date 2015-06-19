#' dimple
#'
#' A dimple integration with htmlwidgets for R
#'
#' @import htmlwidgets
#'
#' @param data a data.frame
#' @param chartType define type of chart, either one of: bar, line, step, area, steparea, pie, bubble
#' @param xPct character string of variable to use for a percent x-axis (can be a vector of multiple variables)
#' @param xMeasure character string of variable to use for a measure x-axis (can be a vector of multiple variables)
#' @param xCategory character string of variable to use for a category x-axis (can be a vector of multiple variables)
#' @param yPct character string of variable to use for a percent y-axis (can be a vector of multiple variables)
#' @param yMeasure character string of variable to use for a measure y-axis (can be a vector of multiple variables)
#' @param yCategory character string of variable to use for a category y-axis (can be a vector of multiple variables)
#' @param stacked should data be stacked, defaults to TRUE for bar, area and steparea charts.
#' @param width width of the chart
#' @param height height of the chart
#' @param legend whether to show a legend, defaults to FALSE
#' @param ... other parameters passed to the dimple function (have a look at the examples)
#'
#' @export
dimple <- function(data, ..., chartType = "bar", stacked = ifelse(chartType %in% c("bar","area", "steparea"), T, F),
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
