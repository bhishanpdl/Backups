#!/usr/bin/python3
"""
   Pure Python Scientific Hello World module.
"""
import math, sys

def sine_add1(r1, r2):
    s = math.sin(r1 + r2)
    return s

def sine_add2(r1, r2):
    s = math.sin(r1 + r2)
    print 'Hello, World! sin(%g+%g)=%g' % (r1,r2,s)
