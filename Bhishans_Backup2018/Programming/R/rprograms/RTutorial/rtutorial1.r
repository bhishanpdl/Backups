#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 21, 2016

# Frequency Distribution of Qualitative Data
# ref: http://www.r-tutor.com/elementary-statistics/
#qualitative-data/frequency-distribution-qualitative-data

# setting working directory
setwd("~/Copy/Programming/R/rprograms/RTutorial/")

# Q: Find the frequency distribution of the painter 
#    schools in the data set painters. 
library(MASS)                 # load the MASS package

print(head(painters))         # loading the data painters from the package
str(painters)
help(painters)
class(painters) # ans: data.frame
dim(painters)
nrow(painters)
ncol(painters)
names(painters)

length(painters[,"Composition"])  # length of this vector
class(painters[,"Composition"])

nlevels(painters[,"Composition"])
nlevels(painters[,"School"])  # levels A ,B ,C,D,E,F,G,H
levels(painters[,"School"])

table(painters[,"School"])

x <- painters$Composition
class(x)

# statistics
mean(x); median(x) ; range(x); summary(x)



school <- painters$School      # the painter schools
school.freq <- table(school)   # apply the table function

school.freq
cbind(school.freq)

school[2]
school[1:3]
length(school)
school[-(4:length(school))]  # except 4th to last school i.e. first third

head(painters$Composition)

order_composition <- order(painters$Composition)
