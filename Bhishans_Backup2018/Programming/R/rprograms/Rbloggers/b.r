#! /usr/bin/env Rscript

#Bhishan Poudel
# Jan 16, 2016

# clear; Rscript a.r

require("getopt", quietly=TRUE)
 
spec = matrix(c(
  "xValue"   , "x", 1, "double"
), byrow=TRUE, ncol=4)
 
opt = getopt(spec);
 
if (is.null(opt$xValue)) {
  x <- 5
} else {
  x <- opt$xValue
}
 
print(x)
