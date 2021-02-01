#' Install R packages
#'
#' @param cran.pkg character. names of packages available in
#' [cran repository](https://cran.r-project.org/web/packages/available_packages_by_name.html).
#' @param bioconductor.pkg character. names of packages available in
#' [bioconductor](https://www.bioconductor.org/).
#' @param github.pkg character. names of packages available in
#' [github](https://github.com).
#'
#' @return
#' Returns a character vector of newly installed packages.
#' A warning is generated if any package could not be installed.
#' @export
#' @examples
#' cran.pkg = c(
#'   "Rdpack", "Rcpp",
#'   "foreach", "doParallel", "flock",
#'   "igraph", "data.table", "dplyr", "tidyr", "reshape2",
#'   "argparser",
#'   "MASS", "PRROC", "lme4", "svd", "stringr", "feather",
#'   "ggplot2", "cowplot", "corrplot", "RColorBrewer", "gridExtra",
#'   "MatrixEQTL",
#'   "Seurat",
#'   "msigdbr",
#'   "corpcor", "glasso", "ppcor", "infotheo"
#' )
#' bioconductor.pkg = c(
#'   "SharedObject",
#'   "STRINGdb", "KEGGgraph", "biomaRt", "Biostrings",
#'   "limma", "edgeR", "DESeq2", "sva",
#'   "IRanges", "GenomicRanges",
#'   "GENIE3", "minet", "WGCNA"
#' )
#' github.pkg = c(
#'   "alorchhota/autil/ioutil",
#'   "alorchhota/autil/miscutil",
#'   "alorchhota/autil/genomicsutil",
#'   "alorchhota/autil/mappabilityutil"
#' )
#' install.rpkg(cran.pkg, bioconductor.pkg, github.pkg)
#'
install.rpkg <- function(cran.pkg = NULL,
                         bioconductor.pkg = NULL,
                         github.pkg = NULL) {
  ### get not-yet-installed packages
  installed.pkg = rownames(installed.packages())
  cran.pkg = setdiff(cran.pkg, installed.pkg)
  bioconductor.pkg = setdiff(bioconductor.pkg, installed.pkg)
  if(length(github.pkg)>0){
    github.pkg.names = basename(github.pkg)
    github.pkg = github.pkg[!github.pkg.names %in% installed.pkg]
  }

  ### install cran packages
  for (idx in seq_len(length(cran.pkg))) {
    pkg = cran.pkg[idx]
    cat(sprintf(
      "installing cran package: %s (%d of %d) ...\n",
      pkg,
      idx,
      length(cran.pkg)
    ))
    install.packages(pkg)
    cat(sprintf("########## Done: %s ##########\n", pkg))
  }

  ### install bioconductor packages
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }

  for (idx in seq_len(length(bioconductor.pkg))) {
    pkg = bioconductor.pkg[idx]
    cat(sprintf(
      "installing bioconductor package: %s (%d of %d) ...\n",
      pkg,
      idx,
      length(bioconductor.pkg)
    ))
    BiocManager::install(pkg, update = F, ask = F)
    cat(sprintf("########## Done: %s ##########\n", pkg))
  }

  ### install github packages
  if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
  }

  for (idx in seq_len(length(github.pkg))) {
    pkg = github.pkg[idx]
    cat(sprintf(
      "installing github package: %s (%d of %d) ...\n",
      pkg,
      idx,
      length(github.pkg)
    ))
    devtools::install_github(pkg, upgrade = "never")
    cat(sprintf("########## Done: %s ##########\n", pkg))
  }

  ### check which packages installed successfully
  installed.pkg = rownames(installed.packages())
  successful.cran.pkg = intersect(cran.pkg, installed.pkg)
  failed.cran.pkg = setdiff(cran.pkg, installed.pkg)
  successful.bioconductor.pkg = intersect(bioconductor.pkg, installed.pkg)
  failed.bioconductor.pkg = setdiff(bioconductor.pkg, installed.pkg)

  successful.github.pkg = c()
  failed.github.pkg = c()
  if(length(github.pkg)>0){
    github.pkg.names = basename(github.pkg)
    successful.github.pkg = github.pkg[github.pkg.names %in% installed.pkg]
    failed.github.pkg = github.pkg[!github.pkg.names %in% installed.pkg]
  }

  successful.pkg = c(successful.cran.pkg,
                     successful.bioconductor.pkg,
                     successful.github.pkg)
  failed.pkg = c(failed.cran.pkg,
                 failed.bioconductor.pkg,
                 failed.github.pkg)

  if (length(failed.pkg) > 0) {
    warning(sprintf(
      "%d packages could not be installed: %s",
      length(failed.pkg),
      paste(failed.pkg, collapse = ", ")
    ))
  }

  return(invisible(successful.pkg))
}
