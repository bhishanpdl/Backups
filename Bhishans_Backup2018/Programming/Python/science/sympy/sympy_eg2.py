#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 04, 2016
# Last update :
#
# Ref: http://stackoverflow.com/questions/27081122/system-of-nonlinear-equations-can-be-solved-in-maple-but-not-in-sympy?rq=1
#
# Imports
from __future__ import division, unicode_literals, print_function
from sympy import filldedent,solve
from sympy import exp
from sympy.abc import b,n,k,p


eq1 = 0.0165 * exp( -2.0405-0.33*b-0.5*n)+0.031 * exp(-4.164-0.62*b-0.5*n) - k*p
eq2 = 0.025 * exp( -2.0405-0.33*b-0.5*n) +0.025 * exp(-4.164-0.62*b-0.5*n) - 5*k
eq3 = 2*p - p*b+5*n

print (filldedent(solve([eq1,eq2,eq3],[b,n,k], rational=False)))
