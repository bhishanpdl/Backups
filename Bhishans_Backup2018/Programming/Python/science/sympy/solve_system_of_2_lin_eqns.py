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

#x + y + z = 1
#x + y + 2z = 3





##======================================================================
## List of Equations Form:
##======================================================================

# method1
import sympy
from sympy import symbols,solve,Matrix

x, y, z = symbols('x, y, z')
ans = solve([x + y + z - 1, x + y + 2*z - 3 ], (x, y, z))

version = sympy.__version__
print('sympy version = ', version) # 0.7.6.1
print(ans)
# {x: -y - 1, z: 2}




##======================================================================
## Augmented Matrix Form:
##======================================================================
x, y, z = symbols('x, y, z')
ans = solve(Matrix(([1, 1, 1, 1], [1, 1, 2, 3])), (x, y, z))

print('{} {} {}'.format('\nAugmented Matrix Form','', ''))
print(ans)
# A degenerate system returns an empty dictionary.




##======================================================================
## A*x = b Form
##======================================================================
M = Matrix(((1, 1, 1, 1), (1, 1, 2, 3)))
system = A, b = M[:, :-1], M[:, -1]
ans = solve(system, x, y, z)

print('{} {} {}'.format('\nA*x = b Form','', ''))
print(ans)

# A degenerate system returns an empty dictionary.
