#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016
# clear; Rscript plot1.r; xdg-open ./plots/plot1.eps

# http://www.statmethods.net/advgraphs/axes.html
# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/2dplots/")

# Start device driver to save output to figure.pdf
png(file="figures/plot1.png")

# Legend Example
attach(mtcars)
boxplot(mpg~cyl, main="Milage by Car Weight",
        yaxt="n", xlab="Milage", horizontal=TRUE,
        col=terrain.colors(3))
legend("topright", inset=.05, title="Number of Cylinders",
       c("4","6","8"), fill=terrain.colors(3), horiz=TRUE)

# Turn off device driver
dev.off()
