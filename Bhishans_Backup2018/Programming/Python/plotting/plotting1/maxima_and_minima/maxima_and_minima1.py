#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 31, 2016
# Ref     : https://stackoverflow.com/questions/4624970/finding-local-maxima-minima-with-numpy-in-a-1d-numpy-array

# Imports
from numpy import *

# data 
x = linspace(0,4,1e3)
y = .2*sin(10*x)+ exp(-abs(2-x)**2)

# Global maxima
max_y = max(y)         # Find the maximum y value
max_x = x[y.argmax()]  # Find the x value corresponding to the maximum y value
print (max_x, max_y)
print('')

# Local extrema
#extrema = diff(sign(diff(y))).nonzero()[0] + 1        # local min+max
min_index = (diff(sign(diff(y))) > 0).nonzero()[0] + 1 # local min
max_index = (diff(sign(diff(y))) < 0).nonzero()[0] + 1 # local max

print('first local x-min =', x[min_index][0])
print('first local y-min =', y[min_index][0])


# graphical output...
from pylab import *
plot(x,y)
plot(x[min_index], y[min_index], "o", label="min")
plot(x[max_index], y[max_index], "o", label="max")
legend()
show()

# Note: The "+1" is important, because "diff" reduces the original index number.
