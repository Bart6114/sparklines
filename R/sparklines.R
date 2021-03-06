#' Sparkline htmlwidget
#'
#' A sparkline htmlwidget using the nifty jQuery Sparklines library (http://omnipotent.net/jquery.sparkline)
#'
#' @import htmlwidgets
#' @import htmltools
#' @param values A vector of values
#' @param chart_type The chart type: one of 'line' (default), 'bar', 'tristate', 'discrete', 'bullet', 'pie' or 'box'
#' @param config A named list of options as can be found on http://http://omnipotent.net/jquery.sparkline/#s-docs
#' @examples
#' sparkline(c(1,2,-1,0,-1,-2,4,5,6), "bar", list(fillColor="white"))
#' @export
sparkline <- function(values, chart_type = 'line', config = list(), width = 100, height = 20) {

  default_config = list(
    type = chart_type,
    width = width,
    height = height)

  config = c(default_config, config)

  params = list(
    values = values,
    config = config,
    height = height,
    width = width
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'sparklines',
    params,
    width = width,
    height = height,
    package = 'sparklines'
  )
}

#' @export
sparklines_html <- function(id, style, class, ...){
  tags$span(id = id, class = class)
}


#' Widget output function for use in Shiny
#'
#' @export
sparklineOutput <- function(outputId, width = '100px', height = '20px'){
  shinyWidgetOutput(outputId, 'sparklines', width, height, package = 'sparklines')
}

#' Widget render function for use in Shiny
#'
#' @export
renderSparkline <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sparklineOutput, env, quoted = TRUE)
}
