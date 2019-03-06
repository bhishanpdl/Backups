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


# redefine theta and phi
theta <- M$theta
phi <- M$phi

# assign value of r
r <- sin(pi/2) * ( 1 - 3/4*((sin(theta))^2))

# convert Spherical to Cartesian coordinates
cart <- spher2cart(r, theta, phi)

# redefine x,y,z
x <- cart$x
y <- cart$y
z <- cart$z

# plot
par(mar = c(0, 0, 0, 0))
surf3D(x, y, z,
       border = "black",
       colkey = FALSE,
       col='grey',
       phi = 20, theta = 30
      )

# ?surf3D
# example(surf3D)

# border = "black": This turns on the grid of black lines.
# colkey = FALSE: Turn off the colour legend
# bty = "f": Draw the full box of axes
# phi = 20, theta = 30: Change the angle from which you look at the plot
