#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 04, 2016
# Last update :
#
#
# Imports
from __future__ import division, unicode_literals, print_function
import numpy
import scipy.linalg

m = numpy.matrix([
    [3, 1, 0, 0],
    [4, 1, 0, 1],
    [0, 1, -1, 19.9],
    [4, 0, -1, 4],
])

rhs = numpy.matrix([ [1],[2],[-1],[1] ])

ans = scipy.linalg.solve(m, rhs)
aR,aRho,aL,aT = ans

print (ans)
print('{} {} {}'.format('\naR = ',aR[0], ''))
print('{} {} {}'.format('aT = ',aT[0], ''))
print('{} {:.3f} {}'.format('aR + aT = ',aR[0] + aT[0], ''))

# python result
# [[ 0.82532751]
#  [-1.47598253]
#  [ 3.        ]
#  [ 0.17467249]]

# from: http://www.mathportal.org/calculators/system-of-equations-solver/system-4x4.php
# The solution is [x, y, z, t] =[189/229, -338/229, 3, 40/229]

# from: http://math.bd.psu.edu/~jpp4/finitemath/4x4solver.html
# w = 0.8253275109170306
# x = -1.4759825327510923
# y = 3.000000000000001
# z = 0.17467248908296953
