#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        :  Oct 17, 2017
# Last update :
"""
Read the header of given fitsfile.

"""

# Imports
import time
import numpy as np
from astropy.io import fits


def main():
    """Run main function."""
    infile = 'scaled_disk_f8/f814w_scaled_disk134.fits'
    hdr = fits.getheader(infile)
    h = hdr['NAXIS1']
    print("h = {}".format(h)) # 601
    print("int(h) + 2 = {}".format(int(h) + 2)) # 603

if __name__ == "__main__":
    main()
