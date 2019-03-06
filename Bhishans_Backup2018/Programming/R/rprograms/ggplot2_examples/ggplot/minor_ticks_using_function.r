#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : Apr 17, 2016

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir) 

# Libraries  
library(ggplot2)

######### function ##########################
every_nth <- function(x, nth, empty = TRUE, inverse = FALSE) 
{
  if (!inverse) {
    if(empty) {
      x[1:nth == 1] <- ""
      x
    } else {
      x[1:nth != 1]
    }
  } else {
    if(empty) {
      x[1:nth != 1] <- ""
      x
    } else {
      x[1:nth == 1]
    }
  }
}

############################################
library(ggplot2)
x = seq(0,10,0.1)
df <- data.frame(x = runif(1000), y = runif(1000))

## ggplot2 default axis labelling
g <- ggplot(df, aes(x, y)) + geom_point() + theme_bw()
#print(g)

## Add minor ticks to axes
custom_breaks <- seq(-3, 3, 0.25)
g = g + 
  scale_x_continuous(breaks = custom_breaks,
                     labels = every_nth(custom_breaks, 4, inverse = TRUE)) + 
  scale_y_continuous(breaks = custom_breaks,
                     labels = every_nth(custom_breaks, 2, inverse = TRUE)) 

print(g)