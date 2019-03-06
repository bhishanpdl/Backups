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
a = u.g.find_equivalent_units()
print('\n')
print(a)





##======================================================================
## imperial units (use with to use temporarily)
##======================================================================
from astropy.units import imperial
with imperial.enable():
    u.m.find_equivalent_units()
print('\n')
print(a)


