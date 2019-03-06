#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 12, 2016
# ref: http://harding.edu/fmccown/r/



setwd("~/Copy/Programming/R/rprograms/plotting/")

# Read values from tab-delimited autos.dat
autos_data <- read.table("data/autos.dat", header=T, sep="\t")

# Start device driver to save output to figure.pdf
postscript(file="dotChart.eps", height=10.5, width=5)

# Create a colored dotchart for autos with smaller labels
dotchart(t(autos_data), color=c("red","blue","darkgreen"),
   main="Dotchart for Autos", cex=0.8)
   
# Turn off device driver (to flush output)
dev.off()
