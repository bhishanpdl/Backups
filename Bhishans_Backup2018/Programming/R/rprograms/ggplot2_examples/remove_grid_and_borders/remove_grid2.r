#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : 
# Program: 
# Ref    : http://stackoverflow.com/questions/10861773/remove-grid-background-color-and-top-and-right-borders-from-ggplot2

# Set working directory
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Libraries  
library(ggplot2)

# Data
a <- seq(1,20)
b <- a^0.25
df <- as.data.frame(cbind(a,b))

g = ggplot(df, aes(x = a, y = b)) + geom_point() +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) 
print(g)