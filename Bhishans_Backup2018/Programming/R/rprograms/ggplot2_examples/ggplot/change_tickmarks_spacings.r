#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : Apr 17, 2016
# Program:
# Ref    : https://stackoverflow.com/questions/11335836/increase-number-of-axis-ticks-in-ggplot2?rq=1

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir) 

# Libraries  
library(ggplot2)
dat <- data.frame(x = rnorm(100), y = rnorm(100))

g = ggplot(dat, aes(x,y)) +
    geom_point()

#print(g)

### method 1
g = ggplot(dat, aes(x,y)) +
    geom_point() +
    scale_x_continuous(breaks = round(seq(min(dat$x), max(dat$x), by = 0.5),1)) +
    scale_y_continuous(breggplot(dat, aes(x,y)) + geom_point() +
                         scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
                         scale_y_continuous(breaks = scales::pretty_breaks(n = 10))
                       aks = round(seq(min(dat$y), max(dat$y), by = 0.5),1))

print(g)

### methos 2
ggplot(dat, aes(x,y)) + geom_point() +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10))

#print(g)