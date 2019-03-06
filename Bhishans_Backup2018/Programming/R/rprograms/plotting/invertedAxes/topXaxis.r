#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 26, 2016

# setting pwd
setwd("~/Copy/Programming/R/rprograms/plotting/invertedAxes/")

# set up a device driver to plot
#png(file='multiPlot1.png')
x<-seq(0,2*pi,0.1)
y<-sin(x)
plot(x,
     y,
     axes=FALSE, # Do not plot any axes
     ann=FALSE) # Do not plot any annotations
axis(3)   # Draw the x-axis above the plot area
axis(4)   # Draw the y-axis to the right of the plot area
box()



# turn off device driver
#dev.off()
