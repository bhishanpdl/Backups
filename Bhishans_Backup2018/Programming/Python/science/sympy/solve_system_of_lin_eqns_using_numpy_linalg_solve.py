#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 04, 2016
# Last update :
#
# Ref: http://docs.scipy.org/doc/numpy-1.10.1/reference/generated/numpy.linalg.solve.html
#
# Imports
from __future__ import division, unicode_literals, print_function
import numpy as np


a = np.array([ [3, 1, 0, 0], [4, 1, 0, 1], [0, 1, -1, 19.9], [4, 0, -1, 4] ])
b = np.array([1,2,-1,1])
x = np.linalg.solve(a, b)

print (x)

# [ 0.82532751 -1.47598253  3.          0.17467249]

##======================================================================
# checking
logic = np.allclose(np.dot(a, x), b)
print(logic)
