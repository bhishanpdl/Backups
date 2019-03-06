#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun 09, 2017 Fri
# Last update :
"""
Calculate flux of given galaxy.

"""

# Imports
import time
import numpy as np
from astropy.io import fits

def find_flux(infile):
    dat = fits.getdata(infile)
    flux = np.sum(dat)
    
    hdr = fits.getheader(infile)
    flux_hdr = hdr['FLUX']
    print("flux_hdr = {}".format(flux_hdr))
    print("flux     = {}".format(flux))

def main():
    """Run main function."""
    find_flux('sect23_f814w_gal0.fits')

if __name__ == "__main__":
    main()
