#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Ref    : http://www.sthda.com/english/wiki/ggplot2-line-types-how-to-change-line-types-of-a-graph-in-r-software

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

df <- data.frame(time=c("breakfeast", "Lunch", "Dinner"),
                 bill=c(10, 30, 15))
print(head(df))

library(ggplot2)
# Basic line plot with points
g1 = ggplot(data=df, aes(x=time, y=bill, group=1)) +
  geom_line()+
  geom_point()

print(g1)
# Change the line type
g2 = ggplot(data=df, aes(x=time, y=bill, group=1)) +
  geom_line(linetype = "dashed")+
  geom_point()
print(g2)

################################################################################
# Line plot with multiple groups
# Create some data

df2 <- data.frame(sex = rep(c("Female", "Male"), each=3),
                  time=c("breakfeast", "Lunch", "Dinner"),
                  bill=c(10, 30, 15, 13, 40, 17) )
print(head(df2))

# Change globally the appearance of lines
# 
# In the graphs below, line types, colors and sizes are the same for the two groups :
  
library(ggplot2)
# Line plot with multiple groups
gg1 = ggplot(data=df2, aes(x=time, y=bill, group=sex)) +
  geom_line()+
  geom_point()
print(gg1)

# Change line types
gg2 = ggplot(data=df2, aes(x=time, y=bill, group=sex)) +
  geom_line(linetype="dashed")+
  geom_point()
print(gg2)

# Change line colors and sizes
gg3 = ggplot(data=df2, aes(x=time, y=bill, group=sex)) +
  geom_line(linetype="dotted", color="red", size=2)+
  geom_point(color="blue", size=3)
print(gg3)

################################################################################
# Change automatically the line types by groups
# 
# In the graphs below, line types, colors and sizes are changed automatically 
# by the levels of the variable sex :
  
  # Change line types by groups (sex)
ggg1=  ggplot(df2, aes(x=time, y=bill, group=sex)) +
  geom_line(aes(linetype=sex))+
  geom_point()+
  theme(legend.position="top")
print(ggg1)

# Change line types + colors
ggg2 = ggplot(df2, aes(x=time, y=bill, group=sex)) +
  geom_line(aes(linetype=sex, color=sex))+
  geom_point(aes(color=sex))+
  theme(legend.position="top")
print(ggg2)
