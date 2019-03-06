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

g<-ggplot(nmmaps, aes(date, temp))+geom_point(color="firebrick")
#print(g)

g<-g+ggtitle('Temperature')
#print(g)

# Make title bold and add a little space at the baseline (face, margin)
g = g+theme(plot.title = element_text(size=20, face="bold", 
                                  margin = margin(10, 0, 10, 0)))
#print(g)

# Use a non-traditional font in your title (family)
library(extrafont)
g = g+theme(plot.title = element_text(size=30,lineheight=.8, 
                                  vjust=1,family="Bauhaus 93"))
#print(g)

# Change spacing in multi-line text (lineheight)
g<-g+ggtitle("This is a longer\ntitle than expected")
g = g+theme(plot.title = element_text(size=20, face="bold", vjust=1, lineheight=0.6))
#print(g)

# Add x and y axis labels (labs(), xlab())
g<-g+labs(x="Date", y=expression(paste("Temperature ( ", degree ~ F, " )")), title="Temperature")
#print(g)

# Get rid of axis ticks and tick text (theme(), axis.ticks.y)
g = g + theme(axis.ticks.y = element_blank(),axis.text.y = element_blank())
#print(g)

# Change size of and rotate tick text (axis.text.x)
g = g + theme(axis.text.x=element_text(angle=50, size=20, vjust=0.5))
#print(g)

# Move the labels away from the plot (and add color) (theme(), axis.title.x)
g = g + theme(
  axis.title.x = element_text(color="forestgreen", vjust=-0.35),
  axis.title.y = element_text(color="cadetblue" , vjust=0.35)   
)
#print(g)

# Limit an axis to a range (ylim(), scale_x_continuous(), coord_cartesian())
g = g + ylim(c(0,60))
#print(g)

# Alternatively: 
g+scale_x_continuous(limits=c(0,35)) 
# or 
g+coord_cartesian(xlim=c(0,35))
# The former removes all data points outside the range and second adjusts the visible area.

# If you want the axes to be the same (coord_equal())
g = ggplot(nmmaps, aes(temp, temp+rnorm(nrow(nmmaps), sd=20)))+geom_point()+
  xlim(c(0,150))+ylim(c(0,150))+
  coord_equal()

#print(g)

# Use a function to alter labels (label=function(x){})
#Sometimes it’s handy to alter your labels a little, perhaps adding units or 
# percent signs without adding them to your data. You can use a function in this case. 
# Here is an example:
g=  ggplot(nmmaps, aes(date, temp))+
  geom_point(color="grey")+
  labs(x="Month", y="Temp")+
  scale_y_continuous(label=function(x){return(paste("My value is", x, "degrees"))})

#print(g)

# Working with the legend
# We will color code the plot based on season. You can see that by default the 
# legend title is what we specified in the color argument.

g<-ggplot(nmmaps, aes(date, temp, color=factor(season)))+geom_point()
#print(g)

# Working with the legend

# We will color code the plot based on season. You can see that by default the 
# legend title is what we specified in the color argument.

g<-ggplot(nmmaps, aes(date, temp, color=factor(season)))+geom_point()
#print(g)

# Change the styling of the legend title (legend.title)

g = g+theme(legend.title = element_text(colour="chocolate", size=16, face="bold"))
#print(g)

# Change the title of the legend (name)
g = g+theme(legend.title = element_text(colour="chocolate", size=16, face="bold"))+
  scale_color_discrete(name="This color is\ncalled chocolate!?")
#print(g)

# Change the background boxes in the legend (legend.key)
#I have mixed feelings about those boxes. If you want to get rid of them entirely use fill=NA.

g = g+theme(legend.key=element_rect(fill='NA')) # fill = pink
#print(g)

# Change the size of the symbols in the legend only (guides(), guide_legend)
# Points in the legend get a little lost, especially without the boxes. 
# To override the default try:
  
g = g+guides(colour = guide_legend(override.aes = list(size=4)))
#print(g)

# 