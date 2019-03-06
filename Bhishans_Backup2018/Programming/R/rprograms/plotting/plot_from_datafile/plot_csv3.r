#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

data <- read.csv('plot_csv.csv')
plot(serial ~ scale, data)
dev.new()
plot(spawn ~ scale, data)
dev.new()
plot(for. ~ scale, data)
dev.new()
plot(worker ~ scale, data)