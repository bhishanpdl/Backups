ß¨#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 4, 2017
# Update      : Jun 07, 2017 Wed
# 
# Imports
import os
import subprocess
import glob
import re
import natsort
from astropy.io.fits import getdata
import numpy as np

def find_nan_in_fits():
    """Check if a fitsfile has nan values in it."""
    # get nan values
    mynans = []
    for i in range(302):
        dat = getdata('simdatabase/bulge_disk_f8/bdf8_{}.fits'.format(i))
        mysum = np.sum(dat)
        if np.isnan(mysum):
            mynans.append(i)
            # print('simdatabase/bulge_disk_f8/bdf8_{}.fits'.format(i) , 'has sum = ', mysum)
        print('simdatabase/bulge_disk_f8/bdf8_{}.fits'.format(i) , 'has sum = ', mysum)
                
        
    return mynans
if __name__ == "__main__":
    mynans     = find_nan_in_fits()
    print(mynans)
