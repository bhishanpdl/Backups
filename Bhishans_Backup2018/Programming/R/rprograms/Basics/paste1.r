#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 5, 2016

# clear; Rscript zpaste.r; rm *~

a <- "apple"
b <- "banana"

# Put a and b together, with a space in between:
paste(a, b)
#> [1] "apple banana"

# With no space, use sep="", or use paste0():
paste(a, b, sep="")
#> [1] "applebanana"
paste0(a, b)
#> [1] "applebanana"

# With a comma and space:
paste(a, b, sep=", ")
#> [1] "apple, banana"


# With a vector
d <- c("fig", "grapefruit", "honeydew")

# If the input is a vector, use collapse to put the elements together:
paste(d, collapse=", ")
#> [1] "fig, grapefruit, honeydew"

# If the input is a scalar and a vector, it puts the scalar with each
# element of the vector, and returns a vector:
paste(a, d)
#> [1] "apple fig"        "apple grapefruit" "apple honeydew"

# Use sep and collapse:
paste(a, d, sep="-", collapse=", ")
#> [1] "apple-fig, apple-grapefruit, apple-honeydew"


#Pasting Strings Together
paste (c("a", "b", "c"), 1:5)  
# "a 1" "b 2" "c 3" "a 4" "b 5"
paste (1:3, c(10, 20, 30), sep=" which is ")
# "1 which is 10" "2 which is 20" "3 which is 30"
paste (paste (1:3, c(10, 20, 30), sep=" which is "), "% of 100")
#  "1 which is 10 % of 100" "2 which is 20 % of 100" "3 which is 30 % of 100"


hold.this <- .Last.value # save that
#paste (hold.this, "\n", collapse="")
# "1 which is 10 % of 100 \n2 which is 20 % of 100 \n3 which is 30 % of 100 \n"


cat (paste (hold.this, "\n", collapse=""))
# 1 which is 10 % of 100 
# 2 which is 20 % of 100 
# 3  which is 30 % of 100 
