#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript mappingVectorValues.r

# cat("\n \n")

cat("\nWe want to change all instances of value x to value y in a vector. \n")

# Create some example data
str <- c("alpha", "beta", "gamma")
num <- c(1, 2, 3)

cat("\nThe easiest way is to use revalue() or mapvalues() from the plyr package: \n")
library(plyr)
revalue(str, c("beta"="two", "gamma"="three"))
#> [1] "alpha" "two"   "three"

mapvalues(str, from = c("beta", "gamma"), to = c("two", "three"))
#> [1] "alpha" "two"   "three"


# For numeric vectors, revalue() won't work, since it uses a named vector, and
# the names are always strings, not numbers. mapvalues() will work, though:
mapvalues(num, from = c(2, 3), to = c(5, 6))
#> [1] 1 5 6


cat("\nWe can do the following with R’s built-in functions. \n")
# Rename by name: change "beta" to "two"
str[str=="beta"] <- "two"
str
#> [1] "alpha" "two"   "gamma"

num[num==2] <- 5
num
#> [1] 1 5 3

cat("\nIt’s also possible to use R’s string search-and-replace \nfunctions to remap values in")
cat("character vectors.\n")
cat("Note that the ^ and $ surrounding alpha are there \nto ensure that the entire string ")
cat("matches.\n")
cat("Without them, if there were a value named alphabet, \nit would also match, and the" )
cat("replacement would be onebet.\n")
str <- c("alpha", "beta", "gamma")

sub("^alpha$", "one", str)
#> [1] "one"   "beta"  "gamma"

# Across all columns, replace all instances of "a" with "X"
gsub("a", "X", str)
#> [1] "XlphX" "betX"  "gXmmX"


# gsub() replaces all instances of the pattern in each element
# sub() replaces only the first instance in each element

