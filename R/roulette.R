#' CRAN package name roulette
#'
#' Runs a roulette of available packages on CRAN
#'
#' @param time How long in seconds the roulette runs. It will increasingly speed up.
#' @param n number of packages in the roulette, packages are selected with [available.packages()]
#' @param cols colors. The default is to pick `n` colors
#'   from the built-in [grDevices::colors()].
#'
#' @return the last package, invisibly
#'
#' @examples
#' \dontrun{
#'   pkg_roulette(time = 3, n = 100)
#' }
#'
#' @importFrom grDevices colors
#' @importFrom cli make_ansi_style
#' @importFrom purrr pwalk
#' @importFrom utils available.packages
#' @export
pkg_roulette <- function(time = 4, n = 100, cols = sample(colors(), n, replace = TRUE)) {
  pkgs <- sample(available.packages()[, "Package"], n, replace = FALSE)

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
