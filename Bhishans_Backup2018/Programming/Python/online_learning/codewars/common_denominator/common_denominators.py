#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
# a   = [[12.0, 84], [28.0, 84], [7.0, 84]] should equal
# ans = [[24, 84],   [28, 84],   [7, 84]]
#
# a   = [ [1, 2], [1, 3], [1, 4] ] produces the array
# ans = [ [6,12], [4,12], [3,12] ]
#
# 1/2 = 6/12, 1/3 = 4/12, 1/4 = 3/12
# Imports
from fractions import gcd


def convertFracts(lst):
    from fractions import gcd

    # reduce is functools.reduce in python3
    try:
        reduce
    except NameError:
        from functools import reduce

    # define lcm function
    def lcm(a, b)  : return a * b // gcd(a, b)
    def lcmm(*args): return reduce(lcm, args)



    denoms = [ x[1] for x in lst]
    D = lcmm(*denoms)

    return [ [  int(D* float(x[0])/x[1]), int(D)] for x in lst ]



a = [[12.0, 84], [28.0, 84], [7.0, 84]] # 12.0/84 = 24/84
#a = [ [1, 2], [1, 3], [1, 4] ]
print(convertFracts(a))

print(convertFracts([[2,4],[4,5],[6,7]]))
# myans= [[70, 140], [112, 140], [120, 140]]
# the right answer is [[35, 70], [56, 70], [60, 70]] since 2/4 is 1/2.
