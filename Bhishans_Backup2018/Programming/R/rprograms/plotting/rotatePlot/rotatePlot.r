#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 27, 2016

# setting working directory
setwd("~/Copy/Programming/R/rprograms/plotting/rotatePlot/")

plot(1:10, rnorm(10))

library(gridGraphics)

grab_grob <- function(){
  grid.echo()
  grid.grab()
}

g <- grab_grob()
grid.newpage()
pushViewport(viewport(width=0.7,angle=30))
grid.draw(g)