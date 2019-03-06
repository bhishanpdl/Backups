#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
import random


def is_square(n):
    if n < 0:
        return False

    if n == 0:
        return True

    else :
        n = int(n)

        x = n // 2
        seen = set([x])

        while x * x != n:
            x = (x + (n // x)) // 2
            if x in seen: return False
            seen.add(x)
        return True




##======================================================================
## method2
##======================================================================
from math import sqrt

def is_square(n):
    return n > 0 and sqrt(n).is_integer()




##======================================================================
## method3
##======================================================================
def is_square(n):
    return n>0 and (n**0.5).is_integer()





##======================================================================
## method4
##======================================================================
is_square = lambda n: n > 0 and int(float(n) ** 0.5) ** 2 == n
