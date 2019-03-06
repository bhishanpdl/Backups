#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript eg1.r

# ref: http://finzi.psych.upenn.edu/library/FITSio/html/readFrameFromFITS.html

library(FITSio)

## Either download example file from
## <http://fits.gsfc.nasa.gov/fits_samples.html>
## and use
## Not run: filename <- "IUElwp25637mxlo.fits"
## or, for local example use
filename <- system.file("fitsExamples", "eg1.fits",package = "FITSio")

## Get data and display
F <- readFrameFromFITS(filename) 
names(F)
plot(F$NET, ylab = "Value", main = names(F)[5], type = "l")

### Simple flat file example
filename <- system.file("fitsExamples", "2008_03_11_203150.fits", package = "FITSio")  
F <- readFrameFromFITS(filename) 
names(F)
attach(F)
plot(DMJD, TiltX, xlab = "Time [DMJD]", ylab = "X Tilt [degr]", type = "l")
detach(F)
