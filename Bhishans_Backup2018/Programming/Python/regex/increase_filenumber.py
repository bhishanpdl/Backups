#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Dec 14, 2016
# Last update :
# Est time    :


def increase_filenumber(infile):
    """increase filenumber by 100.

    e.g.
    tmp/f606w_gal1.fits ==>  tmp/f606w_gal101.fits
    tmp/f814w_gal1.fits ==>  tmp/f814w_gal101.fits

    """
    import os
    import glob
    import re
    oldfiles = glob.glob(infile)
    for oldfile in oldfiles:
        try:
            # line = tmp/f814w_gal1.fits
            #      tmp/f814w_gal   1    .fits
            pre, num, pst = re.search('(.+?)(\d+)(\.\w+)', oldfile).groups()
            newfile = pre + str(int(num) + 100) + pst

            print(oldfile, "==> ", newfile)
            # os.rename(oldfile, newfile)

        except:
            pass


if __name__ == "__main__":
    infile = 'tmp/*.fits'
    increase_filenumber(infile)
