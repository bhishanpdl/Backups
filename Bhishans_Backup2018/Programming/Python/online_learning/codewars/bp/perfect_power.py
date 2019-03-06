#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
# eg. isPP(4) => [2,2]
#
# Imports
from math import log,floor



def isPP(n):
    import math
    val = int(math.ceil(math.sqrt(n)))+1
    for i in range(2,val):
        k = round(math.log(n)/math.log(i))
        if i**k == n:
            return [i,int(k)]


print(isPP(243))
print(isPP(4))
##======================================================================
## method2
##======================================================================
def isPP(n):
  for exponent in range(2,8):
    root = n ** (1.0/exponent)
    if int(round(root)) ** exponent == n:
      return [int(round(root)), exponent]

print(isPP(243**2))
print(isPP(4))





##======================================================================
## method3
##======================================================================
from math import log

def isPP(n, e=1e-12):
    for p in range(2, int(log(n, 2)) + 1):
        if int(n ** (1./p) + e) ** p == n:
            return [int(n ** (1./p) + e), p]
print(isPP(243))
print(isPP(4))
