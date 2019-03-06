#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jun 15, 2017 Thu
# Last update : 
#
# Imports
import numpy as np
import pandas as pd
import time

m1 = [[1,2,3], [4,5,6], [7,8,9]]
m2 = [['a','b','c'], ['d','e','f'], ['g','h','i']]


m3 = [   [[1,2,3],['a','b','c']],
         [[4,5,6],['d','e','f']],   
         [[7,8,9],['g','h','i']]   
     ]
print('m3 = ', m3[0])


# Attempt 1
m3 = [ r for r in zip(m1,m2)]
print('m3 = ', m3[0])


# Attempt 2
m1 = np.array(m1)
m2 = np.array(m2)
m3 = np.hstack((m1,m2))
print('m3 = ', m3[0])
