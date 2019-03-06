#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
#
# Imports
def gcd(a, b):
    """Return greatest common divisor using Euclid's Algorithm."""
    while b:
        a, b = b, a % b
    return a

def lcm(a, b):
    """Return lowest common multiple."""
    return a * b // gcd(a, b)

def lcmm(*args):
    """Return lcm of args."""
    return reduce(lcm, args)

if __name__ == '__main__':
    print(gcd(2,40))
    print(lcm(3,4))
    print(lcmm(3,4,10))
