#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# ref: http://www.r-tutor.com/r-introduction/data-frame/data-import
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)


# reading table file
fileReadTable <- "a.dat"
#mydata = read.table(fileReadTable,header=FALSE,stringsAsFactor=FALSE) 
mydata = read.table(fileReadTable)
print(mydata)

# writing a file
write.table(mydata,"filewrite.dat") 
