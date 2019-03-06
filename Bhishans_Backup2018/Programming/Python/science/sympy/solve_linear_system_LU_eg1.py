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
from sympy.abc import x, y,z
from sympy.solvers.solvers import solve_linear_system_LU


ans = solve_linear_system_LU(Matrix([
 [1, 2, 0, 1],
 [3, 2, 2, 1],
 [2, 0, 0, 1]]), [x, y, z])

print(ans)
