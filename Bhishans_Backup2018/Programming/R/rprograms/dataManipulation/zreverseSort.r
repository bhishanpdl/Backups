#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript zreversesort.r

# Make a data frame
df <- data.frame (id=1:4,
            weight=c(20,27,24,22),
            size=c("small", "large", "medium", "large"))
df

library(plyr)

cat("\nReverse sort by weight column. These all have the same effect:\n")
arrange(df, -weight)                      # Use arrange from plyr package
df[ order(df$weight, decreasing=TRUE), ]  # Use built-in R functions
df[ order(-df$weight), ]                  # Use built-in R functions
#>   id weight   size
#> 2  2     27  large
#> 3  3     24 medium
#> 4  4     22  large
#> 1  1     20  small


cat("\nSort by size (increasing), then by weight (decreasing)\n")
arrange(df, size, -weight)         # Use arrange from plyr package
df[ order(df$size, -df$weight), ]  # Use built-in R functions
#>   id weight   size
#> 2  2     27  large
#> 4  4     22  large
#> 3  3     24 medium
#> 1  1     20  small


cat("\nSort by size (decreasing), then by weight (increasing)\n")
cat("The call to xtfrm() is needed for factors\n")
arrange(df, -xtfrm(size), weight)         # Use arrange from plyr package
df[ order(-xtfrm(df$size), df$weight), ]  # Use built-in R functions
#>   id weight   size
#> 1  1     20  small
#> 3  3     24 medium
#> 4  4     22  large
#> 2  2     27  large

