#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 14, 2016
# Ref     : http://blog.echen.me/2012/01/17/quick-introduction-to-ggplot2/
# Program :

# Set working directory
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Libraries
library(ggplot2)

# `Orange` is another built-in data frame that describes the growth of orange trees.
q <-  qplot(age, circumference, data = Orange, geom = "line",
    colour = Tree,
    main = "How does orange tree circumference vary with age?")

#print(q1)

# We can also plot both points and lines.
q = qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)
#print(q)

# Bar plot
movies = data.frame(
  director = c("spielberg", "spielberg", "spielberg", "jackson", "jackson"),
  movie = c("jaws", "avatar", "schindler's list", "lotr", "king kong"),
  minutes = c(124, 163, 195, 600, 187)
)

# Plot the number of movies each director has.
q = qplot(director, data = movies, geom = "bar", ylab = "# movies")
# By default, the height of each bar is simply a count.
print(q)
