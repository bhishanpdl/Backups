#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : May 23, 2016
# Last update : Aug 04, 2016
#
# Inputs      : F3V
# Outputs     : interpolated_flux.csv
#
# Info:
# 1. This program takes in the input star sed file (wave vs flux)
#        and then interpolates the flux to some given values of wavelengths
#        and writes to output file.
#
# Estimated time : 4 minutes

# Imports
from __future__ import print_function
import numpy as np
import scipy as sp
import scipy.interpolate
import time

# start time
start_time = time.time()


# read data from the file
infile = 'F3V'
wave, flux = np.genfromtxt(infile, delimiter='', usecols=(0, 1), dtype=None, unpack=True)
print('{} {} {}'.format('wave[0] = ', wave[0], ''))
print('{} {} {}'.format('flux[0] = ', flux[0], '\n'))

# wavelength range to interpolate
waverange = np.linspace(1.24, 1.57, num=21, endpoint=True)
print('{} {} {}'.format('waverange :\n', waverange, ''))


# interpolation
print('{} {} {}'.format('\nInterpolating flux from the file : ', infile, ' \n...'))
interpolated_flux = sp.interpolate.interp1d(wave, flux, kind='cubic')(waverange)


# write to a file
outfile = 'interpolated_flux.csv'
np.savetxt(outfile, list(map(list, zip(*[waverange, interpolated_flux]))),
           fmt='%s', delimiter=' ', newline='\n')


# output info
print('{} {} {}'.format('\ninterpolation range :', waverange, '\n'))
print('{} {} {}'.format('input file          : ', infile, ''))
print('{} {} {}'.format('output file         :', outfile, ''))


# print the time taken
end_time = time.time()
seconds = end_time - start_time
m, s = divmod(seconds, 60)
h, m = divmod(m, 60)
d, h = divmod(h, 24)
print("\nTime taken ==> {:2.0f} days, {:2.0f} hours,\
{:2.0f} minutes, {:f} seconds.".format(d, h, m, s))
