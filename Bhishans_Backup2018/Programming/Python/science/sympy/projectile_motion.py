#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 04, 2016
# Last update :
#
# Ref: http://stackoverflow.com/questions/9440337/solving-systems-of-equations-with-sympy
#
# Imports
from __future__ import division, unicode_literals, print_function
import sympy
from sympy import S, Eq, solve

vf, d, a, vi, t = S('vf d a vi t'.split())
equations = [
     Eq(vf, vi+a*t),
     Eq(d, vi*t + a*t**2/2),
     Eq(a, 10),
     Eq(d, 60),
     Eq(vi, 5)]

ans = solve(equations)
print(ans)
# [{vi: 5, t: -4, vf: -35, a: 10, d: 60}, {vi: 5, t: 3, vf: 35, a: 10, d: 60}]


ans = solve(equations, [t, a, vi, vf, d])
print(ans)
# [(-4, 10, 5, -35, 60), (3, 10, 5, 35, 60)]
