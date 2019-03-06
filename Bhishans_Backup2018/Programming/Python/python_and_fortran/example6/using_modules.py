#!/usr/bin/python3
"""
   Scientific Hello World script using the module sine_add.
"""
import sys
from sine_add import sine_add1,sine_add2

try:
    #r1 = float(sys.argv[1]);  r2 = float(sys.argv[2])
    r1 = 0.5;  r2 = 60

except IndexError:
    print('Usage:', sys.argv[0], 'r1 r2'); sys.exit(1)

print('sine_add1, result:', sine_add1(r1, r2))
print('sine_add2, result: ', end=' ')
sine_add2(r1, r2)
