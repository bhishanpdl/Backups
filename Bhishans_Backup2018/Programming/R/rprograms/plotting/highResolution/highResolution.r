#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 16, 2016

# setting pwd
setwd("~/Copy/Programming/R/rprograms/plotting/highResolution/")

# using ggplot2 
library(ggplot2)

ggplot_alternative <- function()
{
  the_data <- data.frame(
    x <- seq(0, 1, length.out = 100),
    y = pbeta(x, 1, 10)
  )
  
  ggplot(the_data, aes(x, y)) +
    geom_line() +
    xlab("False Positive Rate") +
    ylab("Average true positive rate") +
    coord_cartesian(0:1, 0:1)
}

ggsave(
  "highResolution.png",
  ggplot_alternative(),
  width = 3.25,
  height = 3.25,
  dpi = 1200
)
