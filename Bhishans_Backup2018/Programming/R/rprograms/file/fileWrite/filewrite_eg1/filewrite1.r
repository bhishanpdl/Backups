#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : 
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

# Create a 2*5 matrix
x <- matrix(1:10, ncol=5)

print(x)

write(x,"data.csv",sep='\t')