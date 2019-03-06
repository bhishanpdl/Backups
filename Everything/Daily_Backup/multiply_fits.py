#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : May 10, 2017 Wed
# Last update : Jun 19, 2017 Mon
# Est time    : 0.001 sec
#
# Imports
import numpy as np
import sys,os,shutil
import random
from astropy.io import fits
from astropy import wcs

def multiply_fits(fitsfile,value):
  # Get data
  data = fits.getdata(fitsfile) * value
 
  # Write output file
  print('Overwriting: ', fitsfile)
  fits.writeto(fitsfile,data,clobber=True)
  

def main():
    fitsfile = 'trial1_HST.fits'
    value = 1000
    multiply_fits(fitsfile,value)
    
if __name__ == '__main__':
    main()
