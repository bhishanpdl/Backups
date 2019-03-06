#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 22, 2016

# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/2dplots/")

# Start device driver to save output to figure.pdf
#png(file="figures/yinvert.png")
a <- rnorm(1000)
b <- a + 10*runif(1000)

plot(a, b, ylim=rev(range(b)))

# Turn off device driver
#dev.off()
