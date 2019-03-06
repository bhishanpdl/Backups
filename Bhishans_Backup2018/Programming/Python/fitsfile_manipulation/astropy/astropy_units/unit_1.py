#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-08-2016 Sat
# Last update :
#
#
# Imports
from __future__ import division, unicode_literals, print_function
from astropy import units as u


a = 42.0 * u.meter
print(a)

a = [1., 2., 3.] * u.m
print(a)


import numpy as np
a = np.array([1., 2., 3.]) * u.m
print('{} {} {}'.format('\na = ',a, ''))
print('{} {} {}'.format('a.value = ',a.value, ''))
print('{} {} {}'.format('a.unit = ',a.unit, ''))


##======================================================================
print("\n")
a = 15.1 * u.meter / (32.0 * u.second)
print(a)
print(a.value)
print(a.unit)


a = 3.0 * u.kilometer / (130.51 * u.meter / u.second)
print(a)

a = (3.0 * u.kilometer / (130.51 * u.meter / u.second)).decompose()
print(a)

##======================================================================
x = 1.0 * u.parsec
a = x.to(u.m)
print('{} {} {}'.format('\n1 parsec = ',a, ''))


##======================================================================
q = 2.4 * u.m / u.s

print(q.si)
print(q.cgs)




##======================================================================
## arithmetic (left unit is used)
##======================================================================
a1 = 1100.1 * u.m + 13.5 * u.km
a2 = 13.5 * u.km + 1100.1 * u.m
print('{} {} {}'.format('a1 = ',a1, ''))
print('{} {} {}'.format('a2 = ',a2, ''))


b = 1.1 * u.m * 140.3 * u.cm
c = (1.1 * u.m * 140.3 * u.cm).to(u.m**2)
print('{} {} {}'.format('\nb = ',b, ''))
print('{} {} {}'.format('c = ',c, ''))

# decompose()
a = (20. * u.cm / (1. * u.m)).decompose()
b = (15. * u.kg * 32. * u.cm * 15 * u.m / (11. * u.s * 1914.15 * u.ms)).decompose()
print('\n{} {} {}'.format('a = ',a, ''))
print('{} {} {}'.format('b = ',b, ''))

