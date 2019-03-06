#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript zsort.r

# Make up a randomly ordered vector
v <- sample(101:110)
print(v)

# Sort the vector
sort(v)
#>  [1] 101 102 103 104 105 106 107 108 109 110

# Reverse sort
sort(v, decreasing=TRUE)
#>  [1] 110 109 108 107 106 105 104 103 102 101


cat("\n")
cat("\nWe can use the arrange function from plyr package\n")
# Make a data frame
df <- data.frame (id=1:4,
            weight=c(20,27,24,22),
            size=c("small", "large", "medium", "large"))
df

library(plyr)

# Sort by weight column. These have the same result.
cat("\nSort by weight column using arrange from plyr package\n")
arrange(df, weight)       # Use arrange from plyr package

cat("\nSort by weight column using built-in R functions\n")
df[ order(df$weight), ]   # Use built-in R functions
#>   id weight   size
#> 1  1     20  small
#> 2  4     22  large
#> 3  3     24 medium
#> 4  2     27  large


# Sort by size, then by weight
cat("\nSort by size, then by weight,using arrange from plyr package \n")
arrange(df, size, weight)         # Use arrange from plyr package
cat("\nSort by size, then by weight,using built-in R functions \n")
df[ order(df$size, df$weight), ]  # Use built-in R functions
#>   id weight   size
#> 4  4     22  large
#> 2  2     27  large
#> 3  3     24 medium
#> 1  1     20  small


# Sort by all columns in the data frame, from left to right
cat("\nSort by all columns in the data frame, from left to right")
cat("\nIn this particular example, the order will be unchanged \n")
df[ do.call(order, as.list(df)), ] 
# In this particular example, the order will be unchanged



