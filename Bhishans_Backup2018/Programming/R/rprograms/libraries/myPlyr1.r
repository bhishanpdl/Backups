#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 16, 2016

# clear; Rscript myPlyr1.r

# if we want to use the library(plyr) all the time, we can add it in ~/.Rprofile

# Make a data frame
df <- data.frame (id=1:4,
                  weight=c(20,27,24,22),
                  size=c("small", "large", "medium", "large"))

df  # printing data frame

# using library plyr  
# require(plyr)   for the R-console
# install.packages('plyr',denpendencies=TRUE)   to install

library(plyr)
cat("\nReverse sort by weight column. These all have the same effect:\n")
arrange(df, -weight)                      # Use arrange from plyr package
