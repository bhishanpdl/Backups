#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

factor <- 1:7
data <- c(0.1375000,0.2500000,0.3416667,0.4583333,0.7250000,0.9166667,1.0000000)

fitted(lm(data~factor+I(factor^2)))

plot(factor, fitted(lm(data~factor+I(factor^2))), type="l")