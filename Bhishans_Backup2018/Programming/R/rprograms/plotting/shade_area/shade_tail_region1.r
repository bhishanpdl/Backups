#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/12429333/how-to-shade-a-region-under-a-curve-using-ggplot2?rq=1


# Set the working directory
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# libraries
library(ggplot2)
xv<-seq(0,4,0.01)
yv<-dnorm(xv,2,0.5) 
plot(xv,yv,type="l") 
polygon(c(xv[xv<=1.5],1.5),c(yv[xv<=1.5],yv[xv==0]),col="grey") 

x<-seq(0.0,0.1699,0.0001)   
ytop<-dnorm(0.12,0.08,0.02)
MyDF<-data.frame(x=x,y=dnorm(x,0.08,0.02))
p<-qplot(x=MyDF$x,y=MyDF$y,geom="line") 
p+geom_segment(aes(x=0.12,y=0,xend=0.12,yend=ytop))

# Create a polygon with the area you want to shade

#First subst the data and add the coordinates to make it shade to y = 0
shade <- rbind(c(0.12,0), subset(MyDF, x > 0.12), c(MyDF[nrow(MyDF), "X"], 0))

#Then use this new data.frame with geom_polygon
plot1 <- p + geom_segment(aes(x=0.12,y=0,xend=0.12,yend=ytop)) +
  geom_polygon(data = shade, aes(x, y))

print(plot1)