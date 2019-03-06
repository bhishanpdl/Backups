#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript readFitsHeader.r

library(FITSio)

## Make test image with axis information, write to disk
Z <- matrix(1:15, ncol = 3)
writeFITSim(Z, file = "test.fits", c1 = "Test FITS file",
            crpix = c(1,1), crvaln = c(10, 100), cdeltn = c(8, 2),
            ctypen = c("Distance", "Time"),
            cunitn = c("Furlongs", "Fortnights"))
## Read back in
## Open file, read header and array, close file and delete.
zz <- file(description = "test.fits", open = "rb")



# example of parseHdr
header <- newKwv('KEYWORD', 'VALUE', 'NOTE')
header <- addKwv('test1', 'plot size', header=header)
header <- addKwv('test2', 4294.95397809807, 'number', header=header)
header <- addKwv('test3', 4.29495397809807e50, 'big number', header=header)
header <- addKwv('test4', -4.29495397809807e50, 'big number', header=header)
parseHdr(header)
#################



header <- readFITSheader(zz)
hdr <- parseHdr(header)
D <- readFITSarray(zz, hdr)
close(zz)

hdr[1:10]                       # Header sample
hdr[which(hdr=="BITPIX")+1]   # BITPIX value from header
unlink("test.fits")

