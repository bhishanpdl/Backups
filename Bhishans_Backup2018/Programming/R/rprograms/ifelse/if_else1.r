#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 23, 2016

x <- -5
if(x > 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

# one line function
if(x > 0) print("Non-negative number") else print("Negative number")

# nested conditional
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")
