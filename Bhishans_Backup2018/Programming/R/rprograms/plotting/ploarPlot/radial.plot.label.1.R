#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 19, 2016

# example of radial.plot
# radial.plot(lengths,radial.pos=NULL,labels=NA,label.pos=NULL,radlab=FALSE,
#             start=0,clockwise=FALSE,rp.type="r",label.prop=1.1,main="",xlab="",ylab="",
#             line.col=par("fg"),lty=par("lty"),lwd=par("lwd"),mar=c(2,2,3,2),
#             show.grid=TRUE,show.grid.labels=4,show.radial.grid=TRUE,rad.col="gray",
#             grid.col="gray",grid.bg="transparent",grid.left=FALSE,grid.unit=NULL,
#             point.symbols=1,point.col=par("fg"),show.centroid=FALSE,radial.lim=NULL,
#             radial.labels=NULL,boxed.radial=TRUE,poly.col=NA,add=FALSE,...)

library('plotrix')
testlen<-c(rnorm(10)*2+5)
# do the labels in clock24 units
testpos<-c(6.74,8.3,10.55,12.33,13.75,15.9,17.15,19.36,21.02,23.27)
oldpar<-clock24.plot(testlen,testpos,main="Test radial.plot.labels",
                     rp.type="s",point.symbols=3,point.col="blue")
radial.plot.labels(testlen,testpos,units="clock24",labels=LETTERS[1:10],
                   pos=3,col="blue")
testangle<-c(25,42,67,94,128,173,191,234,268,307)
# now a polar plot
polar.plot(testlen,testangle,main="Test radial.plot.labels",rp.type="p",
           poly.col="green")
radial.plot.labels(testlen,testangle,units="polar",labels=LETTERS[1:10])
# reset par
par(oldpar)


# # Arguments
# # 
# # lengths
# # A numeric data vector or matrix. If lengths is a matrix, 
# the rows will be considered separate data vectors.
# # radial.pos
# # A numeric vector or matrix of positions in radians. 
# These are interpreted as beginning at the right (0 radians) and 
# moving counterclockwise. If radial.pos is a matrix, 
# the rows must correspond to rows of lengths.
# # labels
# # Character strings to be placed at the outer ends of the lines. 
# If set to NA, will suppress printing of labels, but if missing, 
# the radial positions will be used.
# # label.pos
# # The positions of the labels around the plot in radians.
# # radlab
# # Whether to rotate the outer labels to a radial orientation.
# # start
# # Where to place the starting (zero) point. Defaults to the 3 o'clock position.
# # clockwise
# # Whether to interpret positive positions as clockwise from the starting point. 
# The default is counterclockwise.
# # rp.type
# # Whether to draw (r)adial lines, a (p)olygon, (s)ymbols or some combination of these. 
# If lengths is a matrix and rp.type is a vector, 
# each row of lengths can be displayed differently.
# # label.prop
# # The label position radius as a proportion of the maximum line length.
# # main
# # The title for the plot.
# # xlab,ylab
# # Normally x and y axis labels are suppressed.
# # line.col
# # The color of the radial lines or polygons drawn.
# # lty
# # The line type(s) to be used for polygons or radial lines.
# # lwd
# # The line width(s) to be used for polygons or radial lines.
# # mar
# # Margins for the plot. Allows the user to leave space for legends, long labels, etc.
# # show.grid
# # Logical - whether to draw a circular grid.
# # show.grid.labels
# # Whether and where to display labels for the grid - see Details.
# # show.radial.grid
# # Whether to draw radial lines to the plot labels.
# # rad.col
# # Color of the radial lines on the grid.
# # grid.col
# # Color of the circumferential lines on the grid.
# # grid.bg
# # Fill color of above.
# # grid.left
# # Whether to place the radial grid labels on the left side.
# # grid.unit
# # Optional unit description for the grid.
# # point.symbols
# # The symbols for plotting (as in pch).
# # point.col
# # Colors for the symbols.
# # show.centroid
# # Whether to display a centroid.
# # radial.lim
# # The range of the grid circle. Defaults to pretty(range(lengths)), 
# # but if more than two values are passed, the exact values will be displayed.
# # radial.labels
# # Optional labels for the radial grid. The default is the values of radial.lim.
# # boxed.radial
# # Whether to use boxed.labels or text for radial labels.
# # poly.col
# # Fill color if polygons are drawn. Use NA for no fill.
# # add
# # Whether to add one or more series to an existing plot.
# # ...
# # Additional arguments are passed to plot.
# # 
