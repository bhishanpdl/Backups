#! /usr/bin/env Rscript

# Bhishan Poudel
# Jan 20, 2016

library(ggplot2)
library(reshape2)

# original data in a 'wide' format
x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x, 1, 1)
df <- data.frame(x, y1, y2)

# melt the data to a long format
df2 <- melt(data = df, id.vars = "x")

# plot, using the aesthetics argument 'colour'
ggplot(data = df2, aes(x = x, y = value, colour = variable)) + geom_line()

