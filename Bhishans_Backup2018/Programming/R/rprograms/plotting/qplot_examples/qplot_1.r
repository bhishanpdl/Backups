# Bhishan Poudel
# Jan 13, 2016

#!/usr/bin/Rscript

# clear; Rscript ggplot2a.r && open plots/ggplot2a.eps

# install.packages("Lock5Data")
# install.packages("ggplot2")

# ref: http://www.ceb-institute.org/bbs/wp-content/uploads/2011/09/handout_ggplot2.pdf

# qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, 
#       formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)


# load the library
library(ggplot2)

### show info about the data
head(diamonds) 
head(mtcars)
tail(mtcars)

# Start device driver to save output to figure.pdf
#postscript(file="./plots/ggplot2a.eps", height=3.5, width=5)

### comparison qplot vs ggplot
# qplot histogram
qplot(clarity, data=diamonds, fill=cut, geom="bar") 

# ggplot histogram -> same output
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()

### how to use qplot
# scatterplot
qplot(wt, mpg, data=mtcars)

# transform input data with functions
qplot(log(wt), mpg - 10, data=mtcars)

# add aesthetic mapping (hint: how does mapping work)
qplot(wt, mpg, data=mtcars, color=qsec)

# change size of points (hint: color/colour, hint: set aesthetic/mapping)
qplot(wt, mpg, data=mtcars, color=qsec, size=3) 
qplot(wt, mpg, data=mtcars, colour=qsec, size=I(3))

# use alpha blending
qplot(wt, mpg, data=mtcars, alpha=qsec)

# continuous scale vs. discrete scale
head(mtcars)
qplot(wt, mpg, data=mtcars, colour=cyl) 
levels(mtcars$cyl)
qplot(wt, mpg, data=mtcars, colour=factor(cyl))

# use different aesthetic mappings
qplot(wt, mpg, data=mtcars, shape=factor(cyl)) 
qplot(wt, mpg, data=mtcars, size=qsec)

# combine mappings (hint: hollow points, geom-concept, legend combination)
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb))
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb), shape=I(1)) 
qplot(wt, mpg, data=mtcars, size=qsec, shape=factor(cyl), geom="point") 
qplot(wt, mpg, data=mtcars, size=factor(cyl), geom="point")


# Turn off device driver (to flush output)
#dev.off()
