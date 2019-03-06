#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Author: Bhishan Poudel <poudel>
# @Date:   26-Oct-2016 13:10
# @Last modified by:   poudel
# @Last modified time: 08-Nov-2016 16:11
# Estimated time : 1 min for 1 input galaxy

# Imports
from __future__ import division, unicode_literals, print_function
from astropy.io import fits


def add_headers(infits, frame_num,outfits):
    """ Extracts the given frame from the input fitsfile.
    """

    # get header from 0, and data from other extensions
    # otherwise we may get this error:
    # Card 'BYTEORDR' is not FITS standard
    data0, header0 = fits.getdata(str(infits), ext=0, header=True)
    data1, header1 = fits.getdata(str(infits), ext=int(frame_num), header=True)
    fits.writeto(str(outfits), data1, header0, clobber=True)

    header0['OBSERVER'] = 'Edwin Hubble'
    fits.writeto(str(outfits), data1, header0, clobber=True)

    # remove BYTEORDR it gives error
    # WARNING: VerifyWarning: Card 'BYTEORDR' is not FITS standard
    # (invalid value string: 'BIG_ENDIAN / SunOS, solaris etc.
    # byte order').  Fixed 'BYTEORDR' card to meet the FITS standard.
    try:
        header1.remove("BYTEORDR")
    except:
        pass


    hdrlen= len(header1.keys())
    for i in list(range(hdrlen)):
        header0.set(header1.keys()[i], header1.values()[i])


    # we can again add the problomatic keyword byteorder
    header0.set('BYTEORDR' , 'BIG_ENDIAN')

    # finally write the fitsfile
    fits.writeto(str(outfits), data1, header0, clobber=True)


def main():

    # for imgblock.fits 0 is empty, 1 is input, 2 is residual
    # for subcomps.fits 0 is subcomps.fits, 1 is first component
    # ds9 -multiframe imgblock.fits &
    # ds9 -multiframe subcomps.fits &
    add_headers(r"imgblock.fits", 1, r"output.fits")


    pass


if __name__ == '__main__':
    main()
