#!/usr/bin/env Rscript
 
 
#Bhishan Poudel
# Jan 16, 2016

# clear; Rscript a.r
x <- 5
print(x)


# writing output to a file
output <- file("output_file.txt", "w")
write(x, file = output)
close(output)

# command line args
require(devtools)
devtools::install_github("getopt", "trevorld")


