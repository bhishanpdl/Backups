#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://finzi.psych.upenn.edu/library/ggplot2/html/geom_ribbon.html


# Set the working directory
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# libraries
library(ggplot2)
data(mtcars)

p1 = ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() +
  annotate("rect", xmin = 3, xmax = 4.2, ymin = 12, ymax = 21,
           alpha = .2)

print(p1)