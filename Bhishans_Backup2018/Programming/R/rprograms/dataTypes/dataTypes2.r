#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016

# clear; Rscript dataTypes2.r; rm *~


# Numeric, factors, and logicals
a.num <- c(1,0,0,1,1)
a.cha <- c("right", "wrong", "wrong", "right", "right")
a.log <- c(TRUE, FALSE,FALSE, TRUE, TRUE)
print(a.num)
# [1] 1 0 0 1 1
mode(a.num)
# "numeric"
length(a.num)
# 5
print(a.cha)


# creating data using sequence and repetition
c <- 1:3
print(c)
# [1] 1 2 3
d <- seq(1, 3, by=1)
print(d)
# [1] 1 2 3
e <- rep(c,times=3)
print(e)
# [1] 1 2 3 1 2 3 1 2 3
c(1:5,seq(11,13,1))
# [1] 1 2 3 4 5 11 12 13


# logical vector
a.num <- 0:4
a.cha <- c("a","b","c","d","e")
a.log <- a.num>2
print(a.log)
# [1] FALSE FALSE FALSE  TRUE  TRUE
a.cha[a.log]
# [1] "d" "e"

# Referring element
b <- c(1, 2, 5, 3, 6, -2, 4)
#      1  2  3  4  5   6  7   
b[2]
# [1] 2
b[2:3]
# [1] 2 5
b[c(2,3,5)]
# [1] 2 5 6

# Missing value(NA, NaN)
# cat("\n \n")

cat("\nIf the value of a variable is unknown, the value is NA. \n")
 
cat("Numeric calculations whose result is undefined  produce the value NaN.\n")
print(0/0)
# [1] NaN
a.miss <- c(25,NA,NaN,11)
is.na(a.miss)
# [1] FALSE  TRUE  TRUE FALSE
is.nan(a.miss)
# [1] FALSE FALSE  TRUE FALSE

# Arithmetic operator
# + - * /    ** or ^      %% modulus         %/%  integer division

a<-1:3
a*2
# [1] 2 4 6
print(1:3*2)
# 2 4 6
print(1:(3*2))
# 1 2 3 4 5 6
cat("\nmean,median,sd,var,sum,max,min")
cat("\nsd(c(1,2,3,4)) returns 1.29")
cat("\nvar(c(1,2,3,4)) returns 1.67")

cat("\nobject is anything that can be assigned to a variable, which could be constants, data structures,  functions or graphs) \n")
cat("e.g. ls() \n")

cat("\nFactor is a special type of vector with levels attribute \n")
a.fac <- factor(c("right", "wrong", "wrong", "right", "right"),levels=c("right","wrong"))
print(a.fac)
# [1] right wrong wrong right right
# Levels: right wrong

table(a.fac)
#a.fac
#right wrong 
#    3     2 


cat("\n \n")

