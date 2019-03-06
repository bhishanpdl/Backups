#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 5, 2016

# to run: clear; Rscript formula1.r; rm *~

# These are the variable names:
measurevar <- "y"
groupvars  <- c("x1","x2","x3")

# This creates the appropriate string:
paste(measurevar, paste(groupvars, collapse=" + "), sep=" ~ ")
#> [1] "y ~ x1 + x2 + x3"

# This returns the formula:
as.formula(paste(measurevar, paste(groupvars, collapse=" + "), sep=" ~ "))
#> y ~ x1 + x2 + x3
#> <environment: 0x7fd384178d18>

