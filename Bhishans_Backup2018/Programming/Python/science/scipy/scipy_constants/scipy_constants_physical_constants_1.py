#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-09-2016 Sun
# Last update :
#
#
# Imports
from scipy.constants import physical_constants as pc


m_alphapc = pc["alpha particle mass"]
print('{} {:} {} {} {}'.format('m_alphapc = ',m_alphapc[0], m_alphapc[1],'with uncertainty +- ', m_alphapc[2]))

##======================================================================
print("\n")
amupc = pc["atomic mass constant"]
print('{} {} {}'.format('amupc = ',amupc, ''))
print('{} {} {}'.format('amupc*2 = ',amupc*2, ''))
print('{} {} {} {} {}'.format('amupc = ',amupc[0], amupc[1], 'with uncertainty +- ', amupc[2]   ))


