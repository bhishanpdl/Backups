#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : Apr 17, 2016

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir) 

# Libraries  
library(ggplot2)


df <- data.frame(x = c(1900,1950,2000), y = c(50,75,60))

g <- ggplot(df, aes(x=x, y=y))
g = g + geom_line() + 
  scale_x_continuous(minor_breaks = seq(1900,2000,by=10), breaks = seq(1900,2000,by=50), limits = c(1900,2000), expand = c(0,0)) +
  scale_y_continuous(breaks = c(20,40,60,80), limits = c(0,100)) +
  theme(legend.position="none", panel.background = element_blank(), 
        axis.line = element_line(color='black'), panel.grid.minor = element_blank())

print(g)

### adding minor ticks
#### function to create minor ticks 
insert_minor <- function(major_labs, n_minor) {labs <- 
  c( sapply( major_labs, function(x) c(x, rep("", 4) ) ) )
labs[1:(length(labs)-n_minor)]}

###################################

g2 <- ggplot(df, aes(x=x, y=y))
g2 = g2 + geom_line() + 
  scale_x_continuous(breaks= seq(1900,2000,by=10), 
                     labels = insert_minor( seq(1900, 2000, by=50), 4 ), 
                     limits = c(1900,2000), expand = c(0,0)) +
  scale_y_continuous(breaks = c(20,40,60,80), limits = c(0,100)) +
  theme(legend.position="none", panel.background = element_blank(), 
        axis.line = element_line(color='black'), panel.grid.minor = element_blank())

print(g2)