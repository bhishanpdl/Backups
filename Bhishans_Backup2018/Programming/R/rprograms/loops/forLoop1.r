#!/usr/bin/env Rscript

# Bhishan Poudel
# Jan 23, 2016


x = seq(1, 100, by=2)

x.squared = NULL

for (i in 1:50 ) {
  x.squared[i] = foo[i]^2
}

print(x[5])
print(x.squared[5])

# example 2
bar = seq(1, 200, by=2)
bar.squared = NULL

for (i in 1:length(bar) ) {
  bar.squared[i] = bar[i]^2
}
print(summary(bar.squared))


# for loop to count # of even numbers in a list
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)