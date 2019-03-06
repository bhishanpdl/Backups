#!/usr/bin/Rscript 
# Bhishan Poudel 
#  Jan 22, 2016

# Question: Find out the mean composition score of school C 
#           in the data set painters. 

# setting working directory  
set_default_wd()  

library(MASS)                 # load the MASS package 
school = painters$School      # the painter schools 
c_school = school == "C"      # the logical index vector 

c_painters = painters[c_school, ]  # child data set 
mean(c_painters$Composition) 

# using tapply to find mean of all schools  /=
tapply(painters$Composition, painters$School, mean) 
