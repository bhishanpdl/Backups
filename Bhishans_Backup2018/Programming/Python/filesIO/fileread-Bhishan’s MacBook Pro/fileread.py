#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
import numpy as np

infile = 'numpy_loadtxt_1.csv'
col0,col1 = np.genfromtxt(infile,usecols=(0,1),delimiter=',',
	       comments='#',skip_header=0,dtype=str,unpack=True)

print(col0[0], float(col1[0]))
print(type(col1))

col0,col1 = np.genfromtxt(infile,usecols=(0,1),delimiter=',',
	   comments='#',skip_header=0,dtype=str,unpack=True)
