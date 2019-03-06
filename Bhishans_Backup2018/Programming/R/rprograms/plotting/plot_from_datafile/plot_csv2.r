#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

library(ggplot2)
library(reshape)

#read data
data = read.table("plot_csv.csv", header=T,sep=",")

#melt data “scale vs. all”
data2=melt(data,id=c("scale"))
print(data2)

#draw all variables at once as line with different linetypes
p1 = qplot(scale,value,data=data2,geom="line",linetype=variable,col='red')
print(p1)

