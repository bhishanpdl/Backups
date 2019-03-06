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


def find_nan_in_path(mypath):
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
    
def find_nan_in_fits(myfits):
    # get nan values
    mynans = []
    negs = []
    zeros = []
    dat = getdata(myfits)
    mysum = np.sum(dat)
    
    # Check for nans
    if np.isnan(mysum):
        mynans.append(i)
        print(myfits , 'has sum = ', mysum)
    
    # check for total sum zero
    if float(mysum) == 0.0:
        zeros.append(i) 
        
    # check for -ve pixel
    neg_idx = np.argwhere(dat.T < 0)
               
    return mynans,neg_idx,zeros

def check_path():
    mypath = 'simdatabase/bulge_f8/f814w_bulge'
    mypath = 'simdatabase/disk_f8/f814w_disk'
    mypath = 'simdatabase/scaled_disk_f8/f814w_scaled_disk'
    mypath = 'simdatabase/scaled_bulge_f8/f814w_scaled_bulge'
    mynans,neg_idx, zeros = find_nan_in_path(mypath)


def check_files():
    # Individual files
    sb_hst = 'jedisim_out/out0/scaled_bulge/trial1_HST.fits'
    sb_lsst = 'jedisim_out/out0/scaled_bulge/trial1_lsst_bulge.fits'
    
    sd_hst = 'jedisim_out/out0/scaled_disk/trial1_HST.fits'
    sd_lsst = 'jedisim_out/out0/scaled_disk/trial1_lsst_disk.fits'
    
    sbd_hst = 'jedisim_out/out0/scaled_bulge_disk/trial1_HST.fits'
    sbd_lsst_bd = 'jedisim_out/out0/scaled_bulge_disk/trial1_lsst_bulge_disk.fits'
    sbd_lsst = 'jedisim_out/out0/scaled_bulge_disk/trial1_lsst.fits'
    sbd_mono = 'jedisim_out/out0/scaled_bulge_disk/trial1_lsst_mono.fits'
    
    
    myfits = [sb_hst, sb_lsst, sd_hst, sd_lsst, sbd_hst, sbd_lsst_bd, sbd_lsst, sbd_mono]
    myfits = [sb_hst]
    
    for myfit in myfits:
        mynans,neg_idx, zeros = find_nan_in_fits(myfit)
        
        print("mynans = {}".format(mynans))
        print("neg_idx = {}".format(neg_idx))
        print("zeros = {}".format(zeros))
        print("len(zeros) = {}".format(len(zeros)))

if __name__ == "__main__":
    check_path()
    # check_files()
