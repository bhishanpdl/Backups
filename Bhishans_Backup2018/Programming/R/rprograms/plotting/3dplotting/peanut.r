#!/usr/bin/Rscript

#Bhishan Poudel
# Jan 17, 2016


# define a function
cone <- function(x, y,a=0.99,e=1){
  ((x^2-y^2)-a^4+e^4)
}

# assign values
x <- y <- seq(-1, 1, length= 20)
# we use the outer() function to apply the function cone 
#  at every combination of x and y
z <- outer(x, y, cone)

# plotting
persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab="Height",
      theta=0, phi=0,
      col="springgreen", 
      shade=0.5)
