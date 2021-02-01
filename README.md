# rpkg
Installing required packages to prepare the R working environment is always painful. To reduce future pain, I created this R package `rkpg`. Installing `rpkg` should install R packages I commonly use.

This package would be useful for me (and other bioinformaticians / computational biologists) whenever I start working on a new cluster or I reinstall the operating system.

## How to install
Install the default packages:
```
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("alorchhota/rpkg")
```

Install additional packages
```
cran.pkg = c("shiny", "plotly")
bioconductor.pkg = c("Rbowtie2")
github.pkg = c("princyparsana/netsimulatR")
rpkg::install.rpkg(cran.pkg, bioconductor.pkg, github.pkg)
```

## Default packages
**CRAN packages**
  1. [argparser](https://cran.r-project.org/web/packages/argparser/index.html)
  1. [corpcor](https://cran.r-project.org/web/packages/corpcor/index.html)
  1. [corrplot](https://cran.r-project.org/web/packages/corrplot/index.html)
  1. [cowplot](https://cran.r-project.org/web/packages/cowplot/index.html)
  1. [data.table](https://cran.r-project.org/web/packages/data.table/index.html)
  1. [doParallel](https://cran.r-project.org/web/packages/doParallel/index.html)
  1. [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html)
  1. [feather](https://cran.r-project.org/web/packages/feather/index.html)
  1. [flock](https://cran.r-project.org/web/packages/flock/index.html)
  1. [foreach](https://cran.r-project.org/web/packages/foreach/index.html)
  1. [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)
  1. [glasso](https://cran.r-project.org/web/packages/glasso/index.html)
  1. [gridExtra](https://cran.r-project.org/web/packages/gridExtra/index.html)
  1. [igraph](https://cran.r-project.org/web/packages/igraph/index.html)
  1. [infotheo](https://cran.r-project.org/web/packages/infotheo/index.html)
  1. [lme4](https://cran.r-project.org/web/packages/lme4/index.html)
  1. [MASS](https://cran.r-project.org/web/packages/MASS/index.html)
  1. [MatrixEQTL](https://cran.r-project.org/web/packages/MatrixEQTL/index.html)
  1. [ppcor](https://cran.r-project.org/web/packages/ppcor/index.html)
  1. [PRROC](https://cran.r-project.org/web/packages/PRROC/index.html)
  1. [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html)
  1. [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html)
  1. [Rdpack](https://cran.r-project.org/web/packages/Rdpack/index.html)
  1. [reshape2](https://cran.r-project.org/web/packages/reshape2/index.html)
  1. [Seurat](https://cran.r-project.org/web/packages/Seurat/index.html)
  1. [stringr](https://cran.r-project.org/web/packages/stringr/index.html)
  1. [svd](https://cran.r-project.org/web/packages/svd/index.html)
  1. [tidyr](https://cran.r-project.org/web/packages/tidyr/index.html)

**Bioconductor packages**
  1. [biomaRt](https://bioconductor.org/packages/release/bioc/html/biomaRt.html)
  1. [Biostrings](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
  1. [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)
  1. [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html)
  1. [GENIE3](https://bioconductor.org/packages/release/bioc/html/GENIE3.html)
  1. [GenomicRanges](https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html)
  1. [IRanges](https://bioconductor.org/packages/release/bioc/html/IRanges.html)
  1. [KEGGgraph](https://bioconductor.org/packages/release/bioc/html/KEGGgraph.html)
  1. [limma](https://bioconductor.org/packages/release/bioc/html/limma.html)
  1. [minet](https://bioconductor.org/packages/release/bioc/html/minet.html)
  1. [scater](https://bioconductor.org/packages/release/bioc/html/scater.html)
  1. [scran](https://bioconductor.org/packages/release/bioc/html/scran.html)
  1. [SharedObject](https://bioconductor.org/packages/release/bioc/html/SharedObject.html)
  1. [STRINGdb](https://bioconductor.org/packages/release/bioc/html/STRINGdb.html)
  1. [sva](https://bioconductor.org/packages/release/bioc/html/sva.html)
  1. [WGCNA](https://bioconductor.org/packages/release/bioc/html/WGCNA.html)
  
**GitHub packages**
  1. [alorchhota/autil/genomicsutil](https://github.com/alorchhota/autil/tree/master/genomicsutil)
  1. [alorchhota/autil/ioutil](https://github.com/alorchhota/autil/tree/master/ioutil)
  1. [alorchhota/autil/mappabilityutil](https://github.com/alorchhota/autil/tree/master/mappabilityutil)
  1. [alorchhota/autil/miscutil](https://github.com/alorchhota/autil/tree/master/miscutil)
