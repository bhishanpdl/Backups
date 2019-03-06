#!/usr/bin/env Rscript 

# Author  : Bhishan Poudel
# Date    : Apr 14, 2016
# Ref     :  
# Program : 

# set up working directory
setwd_thisdir <- function () {
  this.dir <- dirname(parent.frame(3)$ofile)
  setwd(this.dir)
}

setwd_thisdir

# libraries

