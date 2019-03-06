#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 7, 2016

# examples of abline
# abline(a = NULL, b = NULL, h = NULL, v = NULL, 
#        reg = NULL, coef = NULL, untf = FALSE,lwd=1,lty=1,col='black', ...)

# a,b are intercept and slope
# h,v are horizontal and  vertical values


# first example : Add one line
plot(cars)
abline(v=15, col="blue")

# second example : add 2 lines 
# change line colors, sizes and types
plot(cars)
abline(v=c(15,20), col=c("blue", "red"), lty=c(1,2), lwd=c(1, 3))

# third example
set.seed(1234); mydata<-rnorm(200)
hist(mydata, col="lightblue")
abline(v = mean(mydata), col="red", lwd=3, lty=2)

# Add regression line
par(mgp=c(2,1,0), mar=c(3,3,1,1))
# Fit regression line
require(stats)
reg<-lm(dist ~ speed, data = cars)
coeff=coefficients(reg)
# equation of the line : 
eq = paste0("y = ", round(coeff[2],1), "*x ", round(coeff[1],1))
# plot
plot(cars, main=eq)
abline(reg, col="blue")
