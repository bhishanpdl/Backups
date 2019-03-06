#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# ref: http://www.cyclismo.org/tutorial/R/input.html
# ref: http://www.computerworld.com/article/2598083/app-development-
#beginner-s-guide-to-r-easy-ways-to-do-basic-data-analysis.html?page=2

setwd( "~/Copy/Programming/R/rprograms/file/fileread/")
print(dir())  # to see what files are there
cat("\n\n")

heisenberg <- read.csv(file="fileRead2.csv",head=TRUE,sep=",")
print(heisenberg)

cat("\n\n")
print(summary(heisenberg))

#help(read.csv)

# accessing elements
print(names(heisenberg))   # to see the names of the columns
cat("\n")
print(heisenberg$mass)

x <- heisenberg$mass

print(x**2)

# reading fixed width table
# -ve number column is skipped
cat("\n")
a <- read.fwf('fixedWidth.dat',widths=c(17,15,7),col.names=c('subject','temp','offices'))
#a <- read.fwf('fixedWidth.dat',widths=c(-17,15,7),col.names=c('temp','offices'))
print(a)

# removing data
cat("\n")
#rm(a)
print(a)

# save entire workspace
save.image()

# to see file list
cat("\n")
print(dir())

# save an individual R object
variablename <- heisenberg
save(variablename, file="filename.rda")

# Reload an individual R object
load("filename.rda")

# data analyze
cat("\ndata analyze\n")
mydata <- heisenberg
print(head(mydata))       # default is n=6 rows
print(head(mydata, n=2))  # head(mydata, 10)

cat("\ntail of the data\n")
print(tail(mydata, n=2))

cat("\n")
print(str(mydata))

cat("\ncolumn names")
print(colnames(mydata))
# print(rownames(mydata))
# print(summary(mydata))

# to see extra statistics, install psych
# install.packages("psych", dependencies=TRUE)
cat("\nusing psych library")
library(psych)

# printing correlation function cor()
print(cor(mydata$mass,mydata$velocity))

cat("\ndescribe the data\n")
print(describe(mydata$mass))

# dealing with NA
cat("\ndealing with NA\n")
print(mean(mydata$mass, na.rm=TRUE))

# how many ways can you select a committee of 4 people from a group of 15?
# combination c(15,4) 15! divided by 4! times 11! 
cat("\ncombination example\n")
print(choose(15,4))

# group forming
cat("\nexaple of comb \n")
mypeople <- c("Bob", "Joanne", "Sally", "Tim", "Neal")
combn(mypeople, 2)
# one line example
print(combn(c("Bob", "Joanne", "Sally", "Tim", "Neal"),2))


print(combn(mypeople, 2))






