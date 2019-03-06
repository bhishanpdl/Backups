#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-19-2016 Wed
# Last update :
#
#
# Imports
from astropy.io import fits

image_file = 'input.fits'
hdu_list = fits.open(image_file)

print(hdu_list.info())

image_data = hdu_list[0].data

print(type(image_data))
print(image_data.shape)
hdu_list.close()


# ======================================================================
# method 2
# ======================================================================

image_data = fits.getdata(image_file)
print(type(image_data))
print(image_data.shape)
