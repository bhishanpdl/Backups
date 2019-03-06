#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 14, 2016
# Ref     : http://blog.echen.me/2012/01/17/quick-introduction-to-ggplot2/
# Program :

# Set working directory
this_dir <- function(directory)
setwd(file.path(getwd(), directory))

# Libraries
library(ggplot2)
library(plyr)

# Data
head(iris) # by default, head displays the first 6 rows. see `?head`
print(head(iris, n = 10)) # we can also explicitly set the number of rows to display


q = qplot(Sepal.Length, Petal.Length, data = iris)  # geom = point is default
# Plot Sepal.Length vs. Petal.Length, using data from the `iris` data frame.
# * First argument `Sepal.Length` goes on the x-axis.
# * Second argument `Petal.Length` goes on the y-axis.
# * `data = iris` means to look for this data in the `iris` data frame.    
#print(q)

q = qplot(Sepal.Length, Petal.Length, data = iris, color = Species) # dude!
#print(q)

q = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))
# By setting the alpha of each point to 0.7, we reduce the effects of overplotting.
print(q)


# Finally, let’s fix the axis labels and add a title to the plot.
q = qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
          xlab = "Sepal Length", ylab = "Petal Length",
          main = "Sepal vs. Petal Length in Fisher's Iris data")
print(q)
q = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
# We see that Iris setosa flowers have the narrowest petals.
#print(q)

