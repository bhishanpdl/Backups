#!/usr/bin/Rscript

#Bhishan Poudel
# Jan 20, 2016

# ref: http://www.sthda.com/english/wiki/a-complete-guide-
#to-3d-visualization-device-system-in-r-r-software-and-data-visualization

library("rgl")

data(iris)
print(head(iris))

rgl.open() # Open a new RGL device
rgl.points(x, y, z, color ="lightgray") # Scatter plot