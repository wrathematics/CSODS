#!/usr/bin/Rscript --vanilla

inst_pkgs = installed.packages()
cran_pkgs = c("remotes", "rmarkdown", "xaringan", "progress", "jsonlite", "pdftools", "digest", "fs")
gith_pkgs = "rstudio/chromote"

cran_needed = names(which(!sapply(cran_pkgs, `%in%`, inst_pkgs)))
if (length(cran_needed) > 0) install.packages(cran_needed)

gith_needed = gith_pkgs[which(!sapply(sub("^.*\\/", "", gith_pkgs), `%in%`, inst_pkgs))]
if (length(gith_needed) > 0) remotes::install_github(gith_needed)
