#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 22, 2016

# setting working directory
#setwd("~/Copy/Programming/R/rprograms/plotting/ticks/")

# Start device driver to save output to figure.pdf
#png(file="gravPotential.png")


x <- seq(-4,4,0.01)
print(length(x))

# Example of a Function
gravPotential <- function(xx) {
  # Compute the gravitational potential
  
  if ( abs(xx) >= 1 ) {
    yy <- -1/abs(xx)
  }
  else {
    yy <- xx*xx/2 - 3/2
  }
  
  return(yy)
}


# create a vector y 
y <- NULL
for (i in 1:length(x) ) {
  y[i] = gravPotential(x[i])
}
print(length(y))


plot(x,y,type="l",
     main="Plot of gravitational potential for solid sphere",
     xlab="Distance from the center \n unit = r/R",
     ylab="Potential (unit = GM/R)",
     ylim= c(-2,0))

# add horizontal and vertical lines
abline(v=c(-1,1),lty=2)
abline(h=min(y),lty=2)
abline(h=-1,lty=2)

# Add minor tick marks
library(Hmisc)
minor.tick(nx=2, ny=1)

# Turn off device driver
#dev.off()

