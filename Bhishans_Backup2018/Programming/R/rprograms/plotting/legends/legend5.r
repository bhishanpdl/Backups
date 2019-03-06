#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 16, 2016

setwd("~/Copy/Programming/R/rprograms/plotting/legends/")
# set up a device driver to plot
#postscript(file='~/Copy/Programming/R/rprograms/plotting/legends/legend2.eps')

x <- 1:1000
y <- 1:1000

plot(x,y,xlim=c(0,1000), ylim=c(0,1000),axes=F)
box()
axis(1,at=seq(0,1000,500),labels=T)
axis(2,at=seq(0,1000,200),labels=T)


# turn off device driver
#dev.off()