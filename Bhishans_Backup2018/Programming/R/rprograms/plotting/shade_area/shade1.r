#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   :
# Program:

# Set the working directory
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

# libraries
library(ggplot2)

# data
time = c( 1,2,3,2)
x = c(1.00, 1.03, 1.03, 1.06)
x.lower = c(0.91,0.92,0.95,0.90)
x.upper = c(1.11,1.13,1.17,1.13)

df <- data.frame("time"=time,"x"=x,"x.lower"=x.lower, "x.upper" = x.upper)


p1 = ggplot(data = df,aes(time,x))+
  geom_ribbon(aes(x=time, ymax=x.upper, ymin=x.lower), fill="darkgray", alpha=.5) +
  geom_line(aes(y = x.upper), colour = 'red') +
  geom_line(aes(y = x.lower), colour = 'blue')+
  geom_line()

print(p1)

################################################################################


#time x     x.upper   x.lower
#   1 1.00     0.91      1.11
#   2 1.03     0.92      1.13
#   3 1.03     0.95      1.17
#   2 1.06     0.90      1.13
