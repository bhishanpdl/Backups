# Author  : Bhishan Poudel
# Program : writehere.r
# Source  : Rscript example.r

# set working directory here
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Sample data to test this code
mydata <- seq(1:10)
write.csv(mydata,"writehere.dat")
