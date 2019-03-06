#!/usr/bin/env Rscript

# Author  : Bhishan Poudel
# Date    : Feb 11, 2016
# Program : 

# ref: http://www.r-tutor.com/r-introduction/data-frame/data-import

# Setting working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)


# reading csv file
cat("\n")
fileReadcsv <- "data.csv"
mydata = read.csv(fileReadcsv)  # read csv file 
print(mydata) 