#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/34829847/how-to-shade-under-part-of-a-dnorm-plot-with-base-graphics?rq=1


# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)


# list
list1 = c(1:10)

# sequence
x = seq(1, 100,2)
xx = seq(from = 4.5, to = 2.5, by = -0.5)
y = seq(1, 100, length.out=5)

print(x[10])