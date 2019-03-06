#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 10, 2016
# Ref     : http://www.r-bloggers.com/getting-going-importing-data-and-plotting-a-simple-graphic/


# Libraries
library(ggplot2)

# setting working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# data
columns <- c("date", "time", "NO", "NO_status", "NO_unit",
      "NO2", "NO2_status", "NO2_unit", "ozone", "ozone_status",
      "ozone_unit", "SO2", "SO2_status", "SO2_unit")
data <- read.csv("datafile1.csv", header = FALSE,
      skip = 7, col.names = columns, stringsAsFactors = FALSE)


#We have also removed the first 7 lines of the file (if you look at the file in
#Notepad, you’ll see that the first 7 lines are descriptions and a header.
#I wanted my own headers, which I set in the columns vector.
#StringsAsFactors = FALSE is important – without this things can go wrong.
#You can look at the data we’ve just imported using:

print(data[1:10,])

#which shows the first 10 rows of the data (and all the columns).
#R has lots of ways to access data from a table.
#For example, we can look at the 5th to 10th measurments of NO using

print(data$NO[5:10])

#So, lets now do a plot.  A simple plot is to see what happens to NO levels over
#the whole dataset.  In which case, all you have to do is:

plot(data$NO)

#For a more complex graph:

## start by saving the original graphical parameters
def.par <- par(no.readonly = TRUE)
x <- data$NO
y <- data$ozone
xlabel <- "NO"
ylabel <- "ozone"
layout(matrix(c(2,1,1,3,1,1), 2, 3, byrow = TRUE))
plot(x, y, xlab = xlabel, ylab = ylabel, pch = 20)
plot(x, xlab = NA, ylab = xlabel, pch = 20)
plot(y, xlab = NA, ylab = ylabel, pch = 20)
## reset the graphics display to default
par(def.par)

