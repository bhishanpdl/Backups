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

A= [[ 1.,  2.],
   [ 3.,  4.]]
B= [[ 5.,  6.]]

C = np.vstack((A,B))
C = np.concatenate((A,B),axis=0)
print('C = ', C)


# Example 2
# vstack is faster than concatenate
a = np.random.normal(size=(20,100,3))
b = np.random.normal(size=(20,100,3))
c = np.concatenate((a,b),axis=0)
print(c)


# Example 3
C = np.r_[A,B]
print('C = ', C)
print((np.r_[a,b] == np.vstack([a,b])).all() )
