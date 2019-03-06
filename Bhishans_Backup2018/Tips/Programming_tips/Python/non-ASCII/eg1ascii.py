#!/usr/bin/env python

# Bhishan Poudel
# Nov 28, 2015 Sat

# clear; python eg1.py; rm *~


## ’fakedata.txt’ into a 2-D array called data (this line has Non-Ascii character)
# save as this document using encoding utf-8, the problem will be solved

import numpy as np
import pylab as pl
# Use numpy to load the data contained in the file

data = np.loadtxt('test.txt')
# plot the first column as x, and second column as y
pl.plot(data[:,0], data[:,1], 'ro')
pl.xlabel('x')
pl.ylabel('y')
pl.xlim(0.0, 10.)
pl.show()


