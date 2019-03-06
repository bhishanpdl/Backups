#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/12429333/how-to-shade-a-region-under-a-curve-using-ggplot2?rq=1


# Set the working directory
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# libraries
library(ggplot2)
dt_tails <- function(x){
  y <- dt(x,7)
  y[abs(x) < 1.96] <- NA
  return(y)
}
dt_7 <- function(x) dt(x,7)
p <- ggplot(data.frame(x=c(-6,6)),aes(x=x)) + 
  stat_function(fun=dt_7, geom="area", fill="white", colour="black") 
p <- p + stat_function(fun=dt_tails, geom="area", fill='#b14025') 
p <- p + theme(panel.grid.major=element_blank(), 
               panel.grid.minor=element_blank(),
               panel.background=element_rect(fill="#eae9c8") )
plot(p)