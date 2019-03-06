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
from sympy import Matrix, solve_linear_system
from sympy.abc import x, y

# solve the system
#    x + 4 y ==  2
# -2 x +   y == 14

system = Matrix(( (1, 4, 2), (-2, 1, 14)))
ans = solve_linear_system(system, x, y)

print(ans)
