#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 10, 2016

# Libraries
#library(ggplot2)

data <- read.csv('plot_csv.csv', header=T)

plot(data$scale, data$serial, ylim=c(0,750))
points(data$scale, data$spawn, col='red')
points(data$scale, data$for., col='green')
points(data$scale, data$worker, col='blue')
