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
from astropy.units import imperial

cms = u.cm / u.s
# ...and then use some imperial units
mph = imperial.mile / u.hour

# And do some conversions
q = 42.0 * cms
a = q.to(mph)
print(a)


##======================================================================
print("\n")
a = (1.0 * u.Pa).cgs
print(a)




##======================================================================
## spectral conversion
##======================================================================
print("\n1000 nm to Hz")
a = (1000 * u.nm).to(u.Hz, equivalencies=u.spectral())
print(a)




##======================================================================
## formatting
##======================================================================
print("\n")
q = 15.1 * u.meter / (32.0 * u.second)
print(q)

a = "{0:0.03f}".format(q)
print(a)

print("\n")
q = 15.1 * u.meter / (32.0 * u.second)
print(q)

a = "{0.value:0.03f} {0.unit:FITS}".format(q)
print(a)
