#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016
# clear; Rscript plot1.r; xdg-open ./plots/plot1.eps

# http://www.statmethods.net/advgraphs/axes.html
# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/2dplots/")

# specify the data
x <- c(1:10); y <- x; z <- 10/x

# create extra margin room on the right for an axis
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y
plot(x, y,type="b", pch=21, col="red",
     yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left
axis(2, at=x,labels=x, col.axis="red", las=2)

# draw an axis on the right, with smaller text and ticks
axis(4, at=z,labels=round(z,digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

# add a title for the right axis
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels
title("An Example of Creative Axes", xlab="X values",
      ylab="Y=X")
   
# Turn off device driver
#dev.off()


