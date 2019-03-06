#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Ref    : http://www.burns-stat.com/plot-ranges-of-data-in-r/

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

# data
one2ten <- 1:10
#ggplot2 demands that you have a data frame:
ggdat <- data.frame(first=one2ten, second=one2ten)

# base
plot(one2ten, one2ten)

# ggplot2
require(ggplot2)
print(qplot(first, second, data=ggdat))

# xlim using base
plot(one2ten, one2ten, xlim=c(-2,10))

# xlim using ggplot2
print(qplot(first, second, data=ggdat) + xlim(-2, 10))
# aliter
g1 = qplot(first, second, data=ggdat)
g2 = g1 + xlim(-2, 10)
print(g2)

# reverse direction
plot(one2ten, one2ten, col="royalblue", lwd=2, xlim=c(10,1))
text(7, 1.7, "xlim = c(10, 1)")

print(qplot(first, second, data=ggdat) + xlim(10, 1))

# expansion
plot(one2ten, one2ten, xlim=c(0,10))
par("usr")

print(qplot(first, second, data=ggdat) +
        scale_x_continuous(expand=c(1,1)))




