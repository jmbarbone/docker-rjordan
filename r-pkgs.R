msg <- function(...) {
  cat("i ", ..., "\n", file = stdout(), sep = "")
}

if (!identical(Sys.getenv("PKG_SYSREQS"), "true")) {
  warning("PKG_SYSREQS doesn't seem to be set")
  Sys.setenv(PKG_SYSREQS = "true")
}

options(
  pak.no_extra_messages = TRUE,
  # repos = c(CRAN = "https://packagemanager.posit.co/cran/latest", CRAN = "https://cran.rstudio.com/")
  repos = c(CRAN = "https://packagemanager.posit.co/cran/latest")
)

lib <- Sys.getenv("R_LIBS_SITE", NA)
if (is.na(lib) || !dir.exists(lib)) {
  warning("R_LIBS_SITE is not (appropriately) set")
  lib <- .libPaths()[1]
}

pkgs <- c(
  "any::askpass@1.1",
  "any::bigD@0.2.0",
  "any::bit@4.0.5",
  "any::bitops@1.0.7",
  "any::blob@1.2.4",
  "any::brio@1.1.3",
  "any::broom.helpers@1.13.0",
  "any::broom@1.0.4",
  "any::bslib@0.5.0",
  "any::callr@3.7.3",
  "any::cli@3.6.1",
  "any::colorspace@2.1.0",
  "any::commonmark@1.9.0",
  "any::corrr@0.4.4",
  "any::covr@3.6.2",
  "any::cpp11@0.4.3",
  "any::crayon@1.5.2",
  "any::crosstalk@1.2.0",
  "any::curl@5.0.1",
  "any::data.table@1.14.8",
  "any::DBI@1.1.3",
  "any::dbplyr@2.3.2",
  "any::desc@1.4.2",
  "any::diffobj@0.3.5",
  "any::digest@0.6.31",
  "any::distro@0.1.0",
  "any::dplyr@1.1.2",
  "any::ellipsis@0.3.2",
  "any::evaluate@0.21",
  "any::fansi@1.0.4",
  "any::farver@2.1.1",
  "any::filelock@1.0.2",
  "any::flexdashboard@0.6.1",
  "any::fontawesome@0.5.1",
  "any::forcats@1.0.0",
  "any::fs@1.6.2",
  "any::fuj@0.1.3",
  "any::generics@0.1.3",
  "any::ggplot2@3.4.2",
  "any::gitcreds@0.1.2",
  "any::globals@0.16.2",
  "any::glue@1.6.2",
  "any::gt@0.9.0",
  "any::gtable@0.3.3",
  "any::gtsummary@1.7.1",
  "any::haven@2.5.2",
  "any::highr@0.10",
  "any::hms@1.1.3",
  "any::htmltools@0.5.5",
  "any::htmlwidgets@1.6.2",
  "any::httpuv@1.6.11",
  "any::httr@1.4.6",
  "any::isoband@0.2.7",
  "any::jsonlite@1.8.5",
  "any::juicyjuice@0.1.0",
  "any::knitr@1.43",
  "any::labelled@2.11.0",
  "any::lazyeval@0.2.2",
  "any::lifecycle@1.0.3",
  "any::lpSolve@5.6.18",
  "any::lubridate@1.9.2",
  "any::magrittr@2.0.3",
  "any::mark@0.6.0",
  "any::mime@0.12",
  "any::mockery@0.4.3",
  "any::openssl@2.0.6",
  "any::packrat@0.9.1",
  "any::pak@0.5.1",
  "any::parsedate@1.3.1",
  "any::pillar@1.9.0",
  "any::pingr@2.0.2",
  "any::pkgbuild@1.4.1",
  "any::pkgcache@2.1.1",
  "any::pkgconfig@2.0.3",
  "any::pkgdepends@0.5.0",
  "any::pkgload@1.3.2",
  "any::pkgsearch@3.1.2",
  "any::plotly@4.10.2",
  "any::praise@1.0.0",
  "any::prettyunits@1.1.1",
  "any::processx@3.8.1",
  "any::ps@1.7.5",
  "any::purrr@1.0.1",
  "any::quarto@1.2",
  "any::r2d3@0.2.6",
  "any::R6@2.5.1",
  "any::rappdirs@0.3.3",
  "any::RColorBrewer@1.1.3",
  "any::Rcpp@1.0.10",
  "any::reactable@0.4.4",
  "any::reactR@0.4.4",
  "any::readr@2.1.4",
  "any::rematch2@2.1.2",
  "any::rex@1.2.1",
  "any::rlang@1.1.1",
  "any::rmarkdown@2.22",
  "any::rprojroot@2.0.3",
  "any::rsconnect@0.8.29",
  "any::rstudioapi@0.14",
  "any::sass@0.4.6",
  "any::scales@1.2.1",
  "any::sessioninfo@1.2.2",
  "any::shiny@1.7.4",
  "any::shinydashboard@0.7.2",
  "any::snakecase@0.11.0",
  "any::sourcetools@0.1.7.1",
  "any::sparklyr@1.8.1",
  "any::stringi@1.7.12",
  "any::stringr@1.5.0",
  "any::svglite@2.1.1",
  "any::sys@3.4.2",
  "any::testthat@3.1.9",
  "any::tibble@3.2.1",
  "any::tidyr@1.3.0",
  "any::tidyselect@1.2.0",
  "any::timechange@0.2.0",
  "any::tinytex@0.45",
  "any::tzdb@0.4.0",
  "any::utf8@1.2.3",
  "any::uuid@1.1.0",
  "any::V8@4.3.0",
  "any::vctrs@0.6.3",
  "any::viridisLite@0.4.2",
  "any::vroom@1.6.3",
  "any::waldo@0.5.1",
  "any::withr@2.5.0",
  "any::xfun@0.39",
  "any::yaml@2.3.7",
  "any::zip@2.3.0",
  NULL
)

# install {pak} then use {pak} to install everything else

# carefully remove any potential lock files)
msg("checking if {pak} needs to be installed")
if (!requireNamespace("pak", quietly = TRUE, lib.loc = lib)) {
  msg("installing {pak}")
  # using repo set in options() above
  utils::install.packages("pak", repos = sprintf(
    "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  ))
  # msg("pak::pak('pak')")
  # pak::pak("pak", dependencies = TRUE, lib = lib)
  msg("{pak} successfully installed")
}

msg("creating temporary .pak directory")
dir.create(".pak", showWarnings = FALSE, recursive = TRUE)

msg("generating lock file")
pak::lockfile_create(
  pkgs,
  lockfile = ".pak/pkg.lock",
  lib = lib,
  upgrade = TRUE,
  dependencies = NA
)

writeLines(readLines(".pak/pkg.lock"))

msg("installing lock file")
pak::lockfile_install(".pak/pkg.lock", lib = lib, update = TRUE)

msg("removing lockfile")
unlink(".pak/pkg.lock")

sessioninfo::session_info(pkgs = "installed", include_base = TRUE)

msg("done")
quit()
