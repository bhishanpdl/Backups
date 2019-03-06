#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript randomizingOrder.r

# Create a vector
v <- 11:20

# Randomize the order of the vector
v <- sample(v)

# Create a data frame
data <- data.frame(label=letters[1:5], number=11:15)
data
#>   label number
#> 1     a     11
#> 2     b     12
#> 3     c     13
#> 4     d     14
#> 5     e     15

cat("\nRandomize the order of the data frame\n")
data <- data[sample(1:nrow(data)), ]
data
#>   label number
#> 5     e     15
#> 2     b     12
#> 4     d     14
#> 3     c     13
#> 1     a     11

