#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 22, 2016

# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/2dplots/")

x<-seq(0,2*pi,0.1)
y<-sin(x)
plot(x,
     y,
     axes=FALSE, # Do not plot any axes
     ann=FALSE) # Do not plot any annotations
axis(3)   # Draw the x-axis above the plot area
axis(2)   # Draw the y-axis to the left
box()