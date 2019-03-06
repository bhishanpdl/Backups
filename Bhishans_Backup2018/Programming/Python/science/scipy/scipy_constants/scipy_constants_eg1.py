#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 13, 2016
# Last update :
#
# scipy constants:
# e, c, h, hbar, k, g, G, R
# m_e, m_p, m_n, N_A, mu_0
# sigma, Wien, Rydberg, alpha

# Imports
from __future__ import division, unicode_literals, print_function
import numpy as np
import scipy
from scipy.constants import h #h = 6.62607004e-34 # Js
from scipy.constants import c #c = 299792458      # ms-1
from scipy.constants import k #k = 1.3806488e-23  # J K-1

print('{} {:} {}'.format('np.e = ',np.e, 'unitless'))
print('{} {:} {}'.format('scipy.constants.e = ',scipy.constants.e, 'J'))




##======================================================================
## MASS  e.g gm,lb,u or atomic_mass
##======================================================================
print("\n")
print('{} {:} {}'.format('gram = ',scipy.constants.gram, ''))
print('{} {:} {}'.format('lb = ',scipy.constants.lb, ''))
print('{} {:} {}'.format('u = ',scipy.constants.u, ''))


##======================================================================
## LENGTH
## inch,foot,yard,mile,fermi,angstrom,micron,au,light_year,parsec
##======================================================================
print("\n")
print('{} {:} {}'.format('foot = ',scipy.constants.foot, ''))
print('{} {:} {}'.format('au = ',scipy.constants.au, ''))
print('{} {:} {}'.format('parsec = ',scipy.constants.parsec, ''))


##======================================================================
## Energy
## eV,calorie,erg
##======================================================================
print("\n")
print('{} {:} {}'.format('eV = ',scipy.constants.eV, ''))
print('{} {:} {}'.format('calorie = ',scipy.constants.calorie, ''))
print('{} {:} {}'.format('erg = ',scipy.constants.erg, ''))



##======================================================================
## Time
## minute,hour,day,week,year,Julian_year (365.25 days)
##======================================================================
print("\n")
print('{} {:} {}'.format('year = ',scipy.constants.year, ''))


##======================================================================
## SI prefixes
## yotta,zetta,exa,peta,tera,giga,mega,kilo,hecto,deka
## 24    21    18  15   12   9    6    3    2     1
## deci  centi milli micro nano pico femto atto zepto
## -1    -2    -3    -6    -9   -12  -15   -18  -21
##======================================================================
print("\n")
print('{} {} {}'.format('nano = ',scipy.constants.nano, ''))

##======================================================================
## Angle  (default is radian, which is dimensionless)
## degree arcmin arcsec
## 1 deg    = pi/180
## 1 arcsec = 1/60 arcmin = 1/60/60 degree
##======================================================================
print("\n")
print('{} {} {}'.format('degree = ',scipy.constants.degree, ''))
print('{} {} {}'.format('degree/3600 = ',scipy.constants.degree/3600, ''))
print('{} {} {}'.format('arcsec = ',scipy.constants.arcsec, ''))


##======================================================================
## Speed
## kmh mph mach speed_of_sound knot
##======================================================================
print("\n")
print('{} {} {}'.format('degree = ',scipy.constants.degree, ''))
print('{} {} {}'.format('degree/3600 = ',scipy.constants.degree/3600, ''))
print('{} {} {}'.format('arcsec = ',scipy.constants.arcsec, ''))





###======================================================================
### convert_temperature DOES NOT WORK!
###======================================================================
import scipy
from scipy.constants import convert_temperature
a = convert_temperature(np.array([0, 100.0]), 'C', 'K')
print('\n')
print(a)
