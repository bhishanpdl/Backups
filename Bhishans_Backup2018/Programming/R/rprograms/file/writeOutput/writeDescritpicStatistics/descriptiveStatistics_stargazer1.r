#!/usr/bin/Rscript 
# Bhishan Poudel 
#  


# setting working directory  
setwd("~/Copy/Programming/R/rprograms/file/writeOutput/writeDescritpicStatistics/")

mydata <- mtcars

library(stargazer)
stargazer(mydata, type = "text", title="Descriptive statistics", digits=1, out="table1.txt")

# Same output, transposed (variables in columns)
stargazer( mydata,
   type = "text", title="Descriptive statistics", digits=1, out="table1.txt", flip=TRUE)

