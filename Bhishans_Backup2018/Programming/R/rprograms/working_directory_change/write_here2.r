# Author  : Bhishan Poudel
# Program : example.r

# set working directory here
this.dir <- dirname(parent.frame(3)$ofile)
setwd(this.dir)

# Sample data to test this code
mydata <- seq(1:10)
write.csv(mydata,"writehere2.dat")
