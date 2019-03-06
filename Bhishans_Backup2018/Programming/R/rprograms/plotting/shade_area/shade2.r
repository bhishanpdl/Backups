#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Libraries
library(ggplot2)
library(reshape2) #for data reshaping
library(gridExtra) # for grid.arrange

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

dat <-data.frame(x = c(10, 10, 20, 20), y = c(3, 4, 5, 2), order = c(1, 2,1, 2))

a <-ggplot(dat, aes(x = x, y = y)) +
    geom_line(aes(group = order)) +
    geom_point(aes(group = order)) +
    geom_polygon(aes(x = x, y = y), fill = "red", alpha = 0.2)

#print(a)

dat <-data.frame(x = c(10, 10, 20, 20), y = c(3, 4, 2, 5), order = c(1, 2,     1, 2))

b <-ggplot(dat, aes(x = x, y = y)) +
     geom_line(aes(group = order)) +
     geom_point(aes(group = order)) +
     geom_polygon(aes(x = x, y = y), fill = "red", alpha = 0.2)

dat <-data.frame(x = c(10, 20, 10, 20), y = c(3, 4, 5, 2), order = c(1, 2,     2, 1))

c <-ggplot(dat, aes(x = x, y = y))  +
     geom_line(aes(group = order)) +
     geom_point(aes(group = order)) +
     geom_polygon(aes(x = x, y = y), fill = "red", alpha = 0.2)

grid.arrange(a, b, c, nrow = 1)