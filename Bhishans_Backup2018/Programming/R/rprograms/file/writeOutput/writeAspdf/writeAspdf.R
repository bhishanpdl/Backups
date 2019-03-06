#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 27, 2016

# setting working directory
setwd('~/Copy/Programming/R/rprograms/file/writeTable/writeAspdf/')

library(gridExtra)
pdf("writeAspdf.pdf", height=11, width=8.5)
grid.table(mtcars)
dev.off()