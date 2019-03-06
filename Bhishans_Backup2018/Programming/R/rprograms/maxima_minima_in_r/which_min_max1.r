#!/usr/bin/env Rscript

# Author  : Bhishan Poudel
# Date    : Apr 11, 2016
# Ref     : http://stackoverflow.com/questions/15630032/which-max-ties-method-in-r
# Program : Find the Index of the Minimum or Maximum Value

# set working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

##############################################
# values
x = seq(0.001, 10.0, length.out = 5)
y = 1.0/(x**2) - 2/(x**3)

print(x)
print(y)
print(max(y))

max_index = which.max(y)
print(max_index)
print(y[max_index])
print(x[max_index])

lines(x,y)
abline(v=x[max_index],col='red')
abline(h = -1:5, v = -2:3, col = "lightgray", lty = 3)

########################################################
## For repeated values (last maximum)
x <- sample(1:20, 10, repl=TRUE)
print(x)

max_index = which(x==max(x), arr.ind=TRUE) # it was FALSE by default
print(max_index)

# method 2
a = tail(which(x==max(x), arr.ind=TRUE) , 1)
print(max_index)
