#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : 
# Program: 
# Ref    : http://felixfan.github.io/ggplot2-remove-grid-background-margin/

# Set working directory
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Libraries  
library(ggplot2)

# Data
a <- seq(1, 20)
b <- a^0.25
df <- as.data.frame(cbind(a, b))

g = ggplot(df, aes(x = a, y = b)) + geom_point()
#print(g)

# theme_bw() will get rid of the background
g = g + theme_bw()
#print(g)

# remove grid (does not remove backgroud colour and border lines)
g = g + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
#print(g)

# remove border lines (does not remove backgroud colour and grid lines)

g = g + theme(panel.border = element_blank())
#print(g)

# remove background (remove backgroud colour and border lines, but does not remove grid lines)
g= g + theme(panel.background = element_blank())
#print(g)

# add axis line
g = g + theme(axis.line = element_line(colour = "black"))
#print(g)

# put all together - method 1

g = g + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
               panel.background = element_blank(), axis.line = element_line(colour = "black"))
#print(g)

# put all together - method 2

g = g + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                            panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
print(g)
