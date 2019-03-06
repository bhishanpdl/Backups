#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

data <- read.csv('shade.dat', header=T)

ggplot(data = df,aes(time,x))+
  geom_ribbon(aes(x=time, ymax=x.upper, ymin=x.lower), fill="pink", alpha=.5) +
  geom_line(aes(y = x.upper), colour = 'red') +
  geom_line(aes(y = x.lower), colour = 'blue')+
  geom_line()