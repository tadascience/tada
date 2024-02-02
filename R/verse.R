
#' Write poems about R packages
#'
#' @param pkg A package to write a poem about
#'
#' @examples
#' \dontrun{
#'   chattr::chattr_use("gpt35")
#'   tada::verse("ggplot2")
#' }
#'
#' @importFrom chattr chattr
#' @export
verse <- function(pkg = "ggplot2") {
  prompt <- glue::glue("Can you write a poem about the R package called '{pkg}'. Please add a bunch of emojis.")
  chattr::chattr(prompt)
}
