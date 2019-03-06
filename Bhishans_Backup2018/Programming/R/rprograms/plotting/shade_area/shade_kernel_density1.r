#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/3494593/shading-a-kernel-density-plot-between-two-points?lq=1


# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# libraries
library(ggplot2)


set.seed(1)
draws <- rnorm(100)^2
dens <- density(draws)
plot(dens)
#or in one line like this: plot(density(rnorm(100)^2))

# I'd like to shade the area under the PDF from the 75th to 95th percentiles. 
# It's easy to calculate the points using the quantile function:
  
q75 <- quantile(draws, .75)
q95 <- quantile(draws, .95)

x1 <- min(which(dens$x >= q75))  
x2 <- max(which(dens$x <  q95))
with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))

################################################################################
# method 2 : using ggplot2
dd <- with(dens,data.frame(x,y))
library(ggplot2)
p2 <- qplot(x,y,data=dd,geom="line")+
  geom_ribbon(data=subset(dd,x>q75 & x<q95),aes(ymax=y),ymin=0,
              fill="red",colour=NA,alpha=0.5)

print(p2)

################################################################################
# method 3: usign lattice
library(lattice)
#Set up the data
set.seed(1)
draws <- rnorm(100)^2
dens <- density(draws)

#Put in a simple data frame   
d <- data.frame(x = dens$x, y = dens$y)

#Define a custom panel function;
# Options like color don't need to be hard coded    
shadePanel <- function(x,y,shadeLims){
  panel.lines(x,y)
  m1 <- min(which(x >= shadeLims[1]))
  m2 <- max(which(x <= shadeLims[2]))
  tmp <- data.frame(x1 = x[c(m1,m1:m2,m2)], y1 = c(0,y[m1:m2],0))
  panel.polygon(tmp$x1,tmp$y1,col = "blue")
}

#Plot
xyplot(y~x,data = d, panel = shadePanel, shadeLims = c(1,3))

################################################################################
# plot bothside
set.seed(1)
draws <- rnorm(100)^2
dens <- density(draws)
plot(dens)

q2     <- 2
q65    <- 6.5
qn08   <- -0.8
qn02   <- -0.2

x1 <- min(which(dens$x >= q2))  
x2 <- max(which(dens$x <  q65))
x3 <- min(which(dens$x >= qn08))  
x4 <- max(which(dens$x <  qn02))

with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))
with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="gray"))
