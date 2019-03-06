#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 17, 2016

ThreeCols <- "~/Copy/Programming/R/rprograms/file/3cols.dat"
df1 <- read.csv(file=ThreeCols, sep=" ", colClasses=c("NULL", NA, NA))

print(head(df1))


# method 3
# Another option is to read in the whole file, but keep only two of the columns, e.g.:
read.csv(file = ThreeCols, sep = " ")[ ,1:2]

# or, using column names, eg. if columns are named 'col1, col2, col3'
#read.csv(file = ThreeCols, sep = " ")[ ,c('col1', 'col2')]

