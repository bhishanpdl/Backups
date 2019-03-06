#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-08-2016 Sat
# Last update :
#
#
# Imports
from astropy import units as u
import numpy as np
from astropy.constants import h, k_B

a = 1. + 1. * u.m / u.km
print('\n')
print(a)


##NOTE:
b = 1. + (1. * u.m / u.km).value
print('\n')
print(b)

c = 1. + (1. * u.m / u.km).decompose()
print('\n')
print(c)

##======================================================================
# when combining with a non-quantity object, the unit is
# automatically decomposed to be scale-free,
# giving the expected result.

# This also occurs when passing dimensionless
# quantities to functions that take dimensionless quantities:

nu = 3 * u.GHz
T = 30 * u.K
a = np.exp(- h * nu / (k_B * T))
print('\n')
print(a)
