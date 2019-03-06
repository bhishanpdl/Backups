#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript readFitsArray.r

library(FITSio)

## Make a test file.
Z <- matrix(1:15, ncol = 3)
writeFITSim(Z, "test.fits")

## Open file, read header and array, close file and delete.
zz <- file(description = "test.fits", open = "rb")
header <- readFITSheader(zz)  # image data off primary header
D <- readFITSarray(zz, header)
close(zz)

## Look at data list, header file, and parsed header
str(D)
image(D$imDat)
str(header)
str(parseHdr(header))

## Delete test file
unlink("test.fits")

