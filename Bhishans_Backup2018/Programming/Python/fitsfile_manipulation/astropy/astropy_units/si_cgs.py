#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-08-2016 Sat
# Last update :
#
#
# Imports
import astropy.units as u

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

