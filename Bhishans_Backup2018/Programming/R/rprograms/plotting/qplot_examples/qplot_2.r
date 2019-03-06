# Bhishan Poudel
# Jan 13, 2016

#!/usr/bin/Rscript

# clear; Rscript ggplot2b.r && open plots/ggplot2b.eps

# install.packages("Lock5Data")
# install.packages("ggplot2")

# ref: http://www.ceb-institute.org/bbs/wp-content/uploads/2011/09/handout_ggplot2.pdf

# qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, 
#       formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)


# load the library
library(ggplot2)

### show info about the data
head(iris) # by default, head displays the first 6 rows. see `?head`
head(iris, n = 10) # we can also explicitly set the number of rows to display

# Start device driver to save output to figure.pdf
#postscript(file="./plots/ggplot2b.eps", height=3.5, width=5)

qplot(Sepal.Length, Petal.Length, data = iris)
  # Plot Sepal.Length vs. Petal.Length, using data from the `iris` data frame.
  # * First argument `Sepal.Length` goes on the x-axis.
  # * Second argument `Petal.Length` goes on the y-axis.
  # * `data = iris` means to look for this data in the `iris` data frame. 
 
# we can color each point by adding a color = Species argument. 
qplot(Sepal.Length, Petal.Length, data = iris, color = Species) 

# we can let the size of each point denote sepal width, 
# by adding a size = Sepal.Width argument.

qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
  # We see that Iris setosa flowers have the narrowest petals.
  
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))
  # By setting the alpha of each point to 0.7, we reduce the effects of overplotting.
  
# let’s fix the axis labels and add a title to the plot.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
    xlab = "Sepal Length", ylab = "Petal Length",
    main = "Sepal vs. Petal Length in Fisher's Iris data")




# Turn off device driver (to flush output)
#dev.off()
