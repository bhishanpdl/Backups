#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 16, 2016

setwd("~/Copy/Programming/R/rprograms/plotting/legends/")
# set up a device driver to plot
#postscript(file='~/Copy/Programming/R/rprograms/plotting/legends/legend2.eps')

x <- 1:10
y <- 1:10

# # default plotting
# plot(x,y)
# 
# # plotting with custom ticks
# plot(x,y,axes=FALSE)
# axis(1,at=1:10,labels=1:10)
# axis(2,at=seq(0,10,by=1))
# box()

# custom ticks using a function
plot(x,y,axes=FALSE)
at.labels=axis(1)
axis(1,at=seq(at.labels[1], at.labels[length(at.labels)],
              (at.labels[2]-at.labels[1])/2), labels=F )

box()

# turn off device driver
#dev.off()