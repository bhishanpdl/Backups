#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 10, 2016

# mehtod 1

data <- read.csv('plot_csv.csv', header=T)
#plot(data.frame(data[1],data[2]),col='green')

# method 2
plot(serial ~ scale, data,col='orange')