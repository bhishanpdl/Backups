#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016
# Topic   : OverflowError: Allocated too many blocks
# Note    : python --version ==> Python 2.7.10
# Note    : lsb_release -a   ==> ubuntu 15.10

# Imports
import numpy as np
import matplotlib.pyplot as plt


# Attempt to resolve OverflowError
plt.rcParams['agg.path.chunksize'] = 100000

# subplots
fig, ax = plt.subplots()

# plot values
x = np.arange(0.001, 25.0, 0.01)
A = 4.3
y = np.array( (-1.0/x) + (0.5*A*A/(x**2)) - (A*A/(x**3)) )

# Plots
plt.plot(x,y,color='k')

# Set axes limits
plt.ylim(-0.04,0.06)

# Attempt to resolve OverflowError
plt.rcParams['backend'] = 'TkAgg'  # or, 'qt4agg'
plt.rcParams['agg.path.chunksize'] = 100000
# This did not worked!




# Fill the color
plt.fill_between(x, -0.04, y, color='darkgray', alpha=.5)

# Show the plot
plt.show()
