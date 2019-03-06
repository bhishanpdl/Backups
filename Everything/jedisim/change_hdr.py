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
import glob


def main():
    """Run main function."""
    for infile in glob.glob('scaled_disk_f8/*.fits'):
        print("Reading: {}".format(infile))
        hdr = fits.getheader(infile)
        hdr['NAXIS1'] = 601
        hdr['NAXIS2'] = 601

if __name__ == "__main__":
    main()
