#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016
# ref: http://www.r-bloggers.com/how-to-write-and-debug-an-r-function/


# SYNTAX
# name.of.function <- function(argument1, argument2) {
#   statements
#   return(something)
# }

# Example of a function
square.it <- function(x) {
  square <- x * x
  return(square)
}

print(square.it(5))


# Example of a Function
pow <- function(x, y) {
   # function to print x raised to the power y

   result <- x^y
   print(paste(x,"raised to the power",y,"is",result))
}


# Function Calls
pow(8,2)
pow(2,8)

# Named Arguments
pow(x=8, y=2)
pow(y=2, x=8)
pow(x=8, 2)

# Default Values for Arguments
pow <- function(x, y=2) {
   # function to print x raised to the power y
   result <- x^y
   print(paste(x,"raised to the power",y,"is",result))
}

# function call
pow(3)
# [1] "3 raised to the power 2 is 9"
pow(3,1)
# [1] "3 raised to the power 1 is 3"

# function example
my.second.fun <- function(matrix, vector) {
  
  if (dim(matrix)[2] != length(vector)) {
    stop("Can't multiply matrix%*%vector because the dimensions are wrong")
  }
  
  product <- matrix %*% vector
  
  return(product)
  
}

# function works when dimensions are right
# save a matrix and a vector object
my.mat <- cbind(c(1, 3, 4), c(5, 4, 3))
my.vec <- c(4, 3)
my.second.fun(my.mat, c(6, 5))

# Good example of function
CalculateSampleCovariance <- function(x, y, verbose = TRUE) {
  # Computes the sample covariance between two vectors.
  #
  # Args:
  #   x: One of two vectors whose sample covariance is to be calculated.
  #   y: The other vector. x and y must have the same length, greater than one,
  #      with no missing values.
  #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
  #
  # Returns:
  #   The sample covariance between x and y.
  n <- length(x)
  # Error handling
  if (n <= 1 || n != length(y)) {
    stop("Arguments x and y have different lengths: ",
         length(x), " and ", length(y), ".")
  }
  if (TRUE %in% is.na(x) || TRUE %in% is.na(y)) {
    stop(" Arguments x and y must not have missing values.")
  }
  covariance <- var(x, y)
  if (verbose)
    cat("Covariance = ", round(covariance, 4), ".\n", sep = "")
  return(covariance)
}

