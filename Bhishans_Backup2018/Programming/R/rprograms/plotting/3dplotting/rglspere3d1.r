#!/usr/bin/Rscript

#Bhishan Poudel
# Jan 20, 2016

#ref: http://www.programiz.com/r-programming/3d-plot

# example(persp3D), example(surf3D) and example(scatter3D)

library(rgl)
open3d()                                   # create new plot
spheres3d(x = 1, y = 1, z = 1, radius = 1) # produce sphere
axes3d()                                   # add x, y, and z axes