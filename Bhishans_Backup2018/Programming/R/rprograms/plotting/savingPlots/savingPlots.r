#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 25, 2016

# set working directory
setwd("~/Copy/Programming/R/rprograms/plotting/savingPlots/")
Temperature <- airquality$Temp
print(head(Temperature))

# jpeg (note: default size is 480*480 px)
jpeg(file="savingPlots.jpeg")
hist(Temperature, col="darkgreen")
dev.off()

#bitmap
bmp(file="savingPlots.bmp",
    width=6, height=4, units="in", res=100)
hist(Temperature, col="steelblue")
dev.off()

# png
png(file="savingPlots.png",
    width=600, height=350)
hist(Temperature, col="gold")
dev.off()

# vector image
pdf(file="savingPlots.pdf")
hist(Temperature, col="violet")
dev.off()

# vector image as postscript
postscript(file="savingPlots.ps")
hist(Temperature, col="violet")
dev.off()

