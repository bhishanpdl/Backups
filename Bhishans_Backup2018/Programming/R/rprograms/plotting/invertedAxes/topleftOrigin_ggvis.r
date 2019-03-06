#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 26, 2016

# setting pwd
setwd("~/Copy/Programming/R/rprograms/plotting/invertedAxes/")

# set up a device driver to plot
#png(file='multiPlot1.png')

dfn <- read.table(header=T, text='
supp dose length
  OJ  0.5  13.23
  OJ  1.0  22.70
  OJ  2.0  26.06
  VC  0.5   7.98
  VC  1.0  16.77
  VC  2.0  26.14
')

# plot
library(ggplot2)
library(ggvis)

plot2 <- dfn %>% ggvis(~dose, ~length, fill= ~supp, stroke=~supp) %>% 
  layer_lines(fillOpacity=0) %>%
  scale_numeric('y', reverse=T) %>% 
  add_axis('x',orient='top')

print(plot2)


# turn off device driver
#dev.off()
