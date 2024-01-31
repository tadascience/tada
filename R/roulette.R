#' package roulette
#'
#' Runs a packages roulette
#'
#' @param time How long in seconds the roulette runs. It will increasingly speed up.
#' @param n number of packages in the roulette, packages are selected with [utils::available.packages()]. Ignored if `pkgs=` is given.
#' @param pkgs Packages to show in the roulette.
#' @param cols colors. The default is to pick `n` colors
#'   from the built-in [grDevices::colors()].
#'
#' @return the last package, invisibly
#'
#' @examples
#' pkg_roulette(
#'   time = 2,
#'   pkgs = sample(c("dplyr", "ggplot2", "data.table", "Rcpp", "arrow", "duckdb"))
#' )
#'
#' \dontrun{
#'  # roulette of 100 available CRAN packages
#'  pkg_roulette(time = 4, n = 100)
#' }
#'
#' @importFrom grDevices colors
#' @importFrom cli make_ansi_style
#' @importFrom purrr pwalk
#' @importFrom utils available.packages
#' @export
pkg_roulette <- function(time = 4, n = 100, pkgs, cols = sample(colors(), n, replace = TRUE)) {
  if (missing(pkgs)) {
    pkgs <- sample(available.packages()[, "Package"], n, replace = FALSE)
  } else {
    n <- length(pkgs)
  }

  x <- exp(seq(0, 3, length = n))
  times <- x / sum(x) * time

  size <- 0
  pkg <- ""
  pwalk(list(pkgs, cols, times), function(...){
    pkg <<- ..1
    reset <- paste(rep(" ", size), collapse = " ")
    cat("\r", reset, "\r", make_ansi_style(..2)(pkg), sep = "")
    size <<- nchar(pkg)
    Sys.sleep(..3)
  })

  invisible(pkg)
}
