#!/usr/bin/Rscript

#Bhishan Poudel
# Jan 17, 2016


setwd("~/Copy/Programming/R/rprograms/plotting/3dplotting/")

# example(plot3D)
library(plot3D)

# define a function
spher2cart <- function(r, theta, phi) {
  
  x <- r * sin(theta) * cos(phi)
  y <- r * sin(theta) * sin(phi)
  z <- r * cos(theta)
  
  return(list(x = x, y = y, z = z))
}

# define a mesh of values for the angles theta and phi
theta <- seq(0, pi, length = 50)
phi <- seq(0, 2*pi, length = 50)
M <- mesh(theta, phi)
names(M) <- c("theta", "phi")

# value of r
r <- 1 + cos(2 * M$theta)

# now we need to express this in Cartesian coordinates
cart <- spher2cart(r, M$theta, M$phi)

# plot
par(mar = c(0, 0, 0, 0))
surf3D(cart$x, cart$y, cart$z, 
       border = "black",
       colkey = FALSE, 
       bty = "f",
       phi = 20, theta = 30)

# ?surf3D

# border = "black": This turns on the grid of black lines.
# colkey = FALSE: Turn off the colour legend
# bty = "f": Draw the full box of axes
# phi = 20, theta = 30: Change the angle from which you look at the plot
