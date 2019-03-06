#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 16, 2016

x <- seq(0,pi,0.1)
y <- cos(x)

## for inclusion in Computer Modern TeX documents, perhaps
postscript("~/Copy/Programming/R/rprograms/plotting/eps/eps1.eps", width = 4.0, height = 3.0,
           horizontal = FALSE, onefile = FALSE, paper = "special",
           family = "ComputerModern", encoding = "TeXtext.enc")

plot(x,
     y,
     main="Example of eps plotting",
     #sub=expression("x"[2]),                           # subscript
     xlab = expression(paste("x ")),
     ylab = expression(paste("y ")),
     col.lab="blue",                                   # color of labels
     cex.lab=0.75,                                     # size of labels relative to default
     type="l",
     col = "red")

# turn off device driver
dev.off()
