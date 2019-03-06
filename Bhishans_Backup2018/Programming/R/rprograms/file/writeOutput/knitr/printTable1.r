#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 27, 2016

# setwd
setwd("~/Copy/Programming/R/rprograms/file/writeOutput/knitr/")

# library
require(knitr)

for(i in 1:2){
  #some calculation 
  x<-runif(runif(1,1,5))
  y<-length(x)
  
  #dataframe output
  df <- cbind(x,y)
  
  #pretty table
  print(kable(df))
}