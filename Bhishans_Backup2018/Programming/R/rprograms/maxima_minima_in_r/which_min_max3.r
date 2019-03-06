#!/usr/bin/env Rscript

# Author  : Bhishan Poudel
# Date    : Apr 11, 2016
# Ref     : http://stackoverflow.com/questions/15630032/which-max-ties-method-in-r
# Program : Find the Index of the Minimum or Maximum Value

# set working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

x<-c(1,2,1,4,3,4)
print(x)
#identical to which.max, except returns all indices with max
a = which(x==max(x)) 
print(a)

z<-which(x==max(x))
a =z[length(z)]
print(a)
#or with tail
a =tail(which(x==max(x)),1)
print(a)
  
a =max.col(t(x),"last")
print(a)
#or
a =max.col(matrix(x,nrow=1),"last")
print(a)

#Some benchmarking:
  
x<-sample(1:1000,size=10000,replace=TRUE)
library(microbenchmark)
m = microbenchmark(which.max(x),{z<-which(x==max(x));z[length(z)]}, 
               tail(which(x==max(x)),1),max.col(matrix(x,nrow=1),"last"),
               max.col(t(x),"last"),which.max(rev(x)),times=1000)

print(m)
# So all methods seem to be slower than the original (which gives wrong result), 
# but z <- which(x == max(x));z[length(z)] seems to be fastest option of these.

