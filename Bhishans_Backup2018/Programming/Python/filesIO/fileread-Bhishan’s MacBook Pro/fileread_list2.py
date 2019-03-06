#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
import numpy as np


infile = 'star_sed_range_list.txt'
star,col1,col2 = np.loadtxt(infile, dtype='string', comments="#", skiprows=0, usecols=(0,1,2), unpack=True)

print(col1[0],col2[0])
print(col1[len(col1)-1], col2[len(col2)-1])
print('{} {} {} {}'.format('number of rows = ', len(col1), ' ',' ' ))

print('{} {} {} {}'.format('\ntype of col1=  ', type(col1), ' ',' ' ))

print('{} {} {} {}'.format('\nfirst element = ', col1[0][0], ' ',' ' ))
