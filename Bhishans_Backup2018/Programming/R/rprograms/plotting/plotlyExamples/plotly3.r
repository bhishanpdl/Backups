#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 18, 2016

library(plotly)
p <- plot_ly(midwest, x = percollege, color = state, type = "box")
# plotly_POST publishes the figure to your plotly account on the web
plotly_POST(p, filename = "r-docs/midwest-boxplots", world_readable=TRUE)

