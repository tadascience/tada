
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tada

<!-- badges: start -->

[![R-CMD-check](https://github.com/tadascience/tada/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tadascience/tada/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of tada is to …

## Installation

You can install the development version of tada from
[GitHub](https://github.com/) with:

``` r
pak::pak("tadascience/tada)
```

## Example

Run a roulette of available packages on CRAN:

``` r
tada::pkg_roulette(n = 100, time = 4)
```

![](inst/roulette.gif)
