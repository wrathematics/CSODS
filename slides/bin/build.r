#!/usr/bin/Rscript --vanilla

args = commandArgs(trailingOnly=TRUE)
if (length(args) != 1) stop("Usage: Rscript topdf.r file")
infile = args[1]

rmarkdown::render(infile, 'xaringan::moon_reader')
