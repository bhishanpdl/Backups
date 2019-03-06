#!/usr/bin/python
"""
   Scientific Hello World script using the module hw.
   (c) Mehdi Rezaie
"""
from __future__ import division, unicode_literals, print_function
import sys
from hw import hw1

try:
    r1 = float(sys.argv[1]);  r2 = float(sys.argv[2])
except IndexError:
    print('Usage:', sys.argv[0], 'r1 r2'); sys.exit(1)

print('hw1, result:', hw1(r1, r2))
print('hw2, result: ', end=' ')
hw2(r1, r2)
