#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# ref: http://www.r-tutor.com/r-introduction/data-frame/data-import
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# # reading table file
# fileReadTable <- "b.dat"
# #mydata = read.table(fileReadTable,header=FALSE,stringsAsFactor=FALSE) 
# mydata = read.table(fileReadTable)
# print(mydata)

mydata <- seq(1:10)
# write this data
write.csv(mydata,"filewrite.dat")
