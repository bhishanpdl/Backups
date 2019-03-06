#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 17, 2016

x <- read.fwf(
  file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
  skip=4,
  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))

print(head(x))

# method 2
# Speed comparison: readr::read_fwf() was ~2x faster than utils::read.fwf ().
library(readr)
x <- read_fwf(
  file="http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for",   
  skip=4,
  fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))
# printing top values
print(head(x))

# method 3
df <- read.fwf(
  file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
  widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
  skip=4
)
#The -1 in the widths argument says there is a one-character column 
# that should be ignored,the -5 in the widths argument says there is a 
# five-character column that should be ignored, likewise...

