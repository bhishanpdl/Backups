#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-08-2016 Sat
# Last update :
#
# Ref: http://docs.sympy.org/dev/modules/physics/units.html#
#
# Note: countries with not official SI units:
#       Myanmar (Burma), Liberia, and the United States

# Imports
from sympy.physics import units as u
a = 12. * u.inch / u.m

print(a)


##======================================================================
u.BTU = 1055.05585 * u.J
a = u.BTU
print('\n')
print(a)




##======================================================================
## find_unit('search_things')
##======================================================================

a = u.find_unit('coul')
print('{} {} {}'.format('u.find_unit_coul = ',a, ''))

b = u.find_unit(u.charge)
print('\n')
print(b)

##======================================================================
print("\n")
print(u.A.name)
print(u.ampere.abbrev)

print(u.find_unit('magnet'))

##======================================================================
print("\n")
print(u.find_unit('gal')) # empty list

# now define gal
u.gal = 4 * u.quart
a = u.gal /u.inch**3
print('\n')
print(a)

##======================================================================
print("\n")
print('{} {} {}'.format('joule = ',u.joule, ''))
print('{} {} {}'.format('coulomb = ',u.coulomb, ''))
