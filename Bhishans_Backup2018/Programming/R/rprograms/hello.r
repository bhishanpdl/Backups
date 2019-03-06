#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 10, 2016
# Ref     :
# Program :

# set working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# libraries


# to find which packages are loaded now
print((.packages()))

# to find package version
print(packageVersion("lattice"))