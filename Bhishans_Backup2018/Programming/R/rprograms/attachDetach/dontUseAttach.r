#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript dontUseAttach.r

# ref: https://stackoverflow.com/questions/1310247/in-r-do-you-use-attach-or-call-variables-by-name-or-slicing

# never use attach. with and within are your friends.

N <- 3

df <- data.frame(x1=rnorm(N),x2=runif(N))

df$y <- with(df,{
   x1+x2
})

df

cat("\n\n")
df <- within(df,{
   x1.sq <- x1^2
   x2.sq <- x2^2
   y <- x1.sq+x2.sq
   x1 <- x2 <- NULL
})
 
df

cat("\n\n")
transform(df, xtot=x1.sq+x2.sq, y=NULL)
