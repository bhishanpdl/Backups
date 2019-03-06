#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://finzi.psych.upenn.edu/library/ggplot2/html/geom_ribbon.html


# Set the working directory
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# libraries
library(ggplot2)

# Generate data
huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
h <- ggplot(huron, aes(year))

h + geom_ribbon(aes(ymin=0, ymax=level))
h + geom_area(aes(y = level))

# Add aesthetic mappings
p1 <- h +
  geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70") +
  geom_line(aes(y = level))

print(p1)