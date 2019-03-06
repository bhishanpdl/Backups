#!/usr/bin/Rscript 
# Bhishan Poudel 
#  


# setting working directory  
setwd("~/Copy/Programming/R/rprograms/file/writeOutput/writeDescritpicStatistics/")

mydata <- mtcars

library(xtable)

newmydata <- xtable(mydata)
print.xtable(newmydata,type="latex", file="xtable1.tex")