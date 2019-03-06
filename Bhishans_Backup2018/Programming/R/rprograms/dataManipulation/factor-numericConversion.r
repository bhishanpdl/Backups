#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript factor-numericConversion.r

n <- 10:14
n
#> [1] 10 11 12 13 14

cat("\nNumeric to Character\n")
c <- as.character(n)
c

cat("\nNumeric to Factor\n")
f <- factor(n)
# 10 11 12 13 14
f

cat("\nCharacter to Numeric\n")
as.numeric(c)
#> [1] 10 11 12 13 14

cat("\nCharacter to Factor\n")
factor(c)
#> [1] 10 11 12 13 14
#> Levels: 10 11 12 13 14

cat("\nFactor to Character\n")
as.character(f)
#> [1] "10" "11" "12" "13" "14"

as.numeric(f)
#> [1] 1 2 3 4 5

cat("\nAnother way to get the numeric coding, if that's what you want:\n")
unclass(f)
#> [1] 1 2 3 4 5
#> attr(,"levels")
#> [1] "10" "11" "12" "13" "14"

cat("\nFactor to Numeric\n")
as.numeric(as.character(f))
#> [1] 10 11 12 13 14



