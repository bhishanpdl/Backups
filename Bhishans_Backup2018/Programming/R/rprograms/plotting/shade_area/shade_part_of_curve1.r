#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/34829847/how-to-shade-under-part-of-a-dnorm-plot-with-base-graphics?rq=1


# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

x   <- 140:200
y   <- dnorm(x, mean=170, sd=8)
plot(x, y, type="l", lwd=1, xlab="Height", ylab="Probability")

x1 <- min(which(x >= 0))  
x2 <- max(which(x <=  160))
polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray")