#!/usr/bin/env Rscript

# Author  : Bhishan Poudel
# Date    : Apr 11, 2016
# Ref     : https://stat.ethz.ch/R-manual/R-devel/library/base/html/which.min.html
# Program : Find the Index of the Minimum or Maximum Value

# set working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

x <- c(1:4, 0:5, 11)
print(x)
print(which.min(x))
print(which.max(x))

## it *does* work with NA's present, by discarding them:
presidents[1:30]
range(presidents, na.rm = TRUE)
which.min(presidents) # 28
which.max(presidents) #  2

## Find the first occurrence, i.e. the first TRUE, if there is at least one:
x <- rpois(10000, lambda = 10); x[sample.int(50, 20)] <- NA
## where is the first value >= 20 ?
which.max(x >= 20)

## Also works for lists (which can be coerced to numeric vectors):
which.min(list(A = 7, pi = pi)) ##  ->  c(pi = 2L)
