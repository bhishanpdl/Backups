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

q = np.array([1., 2., 3., 4.]) * u.m / u.s

mean1 = np.mean(q)
print(mean1)

std1 = np.std(q)
print(std1)

##======================================================================
q = 30. * u.deg
a = np.sin(q)
print('\n')
print(a)


##======================================================================
from astropy.constants import h, k_B
nu = 3 * u.GHz
T = 30 * u.K
a = np.exp(-h * nu / (k_B * T))
print('\n')
print(a)
print('{} {} {}'.format('a.unit = ',a.unit, ''))
