#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 16, 2016

# set up a device driver to plot
#postscript(file='~/Copy/Programming/R/rprograms/bquote/bquote1.eps')

set.seed(1)
vall <- format(rnorm(1),digits=3)
eq <- bquote(bold(R^2 == .(vall)))
sq <- seq(0, 1, by = 0.1)
plot(sq, sq, type = "l")
text(0.4, 0.8, eq)

# turn off device driver
#dev.off()