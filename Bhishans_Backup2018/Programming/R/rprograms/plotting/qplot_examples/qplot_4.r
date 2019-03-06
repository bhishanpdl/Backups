# Bhishan Poudel
# Jan 13, 2016

#!/usr/bin/Rscript

# clear; Rscript orange.r && open plots/orange.eps

# load the library
library(ggplot2)

### show info about the data
head(Orange) # by default, head displays the first 6 rows. see `?head`
head(Orange, n = 10) # we can also explicitly set the number of rows to display

# Start device driver to save output to figure.pdf
postscript(file="./plots/orange.eps", height=3.5, width=5)

# `Orange` is another built-in data frame that describes the growth of orange trees.
qplot(age, circumference, data = Orange, 
    geom = "line",
    colour = Tree,
    main = "How does orange tree circumference vary with age?")
    
# We can also plot both points and lines.
qplot(age, circumference, data = Orange, 
    geom = c("point", "line"), 
    colour = Tree,
    main = "How does orange tree circumference vary with age?")
  



# Turn off device driver (to flush output)
dev.off()








  
