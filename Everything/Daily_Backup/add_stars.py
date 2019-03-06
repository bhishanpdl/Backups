#!python
# -*- coding: utf-8 -*-#
"""
Add given psf to random places of a cluster.

@author: Bhishan Poudel

@date: Feb 14, 2018

"""
# Imports
import numpy as np
import sys,os,shutil
import random
from astropy.io import fits
from astropy import wcs

def add_stars(n_stars,cluster, star_value):
  # Read cluster
  cluster_hdu = fits.open(cluster)
  
  # shape
  # NOTE: NAXIS = 2 means data has two axes
  NAXIS1 = fits.getheader(cluster)['NAXIS1'] # 12288 
  NAXIS2 = fits.getheader(cluster)['NAXIS2'] # 12288 


  # Randomly put stars inside the cluster
  for i in range(0,n_stars):
      x = random.randint(0, NAXIS1)
      y = random.randint(0, NAXIS2)
      print(y,x)
      cluster_hdu[0].data[y, x] = star_value
 
  # Write output file
  cluster_hdu.writeto(cluster,clobber=True)
  cluster_hdu.close()
  
  # Print
  print('{} STARs added to the galaxy cluster: {}'.format(n_stars,cluster))

def add_wcs(cluster):
  # Read cluster
  cluster_hdu = fits.open(cluster)
  
  # Get fake wcs from astropy
  w = wcs.WCS(naxis=2)
  w.wcs.crpix = [1800.0, 1800.0]
  w.wcs.crval = [0.1, 0.1]
  w.wcs.cdelt = np.array([-5.55555555555556E-05,5.55555555555556E-05])
  w.wcs.ctype = ["RA---TAN", "DEC--TAN"]
  wcs_hdr = w.to_header()
  
  # Add fake wcs to header of output file
  hdr = cluster_hdu[0].header
  hdr += wcs_hdr
  
  # Write output file
  cluster_hdu.writeto(cluster,clobber=True)
  cluster_hdu.close()
  
  # Print
  print('Fake WCS added to the galaxy cluster: {}'.format(cluster))

def main():
    """Run main function."""
    
    # variables
    n_stars = 200
    star_value = 1000
    cluster = 'trial1_HST.fits'
    
    # add_stars(n_stars,cluster,star_value)
    add_wcs(cluster)

if __name__ == "__main__":
    main()
