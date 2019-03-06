#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 18, 2016


library(plotly)
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]

plot1 <- plot_ly(d, x = carat, y = price, text = paste("Clarity: ", clarity),
        mode = "markers", color = carat, size = carat)

print(plot1)
