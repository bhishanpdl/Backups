#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 19, 2016

library(plotrix)
polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,rp.type="s",
           point.symbols=19,radial.lim=c(0,5),boxed.radial=FALSE, 
           show.grid.labels=2)

polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,rp.type="s",
           point.symbols=19,radial.lim=c(0,5),boxed.radial=FALSE, 
           show.grid.labels=2, radial.labels=c("",1:5))

# We can also get rid of the axial lines using show.radial.grid:
  
polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,rp.type="s",
             point.symbols=19,radial.lim=c(0,5),boxed.radial=FALSE, 
             show.grid.labels=2, radial.labels=c("",1:5), 
             show.radial.grid=FALSE)

# plotting with lines
polar.plot(NA,NA,start=90,clockwise=TRUE,rp.type="",
           radial.lim=c(0,5),boxed.radial=FALSE, show.grid.labels=2,
           radial.labels=c("",1:5)) # First plotting the grid
polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,rp.type="s",
           point.symbols=19,radial.lim=c(0,5),show.grid=FALSE, 
           show.radial.grid=FALSE, add=TRUE)  # Then the points without the grid

# color radial lines
polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,
           rp.type="s",point.symbols=19,radial.lim=c(0,5),
           boxed.radial=F,grid.col="red",point.col="green")