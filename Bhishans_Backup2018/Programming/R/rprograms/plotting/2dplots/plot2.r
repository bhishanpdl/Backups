#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 22, 2016

# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/2dplots/")

# Start device driver to save output to figure.pdf
#postscript(file="figures/plot1.eps", height=8.5, width=5)

# Set 'x'
x <- 0:10

# set xlim and ylim
# set ylim to rev() the range() of 'x'

#plot(x, xlim = c(0, 10), ylim = rev(range(x)))
plot(x, xlim = c(0, 10), ylim = rev(range(x)), yaxs = "i", xaxs = "i")

# example 2
#plot(x, xlim = c(0, 10), ylim = rev(range(x)), yaxs = "i", xaxs = "i", axes = FALSE)

# Draw the x axis
axis(1, at = 0:10)

# Draw the y axis
axis(2, at = seq(0, 10, 2), las = 2)

# Put a box around the plot
box()
   
# Turn off device driver
#dev.off()


