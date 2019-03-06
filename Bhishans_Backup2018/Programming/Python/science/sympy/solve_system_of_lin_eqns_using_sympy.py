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
from sympy import symbols,solve

w,x,y,z = symbols('w, x, y, z')
eq1 = 3*w + x              -1
eq2 = 4*w + x     + z      -2
eq3 =       x -y  + 19.9*z + 1
eq4 = 4*w     - y + 4*z    - 1
ans = solve([eq1, eq2,eq3,eq4], (w,x, y,z))

# answer
# {x: -1.47598253275109, w: 0.825327510917031, z: 0.174672489082969, y: 3.00000000000000}


# w = 0.8253275109170306
# x = -1.4759825327510923
# y = 3.000000000000001
# z = 0.17467248908296953
