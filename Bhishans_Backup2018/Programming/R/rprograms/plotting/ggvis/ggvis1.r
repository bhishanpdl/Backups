#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 26, 2016
# ref: http://ggvis.rstudio.com/cookbook.html

# setwd
setwd("~/Copy/Programming/R/rprograms/plotting/ggvis/")

library(ggplot2)
library(ggvis)

# The first few rows of mtcars
head(mtcars)

plt1 <- mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
print(plt1)

# Smaller points, a different shape, a different outline (stroke) color, and empty fill:
plt2 <- mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points(size := 25, shape := "diamond", stroke := "red", fill := NA)

print(plt2)

# Adding a smooth line
plt3 <- mtcars %>% 
  ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  layer_smooths()
print(plt3)

# line graphs
plt4 <- pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_lines()
print(plt4)

# Lines with points:
plt5 <- pressure %>% ggvis(~temperature, ~pressure) %>%
  layer_points() %>% 
  layer_lines()
print(plt5)