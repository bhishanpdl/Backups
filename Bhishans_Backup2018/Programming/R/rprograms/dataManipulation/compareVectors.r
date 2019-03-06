#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript compareVectors.r

#Suppose we have this data frame with two columns which consist of boolean vectors:
df <- data.frame( a=c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,NA,NA,NA),
                  b=c(TRUE,FALSE,NA,TRUE,FALSE,NA,TRUE,FALSE,NA))
df
#>       a     b
#> 1  TRUE  TRUE
#> 2  TRUE FALSE
#> 3  TRUE    NA
#> 4 FALSE  TRUE
#> 5 FALSE FALSE
#> 6 FALSE    NA
#> 7    NA  TRUE
#> 8    NA FALSE
#> 9    NA    NA

df$a == df$b
#> [1]  TRUE FALSE    NA FALSE  TRUE    NA    NA    NA    NA

cat("\nThe same comparison, but presented as another column in the data frame:\n")
data.frame(df, isSame = (df$a==df$b))
#>       a     b isSame
#> 1  TRUE  TRUE   TRUE
#> 2  TRUE FALSE  FALSE
#> 3  TRUE    NA     NA
#> 4 FALSE  TRUE  FALSE
#> 5 FALSE FALSE   TRUE
#> 6 FALSE    NA     NA
#> 7    NA  TRUE     NA
#> 8    NA FALSE     NA
#> 9    NA    NA     NA

cat("\nThis function returns TRUE wherever elements are the same, including NA's")
cat("and FALSE everywhere else.\n")
compareNA <- function(v1,v2) {
    same <- (v1 == v2) | (is.na(v1) & is.na(v2))
    same[is.na(same)] <- FALSE
    return(same)
}


compareNA(df$a, df$b)
#> [1]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE

cat("\nSame comparison, presented as another column\n")
data.frame(df, isSame = compareNA(df$a,df$b))
#>       a     b isSame
#> 1  TRUE  TRUE   TRUE
#> 2  TRUE FALSE  FALSE
#> 3  TRUE    NA  FALSE
#> 4 FALSE  TRUE  FALSE
#> 5 FALSE FALSE   TRUE
#> 6 FALSE    NA  FALSE
#> 7    NA  TRUE  FALSE
#> 8    NA FALSE  FALSE
#> 9    NA    NA   TRUE

cat("\nCreate sample data frame with factors.\n")
df1 <- data.frame(a = factor(c('x','x','x','y','y','y', NA, NA, NA)),
                  b = factor(c('x','y', NA,'x','y', NA,'x','y', NA)))

cat("\nDo the comparison\n")
data.frame(df1, isSame = compareNA(df1$a, df1$b))
#>      a    b isSame
#> 1    x    x   TRUE
#> 2    x    y  FALSE
#> 3    x <NA>  FALSE
#> 4    y    x  FALSE
#> 5    y    y   TRUE
#> 6    y <NA>  FALSE
#> 7 <NA>    x  FALSE
#> 8 <NA>    y  FALSE
#> 9 <NA> <NA>   TRUE


cat("\nIt still works if the factor levels are arranged in a different order\n")
df1$b <- factor(df1$b, levels=c('y','x'))
data.frame(df1, isSame = compareNA(df1$a, df1$b))
#>      a    b isSame
#> 1    x    x   TRUE
#> 2    x    y  FALSE
#> 3    x <NA>  FALSE
#> 4    y    x  FALSE
#> 5    y    y   TRUE
#> 6    y <NA>  FALSE
#> 7 <NA>    x  FALSE
#> 8 <NA>    y  FALSE
#> 9 <NA> <NA>   TRUE
