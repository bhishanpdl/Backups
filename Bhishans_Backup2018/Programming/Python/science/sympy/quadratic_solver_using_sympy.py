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
from sympy import var,solve

var('x')
eqn = x**2 + 3.2*x - 3.25
ans = solve(eqn, x)
print(ans)

# [-4.01039415863879, 0.810394158638790]
