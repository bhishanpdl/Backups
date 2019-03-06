#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 31, 2016


# Imports
import numpy as np
import matplotlib.pyplot as plt



# data to plot
x = np.arange(0.001, 10.0, 0.1)
y = np.array( (1.0/(x**2)) - 2/(x**3) )

# Set axes limits
plt.ylim(-0.04,0.06)


# Plots
plt.plot(x,y,color='k')

# Add line markers  at maxima 
max_y = max(y)         # Find the maximum y value
max_x = x[y.argmax()]  # Find the x value corresponding to the maximum y value
plt.plot(max_x,max_y,'ko')
#print max_x, max_y

# show the plot
plt.show()
