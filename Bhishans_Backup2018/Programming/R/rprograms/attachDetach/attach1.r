#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript attach1.r

# ref: http://www.r-bloggers.com/to-attach-or-not-attach-that-is-the-question/

# never use attach. with and within are your friends.

# example 1
printx <- function (){ print(x)  }
 
#with(list(x=42), printx())  # this fails
#with(list(x=42), print(x))  # this also fails
attach(list(x=42)); printx() # but this works fine
cat("\n\n")



# example 2
ds = read.csv("http://www.math.smith.edu/r/data/help.csv")
names(ds)
attach(ds)
mean(cesd)

cat("\nsearch example\n")
search()
detach(ds)

# fit a linear model
lm1 = lm(cesd ~ pcs, data=ds)

mean(ds$cesd[ds$female==1])  # these next three are equivalent

with(ds, mean(cesd[female==1]))
with(subset(ds, female==1), mean(cesd))


#
