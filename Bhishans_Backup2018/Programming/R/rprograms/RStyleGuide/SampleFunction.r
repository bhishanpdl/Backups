#!/usr/bin/env Rscript


#variable.name is preferred, variableName is accepted

# GOOD: avg.clicks

#  OK: avgClicks

#  BAD: avg_Clicks

#             FunctionName

#  GOOD: CalculateAvgClicks

#  BAD: calculate_avg_clicks
#                 ,
#                 calculateAvgClicks

#  Make function names verbs.

# Exception: When creating a classed object, the function
#                 name (constructor) and class should match  (e.g., lm).
#             kConstantName



plot(x    = x.coord,
     y    = data.mat[, MakeColName(metric, ptiles[1], "roiOpt")],
     ylim = ylim,
     xlab = "dates",
     ylab = metric,
     main = (paste(metric, " for 3 samples ", sep = "")))

if (is.null(ylim)) {
  ylim <- c(0, 0.06)
}

if (condition) {
  one or more lines
} else {
  one or more lines
}

# Create histogram of frequency of campaigns by pct budget spent.
hist(df$pct.spent,
     breaks = "scott",  # method for choosing number of buckets
     main   = "Histogram: fraction budget spent by campaignid",
     xlab   = "Fraction of budget spent",
     ylab   = "Frequency (count of campaignids)")

# Example Function

CalculateSampleCovariance <- function(x, y, verbose = TRUE) {
 \raggedleft{ # Computes the sample covariance between two vectors.
  #
  # Args:
  #   x: One of two vectors whose sample covariance is to be calculated.
  #   y: The other vector. x and y must have the same length, greater than one,
  #      with no missing values.
  #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
  #
  # Returns:
  #   The sample covariance between x and y.}
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

