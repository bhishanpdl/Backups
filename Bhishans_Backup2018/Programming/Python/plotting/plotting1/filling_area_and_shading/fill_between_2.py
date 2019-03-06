#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016
# Ref     : http://www.python-course.eu/matplotlib.php

# Syntax:
# fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)


# Imports
import pylab as plt
import numpy as np

X  = np.linspace(0,3,200)
Y1 = X**2 + 3
Y2 = np.exp(X) + 2
Y3 = np.cos(X)

plt.plot(X,Y1,lw=4)
plt.plot(X,Y2,lw=4)
plt.plot(X,Y3,lw=4)

plt.fill_between(X, Y1,Y2,color='k',alpha=.5)
plt.fill_between(X, Y1,Y3,color='y',alpha=.5)
#plt.fill_between(X, Y2,Y3,color='m',alpha=.5)

plt.show()

# example 2
import matplotlib.pyplot as plt

# define corner points
x = [1,2,1,0]
y = [2,1,0,1]

# plot
plt.fill(x,y)
plt.show()
