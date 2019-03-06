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
import sys


def find_neg_pix(mypath):
    # get nan values
    mynans = []
    negs=[]
    zeros = []
    for i in range(201):
        dat = getdata('{}{}.fits'.format(mypath, i))
        mysum = np.sum(dat)
        fname = '{}{}.fits'.format(mypath, i)
        print(fname , 'has sum = ', mysum)
                
        # check for nan
        if np.isnan(mysum):
            mynans.append(i)
            print("mynans = {}".format(mynans))
                
        # check for neg pixel            
        neg_idx = np.argwhere(dat < 0)
        print("neg_idx = {}".format(neg_idx))
        
        if not neg_idx == []:
            print('ERROR: Negative Pixels found in: ', fname)
            sys.exit(1)
        
        # check for zero sum
        if float(mysum) == 0.0:
            zeros.append(i) 
            print("zeros = {}".format(zeros))
        print("len(zeros) = {}".format(len(zeros)))      
            
    return mynans,neg_idx, zeros
    

def check_path():
    bulge = 'bulge_disk_data/bulge_f8/f814w_bulge'
    disk = 'bulge_disk_data/disk_f8/f814w_disk'

    mypaths = [disk]
    for mypath in mypaths:
        mynans,neg_idx, zeros = find_neg_pix(mypath)

if __name__ == "__main__":
    check_path()
