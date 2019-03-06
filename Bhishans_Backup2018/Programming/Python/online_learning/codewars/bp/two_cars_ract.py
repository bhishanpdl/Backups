#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports
def race(v1, v2, g):

    if v1 >= v2 or v1==0.0 or v2 == 0.0 :
        return None

    elif v2 != v1:
        t = float(g)/float(abs(v2-v1)) * 3600.0
        m, s = divmod(t, 60)
        h, m = divmod(m, 60)
        return [int(h), int(m), int(s)]




print(race(720, 850, 70))  # [0, 32, 18]
print(race(0.0, 44.0, 39)) # None

# [0.0, 44.0, 39] should equal None




##======================================================================
## method2
##======================================================================
def race(v1, v2, g):
    if v1 < v2:
        t = g * 3600 / (v2 - v1)
        return [t//3600, t//60%60, t%60]

print(race(720, 850, 70))  # [0, 32, 18]
print(race(0.0, 44.0, 39)) # None but shows [0.0, 53.0, 10.909090909090992]


