#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript datakb.r; rm *~

# Using read.table()
data <- read.table(header=TRUE, text='
    size weight cost
   small      5    6
  medium      8   10
   large     11    9
 ')

#Data Output
print(data, row.names=FALSE)

#Writing data for copying and pasting, or to the clipboard
cat("\n")
write.csv(data, stdout(), row.names=FALSE)


