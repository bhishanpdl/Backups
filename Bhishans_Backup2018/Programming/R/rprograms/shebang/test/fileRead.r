#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# ref: http://www.r-tutor.com/r-introduction/data-frame/data-import



# reading table file
fileReadTable <- "a.dat"
mydata = read.table(fileReadTable,header=FALSE,stringsAsFactor=FALSE) 
mydata = read.table(fileReadTable)
print(mydata)

# write the file
write.table(mydata,"fileRead.dat") 
