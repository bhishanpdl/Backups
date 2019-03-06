#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 26, 2016

# setting pwd
setwd("~/Copy/Programming/R/rprograms/plotting/invertedAxes/")

# set up a device driver to plot
#png(file='multiPlot1.png')

# the function for minor log ticks
minor.ticks.axis <- function(ax,n,t.ratio=0.5,mn,mx,...){
  
  lims <- par("usr")
  if(ax %in%c(1,3)) lims <- lims[1:2] else lims[3:4]
  
  major.ticks <- pretty(lims,n=5)
  if(missing(mn)) mn <- min(major.ticks)
  if(missing(mx)) mx <- max(major.ticks)
  
  major.ticks <- major.ticks[major.ticks >= mn & major.ticks <= mx]
  
  labels <- sapply(major.ticks,function(i)
    as.expression(bquote(10^ .(i)))
  )
  axis(ax,at=major.ticks,labels=labels,...)
  
  n <- n+2
  minors <- log10(pretty(10^major.ticks[1:2],n))-major.ticks[1]
  minors <- minors[-c(1,n)]
  
  minor.ticks = c(outer(minors,major.ticks,`+`))
  minor.ticks <- minor.ticks[minor.ticks > mn & minor.ticks < mx]
  
  
  axis(ax,at=minor.ticks,tcl=par("tcl")*t.ratio,labels=FALSE)
  
}

# Make some reproducible example data
x <- 1:8
y <- 10^(sort(runif(8, 1, 10), decreasing = TRUE))

# Plot without axes
plot(x, log10(y), # function to plot
     xlab="",          # suppress x labels
     type = 'l',       # specify line graph
     xlim = c(min(x), (max(x)*1.3)),  # extend axis limits to give space for text annotation
     ylim = c(0, max(log10(y))),      # ditto
     axes = FALSE)    # suppress both axes

# Add fancy log axis and turn tick labels right way up
minor.ticks.axis(2, 9, mn=0, mx=10, las=1)

#Add x-axis up the top
axis(3)

# Add x-axis label
mtext("x", side = 3, line = 2)

# add an annotation to the end of the line
text(max(x), min(log10(y)), "Example", pos = 1)






# turn off device driver
#dev.off()
