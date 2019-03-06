#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016

# clear; Rscript createDirectrory.r

# ref: http://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist

mainDir <- "."
subDir <- "outputDirectory"

# method 1
ifelse(!dir.exists(file.path(mainDir, subDir)), dir.create(file.path(mainDir, subDir)), FALSE)


# method 2
subDir <- "outputDirectory1"
dir.create(file.path(mainDir, subDir), showWarnings = FALSE)
setwd(file.path(mainDir, subDir))
dir.create(file.path(mainDir, subDir))
setwd(file.path(mainDir, subDir))

cat("method 2 is much longer\n")

