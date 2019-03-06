#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 22, 2016

# setting working directory
#setwd("~/Copy/Programming/R/rprograms/plotting/rotatePlot/")

# Start device driver to save as .eps .ps .pdf
#postscript(file="rotatePostscript.eps",horizontal=FALSE)

# data for time
t <- seq(0,1,0.2)

# increasing figure margin
par(xpd=T, mar=par()$mar+c(1,1,0,2))

# # print the table
# df1 <- data.frame("time"=t, "path1"=t,"path2"=t*t,"path3"=t^3)
# print(df1)


# plot
t <- seq(0,1,0.2)
plot(t,t,type="l", 
     xaxt = 'n', 
     yaxt = 'n', 
     xlab="", 
     ylab='distance (2z/g)',
     ylim = rev(range(t)))
lines(t,t^2,col="green")
lines(t,t^3,col="blue")
axis(3)
axis(1)
axis(2, at = pretty(t), labels = format(pretty(t), digits = 1), las = 1)
axis(4, at = pretty(t), labels = format(pretty(t), digits = 1), las = 1)

# adding text
mtext("time", side = 3,line = 2.5, cex = 1.0)

# mtext("fig. Explicit illustration of Hamiltons's principle for three different paths",
#       side = 1,line = 2.5, cex = 1.0)

#mytitle <- "fig. Explicit illustration of Hamiltons's principle \n for three different paths"
#title(mytitle, line = -13)

title(expression
      ("fig. Explicit illustration of Hamiltons's principle for three different paths"), 
      line=-47)

# Turn off device driver (to flush output to png)
#dev.off()
