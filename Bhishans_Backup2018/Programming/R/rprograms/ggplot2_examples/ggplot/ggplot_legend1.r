#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 14, 2016
# Ref     : http://zevross.com/blog/2014/08/04/beautiful-plotting-in-r-a-ggplot2-cheatsheet-3/
# Program :

# Set working directory
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Libraries
library(ggplot2)

# Data
nmmaps<-read.csv("chicago-nmmaps.csv", as.is=T)
nmmaps$date<-as.Date(nmmaps$date)
nmmaps<-nmmaps[nmmaps$date>as.Date("1996-12-31"),]
nmmaps$year<-substring(nmmaps$date,1,4)
print(head(nmmaps))

# Manually adding legend items (guides(), override.aes)
# here there is no legend automatically
g = ggplot(nmmaps, aes(x=date, y=o3))+geom_line(color="grey")+geom_point(color="red")
#print(g)

# We can force a legend by mapping to a “variable”. We are mapping the lines and 
# the points using aes and we are mapping not to a variable in our dataset but 
# to a single string (so that we get just one color for each).

g = ggplot(nmmaps, aes(x=date, y=o3))+geom_line(aes(color="Important line"))+
  geom_point(aes(color="My points"))
#print(g)

# We’re getting close but this is not what I want. I wanted grey and red. 
# To change the color, we use scale_colour_manual().

g = ggplot(nmmaps, aes(x=date, y=o3))+geom_line(aes(color="Important line"))+
  geom_point(aes(color="Point values"))+
  scale_colour_manual(name='', values=c('Important line'='grey', 'Point values'='red'))
#print(g)

# Tantalizingly close! But we don’t want a line with a point for both. 
# Line=grey and point=red. The final step is to override the aesthetics in the legend. 
# The guide() function allows us to control guides like the legend:

g = ggplot(nmmaps, aes(x=date, y=o3))+geom_line(aes(color="Important line"))+
  geom_point(aes(color="Point values"))+
  scale_colour_manual(name='', values=c('Important line'='grey', 'Point values'='red'), guide='legend') +
  guides(colour = guide_legend(override.aes = list(linetype=c(1,0)
                                                   , shape=c(NA, 16))))
print(g)