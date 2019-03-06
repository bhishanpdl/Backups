#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
#
# Date        : Jul 8, 2013
# Last update : Sep 17, 2016
#
# Estimated time:

# Imports
from __future__ import print_function


def generate_color_txt():

    # imports
    import os

    outfile = "color.txt"
    with open(outfile, 'w') as fout:
        blue = 'in1.fits'
        red  = 'in2.fits'
        out  = 'output.fits'
        line = blue + '  ' + red + '  ' + out
        print(line, file=fout)


if __name__ == '__main__':

    generate_color_txt()
