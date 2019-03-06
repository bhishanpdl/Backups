#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 4, 2017
# Update      : Aug 7, 2017 Mon
# 
# Imports
import os
import subprocess
import glob
import re
import natsort
from astropy.io.fits import getdata
import numpy as np

def find_nan_in_fits(mypath):
    """Check if a fitsfile has nan values in it.
    
    Parameters:
    ------------
     mypath: full path name without .fits 
             e.g. scaled_disk_f8/f814w_scaled_disk
             
    """
    # get nan values
    mynans = []
    negs=[]
    zeros = []
    for i in range(201):
        dat = getdata('{}{}.fits'.format(mypath, i))
        mysum = np.sum(dat)
        if np.isnan(mysum):
            mynans.append(i)
            # print('simdatabase/bulge_disk_f8/bdf8_{}.fits'.format(i) , 'has sum = ', mysum)
        print('{}{}.fits'.format(mypath, i) , 'has sum = ', mysum)
        
        # extra
        if float(mysum) < 0.0:
            negs.append(i)
        if float(mysum) == 0.0:
            zeros.append(i)        
    return mynans,negs, zeros

if __name__ == "__main__":
    
    # mypath = 'scaled_bulge_f8/f814w_scaled_bulge'
    mypath = 'disk_f8/f814w_disk'
    mynans,negs, zeros = find_nan_in_fits(mypath)
    
    print("mynans = {}".format(mynans))
    print("negs = {}".format(negs))
    print("zeros = {}".format(zeros))
    print("len(zeros) = {}".format(len(zeros)))


"""Outputs
For scaled bulge:
mynans = []
negs = []
zeros = []

For scaled_disk:
mynans = []
negs = []
zeros = [7, 10, 11, 12, 18, 25, 27, 35, 37, 38, 39, 40, 43, 46, 47, 48, 54, 61, 
65, 66, 68, 73, 79, 80, 81, 85, 88, 93, 94, 95, 99, 100, 102, 103, 106, 107, 
108, 110, 112, 113, 114, 115, 116, 117, 120, 121, 123, 126, 129, 137, 142, 
145, 146, 148, 149, 152, 161, 163, 164, 165, 166, 167, 168, 170, 175, 177, 
183, 184, 186, 192, 195, 196]
len(zeros) = 72

"""
