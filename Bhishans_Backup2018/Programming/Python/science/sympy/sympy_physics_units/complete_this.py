#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 22, 2016
# Last update :
#

# Imports
import scipy
from scipy.constants import e,m_e,k,epsilon_0,pi,c
from scipy.constants import physical_constants as pc
from scipy.constants import codata
from scipy.constants.codata import unit as u
from sympy.physics import units as spu

epsilon_cube = (4*pi*epsilon_0)**3
root         = (2*pi/3/k/m_e)**0.5
C            = 4 * (e**6) / (3* k*m_e*c) / epsilon_cube * root

print('{} {:e} {}'.format('Constant for equation of tau C = ',C, ' '))


# answer
# Constant for equation of tau C =  1.772049e-12




##======================================================================
## units
##======================================================================
a = scipy.constants.find("epsilon_0")
print('\n')
print(a)  # empty list


a = scipy.constants.find("electric")
b = scipy.constants.find("boltzmann")
print('\n')
print(a,b)


print("\n")
print(u(u'proton mass'))
print(u(u'electric constant')) # Fm-1
print(u(u'Boltzmann constant')) # JK-1





##======================================================================
## Constant C revisited
##======================================================================

print("\n")
epsilon_0 = epsilon_0 * spu.J / spu.m
k = k * spu.J / spu.K
m_e = m_e * spu.kg
e = e * spu.C
c = c * spu.m / spu.s / spu.c

epsilon_cube = (4*pi*epsilon_0)**3
root         = (2*pi/3/k/m_e)**0.5
C            = 4 * (e**6) / (3* k*m_e*c) / epsilon_cube * root

print(C)
