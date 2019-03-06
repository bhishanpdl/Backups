#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 14, 2016
# Ref     : https://stackoverflow.com/questions/16827053/solving-for-x-values-of-polynomial-with-known-y-in-scipy-numpy?rq=1
# Answer  : ~25

# Imports
import numpy as np
from numpy.polynomial import Polynomial as P

x = [50, 25, 12.5, 6.25, 0.625, 0.0625, 0.01]
y = [0.00, 0.50, 0.68, 0.77, 0.79, 0.90, 1.00]

p = P.fit(x, y, 3)

#print((p - .5).roots())

# Method 2
poly_coeffs = np.polyfit(x, y, 3)

f = np.poly1d(poly_coeffs)
def solve_for_y(poly_coeffs, y):
    pc = poly_coeffs.copy()
    pc[-1] -= y
    return np.roots(pc)
    print(y)

print(solve_for_y(poly_coeffs,0.5))
