#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 22, 2016
# Last update :
#

# Imports
from __future__ import division, unicode_literals, print_function
import scipy
from scipy.constants import e,m_e,k,epsilon_0,pi,c
from scipy.constants import physical_constants as pc
from scipy.constants import codata
from scipy.constants.codata import unit as u



##======================================================================
## units
##======================================================================
print('\n')
a = scipy.constants.find("electric") # find('epsilon_0') gives empty list
b = scipy.constants.find("boltzmann")
#print(a,b)
print('unit of epsilon_0 = ', u(u'electric constant')) # Fm-1
print('unit of k = ',u(u'Boltzmann constant')) # JK-1





##======================================================================
## Constant C revisited
##======================================================================
from pint import UnitRegistry
ureg = UnitRegistry()

print("\n")
epsilon_0 = epsilon_0 * ureg.F / ureg.m
k         = k         * ureg.J / ureg.K
m_e       = m_e       * ureg.kg
e         = e         * ureg.C
c         = c         * ureg.m / ureg.s

epsilon_cube = (4*pi*epsilon_0)**3
root         = (2*pi/3/k/m_e)**0.5
C            = 4 * (e**6) / (3* k*m_e*c) / epsilon_cube * root
C.ito_base_units()
print('{} {} {}'.format('epsilon_0 units = ',epsilon_0.units, ''))
print('{} {} {}'.format('k units = ',k.units, ''))
print('{} {} {}'.format('e units = ',e.units, ''))
print('{} {} {}'.format('c units = ',c.units, '\n'))
print(u'The value of C is = {}'.format(C))
print(u'The value of C is = {:~}'.format(C)) # abbreviated units
print(u'The value of C is = {:L}'.format(C)) # Latex format
print(u'The value of C is = {:P}'.format(C)) # Pretty format
