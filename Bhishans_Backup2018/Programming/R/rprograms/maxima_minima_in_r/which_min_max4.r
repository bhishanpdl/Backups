#!/usr/bin/env Rscript

# Author  : Bhishan Poudel
# Date    : Apr 11, 2016
# Ref     : 
# Program : Find the Index of the Minimum or Maximum Value

# set working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# libraries

x <- sample(1:100,10)
min_x = which.min(x)
print(x)
print(min_x)
print(min(x))

x <- matrix(sample(1:100,20),nrow=10)
x[which.min(x[,2]),1]

#Not exactly earth-shatteringly useful but better than:
  
x <- matrix(sample(1:100,20),nrow=10)
x[order(x[,2])[1],1]

