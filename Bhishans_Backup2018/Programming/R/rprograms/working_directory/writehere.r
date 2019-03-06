# Author  : Bhishan Poudel
# Program : writehere.r
# Source  : Rscript example.r

# set working directory here
this_dir <- function(directory)
setwd(file.path(getwd(), directory))

# Sample data to test this code
mydata <- seq(1:10)
write.csv(mydata,"writehere.dat")

