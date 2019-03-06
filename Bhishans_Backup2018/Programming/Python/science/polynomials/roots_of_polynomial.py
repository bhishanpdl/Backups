#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 26, 2016
# Program : solve x*2 + 5*x + 6 = 0 ==> x = -2 & x = -3
# Polynomial : p[0] * x**n + p[1] * x**(n-1) + ... + p[n-1]*x + p[n]
# Coeffs     : p0,p1,p2,...pn

# Imports
import numpy as np

coeff = [1, 5, 6]
print (np.roots(coeff))


# method 2
from numpy.polynomial import Polynomial as P
p = P([6, 5, 1])
print(p.roots())
