#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 5, 2016

# to run: clear; Rscript zformula2.r; rm *~

f <- y ~ x1 + x2

# Take a look at f
str(f)
#> Class 'formula' length 3 y ~ x1 + x2
#>   ..- attr(*, ".Environment")=<environment: 0x7fdb01382d18>

# Get each part
f[[1]]
#> `~`
f[[2]]
#> y
f[[3]]
#> x1 + x2

# Or view the whole thing as a list
as.list(f)


str(f[[1]])
#>  symbol ~
str(f[[2]])
#>  symbol y
str(f[[3]])
#>  language x1 + x2

# Look at parts of the langage object
str(f[[3]][[1]])
#>  symbol +
str(f[[3]][[2]])
#>  symbol x1
str(f[[3]][[3]])
#>  symbol x2

cat("\n")
as.character(f[[1]])
#> [1] "~"
as.character(f[[2]])
#> [1] "y"

# The language object gets coerced into a string that represents the parse tree:
as.character(f[[3]])
#> [1] "+"  "x1" "x2"

# You can use deparse() to get a more natural looking string
deparse(f[[3]])
#> [1] "x1 + x2"
deparse(f)
#> [1] "y ~ x1 + x2"
