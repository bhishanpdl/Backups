#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 5, 2016

# clear; Rscript zprint.r; rm *~

print("hello\nworld\n")

cat("hello\nworld\n")

cat("\n")
writeLines("hello\nworld")



#fucntion to print words with two newlines
cat("\nexample 2\n")
prnt.test <- function(x){
   cat(x, sep="\n\n")
}
prnt.test(c("test1", "test2", "test3"))
