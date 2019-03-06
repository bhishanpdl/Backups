#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov-08-2016 Tue
# Last update :
#
#
# Imports
from astropy.io import fits
hdulist = fits.open('input.fits')

#print(hdulist.info())
print(hdulist[0].header['NAXIS1'])

# add headers
prihdr = hdulist[0].header

hdr1 = hdulist[1].header
hdr1.remove("BYTEORDR")

# now add headers
#prihdr['targname'] = 'NGC121-a'
#prihdr['targname'] = ('NGC121-a', 'the observation target') # comments


# another way of adding header entry
# prihdr.set('observer', 'Edwin Hubble')

# print updated header
#print(repr(prihdr))
print(repr(prihdr.keys()))
print(repr(prihdr.values()))

# header to file
with open ('headers.txt','w') as fileobj:
    prihdr.tofile(fileobj, sep='\n', endcard=False, padding=False, clobber=True)




# again print headers
print(repr(prihdr.keys()))

# write the changed fitsfile to new fitsfile
hdulist.writeto('newimage.fits',clobber=True)
