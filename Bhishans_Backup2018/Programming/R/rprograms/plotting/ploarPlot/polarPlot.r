#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 19, 2016

# ref: http://www.inside-r.org/packages/cran/plotrix/docs/polar.plot

# syntax
# polar.plot(lengths,polar.pos=NULL,labels,label.pos=NULL,
#         start=0,clockwise=FALSE,rp.type="r",...)

setwd("~/Copy/Programming/R/rprograms/plotting/ploarPlot/")

library('plotrix')

cat("ploar plot example\n")

testlen<-c(rnorm(36)*2+5)
testpos<-seq(0,350,by=10)
polar.plot(testlen,testpos,main="Test Polar Plot",lwd=3,line.col=4)
oldpar<-polar.plot(testlen,testpos,main="Test Clockwise Polar Plot",
                   radial.lim=c(0,15),start=90,clockwise=TRUE,lwd=3,line.col=4)
# reset everything
par(oldpar)

# Usage
# 
# polar.plot(r, theta, theta.zero = 0, theta.clw = FALSE,
#            method = 1, rlabel.axis = 0, dir = 8,
#            rlimits = NULL, grid.circle.pos = NULL,
#            grid.lwd = 1, grid.col = "black", points.pch = 20,
#            points.cex = 1, lp.col = "black", lines.lwd = 1,
#            lines.lty = 1, polygon.col = NA, polygon.bottom = TRUE,
#            overlay = NULL, pi2.lab = TRUE, text.lab = NULL,
#            num.lab = NULL, rlabel.method = 1, rlabel.pos = 3,
#            rlabel.cex = 1, rlabel.col = "black", tlabel.offset = 0.1,
#            tlabel.cex = 1.5, tlabel.col = "black", main = NULL,
#            sub = NULL)
# 
# Arguments
# r 	        vector of radial data
# theta 	    vector of angular data in radians
# theta.zero 	angle direction on plot of theta=0
# theta.clw 	have clockwise orientation of theta values or not
# method    	integer specifying the method of plotting (r,theta)-data: 1. points (default); 2. line; 3. polygon
# rlabel.axis 	angular direction on the plot of radial label axis (in radians)
# dir 	number of radial grid lines (default=8)
# rlimits 	Interval for radial axis as a numeric vector: c(lower,upper). Interval will be extended by the default use of pretty()-function. (default = NULL)
# grid.circle.pos 	radial axis position of grid circles as numeric vector of minimum length 2. Overrides the default positioning of grid circles by pretty()-function. (default = NULL)
# grid.lwd 	grid line width
# grid.col 	grid line color
# points.pch 	points plotting symbol
# points.cex 	character expansion factor for points
# lp.col 	color of points (method 1) or lines (method 2 and method 3) . In method 3, set lp.col=0 for polygons without border
# lines.lwd 	line width for plotting methods 2 and 3 (default = 1)
# lines.lty 	line type (default = 1)
# polygon.col 	color of polygon (default = NA)
# polygon.bottom 	polygon to the back i.e. behind the grid (default = TRUE)
# overlay 	NULL (default), no overlay
# pi2.lab 	angular labels in radians (0, pi/2, pi, 3*pi/2) (default)
# text.lab 	angular axis labels from a character vector c("N","E","S","W") (default = NULL)
# num.lab 	numeric angular axis labels in interval [0;num.lab] (default = NULL). Number of labels: dir
# rlabel.method 	integer specifying method of plotting radial axis labels: 0. no radial labels; 1. labels at pretty radial distances (default); 2. exclude label at radial distace 0; 3. exclude label at maximum radial distance; 4. exclude radial labels at distance 0 and at maximum radial distance
# rlabel.pos 	text position of radial axis labels (NULL,1,2,3,4)
# rlabel.cex 	cex for radial axis labels
# rlabel.col 	color of the radial labels
# tlabel.offset 	radial offset for angular axis labels in fraction of maximum radial value (default = 0.1)
# tlabel.cex 	cex for angular axis labels
# tlabel.col 	angular labels color
# main 	plot main title
# sub 	plot sub title

