#!/usr/bin/Rscript

# Author : Bhishan Poudel
# Date   : Apr 10, 2016
# Ref    : http://stackoverflow.com/questions/27189453/shade-fill-or-color-area-under-density-curve-by-quantile?rq=1


# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# libraries
library(ggplot2)

delta     <- 0.001 
quantiles <- 10
z.df     <- data.frame(x = seq(from=-3, to=3, by=delta))
z.df$pdf <- dnorm(z.df$x)
z.df$qt  <- cut(pnorm(z.df$x),breaks=quantiles,labels=F)

library(ggplot2)
p1 <- ggplot(z.df,aes(x=x,y=pdf))+
  geom_area(aes(x=x,y=pdf,group=qt,fill=qt),color="black")+
  scale_fill_gradient2(midpoint=median(unique(z.df$qt)), guide="none") +
  theme_bw()

#print(p1)

################################################################################
# method 2
require(ggplot2)
delta <- 0.0001 
z.df <- data.frame(x = seq(from=-3, to=3, by=delta))
z.df$pdf <- dnorm(z.df$x)
z.df$decile <- floor(10*pnorm(z.df$x) + 1)
g <- ggplot(z.df, aes(x=x, y=pdf, fill=decile)) +
  scale_fill_gradient2(midpoint=5.5, guide="none") +
  theme_bw()

for(n in 1:10) {
  g <- g + geom_ribbon(data=z.df[z.df$decile == n,], aes(ymin=0, ymax=pdf), colour = "black")
}
print(g)