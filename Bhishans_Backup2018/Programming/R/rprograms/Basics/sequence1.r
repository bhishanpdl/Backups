#!/usr/bin/Rscript
# Bhishan Poudel
# Jan 8, 2016
# clear; Rscript sequence1.r  ; rm *~

a <- c(8, 9, 10)
b <- c(9, 10)
c <- 10
seq_along(a)
# [1] 1 2 3
seq_along(b)
# [1] 1 2
seq_along(c)
# [1] 1
seq(a)
# [1] 1 2 3
seq(b)
# [1] 1 2
seq(c)
# [1]  1  2  3  4  5  6  7  8  9 10

sample(a)
# [1] 10  8  9
sample(b)
# [1]  9 10
sample(c)
# [1]  8  7  9  3  4  1  6 10  2  5

safeSample = function(x) if(length(x) == 1) x else sample(x)

#Try it out with
cat("\nsafe sample example1\n")
safeSample(4:5)
cat("\nsafe sample example2\n")
safeSample(5)

