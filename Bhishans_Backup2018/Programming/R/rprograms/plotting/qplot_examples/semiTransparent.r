# Bhishan Poudel
# Jan 13, 2016

#!/usr/bin/Rscript

# clear; Rscript semiTransparent.r ; open plots/semiTransparent.pdf

# load the library
library(ggplot2)


tmp = file.path(".", "plots/semiTransparent.pdf")

pdf(tmp) # open a pdf device in the temp dir
plot(rnorm(100), ylim = c(-3, 3), xlab = "x", ylab = "y",
   main = "Add a semi-transparent color image to a graph")
image(x = seq(1, 100, length = 20), y = seq(-3, 3,
   length = 20), z = matrix(rnorm(400), 20), col = heat.colors(20,
   alpha = 0.5), add = T) # here we set alpha = 0.5
dev.off()

#You may try other devices such as postscript, jpg, or bmp, etc, 
#and you will find alpha is not supported there.

