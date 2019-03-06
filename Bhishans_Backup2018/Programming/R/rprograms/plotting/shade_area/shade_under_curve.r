#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Program: 

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

# libraries
library(ggplot2)

# # plot values
x = seq(0, 25.0, by=0.1)
A = 4.3
y =  (-1.0/x) + (0.5*A*A/(x**2)) - (A*A/(x**3))


# # Plots
df = data.frame(x=x,y=y)
g1 = ggplot ( df, aes(x=x, y=y)) + 
  ylim(-0.04, 0.06)+ 
  geom_line(linetype = "solid") +
  geom_ribbon(aes(ymin = -0.04, ymax = y), fill = "grey70")

print(g1)

