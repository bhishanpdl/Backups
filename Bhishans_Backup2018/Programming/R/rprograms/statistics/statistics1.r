#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 22, 2016

# ref: http://www.r-tutor.com/elementary-statistics/qualitative-
#data/relative-frequency-distribution-qualitative-data



# Relative Frequency Distribution of Qualitative Data

# relative freq = freq / sample size

# problem: Find the relative frequency distribution of the
#  painter schools in the data set painters.

library(MASS)                 # load the MASS package
head(painters,3)
school <- painters$School      # the painter schools 
school.freq <- table(school)   # apply the table function 
school.freq
school.relfreq <- school.freq/nrow(painters)

school.relfreq
old <- options(digits=1)
school.relfreq
options(old)   # restore the old option

old <- options(digits =2)
cbind(school.relfreq)
