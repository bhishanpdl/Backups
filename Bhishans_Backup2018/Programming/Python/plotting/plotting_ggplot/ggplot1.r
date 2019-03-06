#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 09, 2016

# Libraries
library(ggplot2)

ggplot(mtcars, aes(mpg, qsec)) +
  geom_point(colour='steelblue') +
  scale_x_continuous(breaks=c(10,20,30),
                     labels=c("horrible", "ok", "awesome"))
