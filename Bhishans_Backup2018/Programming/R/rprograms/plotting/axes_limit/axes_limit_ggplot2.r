#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Ref    : 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

# base method
my.data <- seq(0,5)
my.points <- seq(5,9)
plot(my.data, ylim=c(0,max(my.data,my.points)))
points(my.points)

my.data <- seq(0,5)
my.points <- seq(5,9)
plot(my.data, ylim=c(min(my.data,my.points),max(my.data,my.points)))
points(my.points)

################################################################################
# usign ggplot
require(ggplot2)
data(mpg) 

p1 = ggplot(mpg, aes(cyl, cty)) + geom_point() + xlim(5, 8)
#print(p1)
p2 = p1 + xlim(4,8)
#print(p2)