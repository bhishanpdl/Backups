#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    :Apr 4, 2016
# Ref     : http://matplotlib.org/api/pyplot_api.html#matplotlib.pyplot.subplots_adjust

# Imports
import numpy as np
import matplotlib.pyplot as plt
import math

x = np.linspace(0, 2*np.pi, 400)
y = np.sin(x**2)

# Just a figure and one subplot
f, ax = plt.subplots()
ax.plot(x, y)
ax.set_title('Simple plot')

# Two subplots, unpack the output array immediately
f, (ax1, ax2) = plt.subplots(1, 2, sharey=True)
ax1.plot(x, y)
ax1.set_title('Sharing Y axis')
ax2.scatter(x, y)

# Four polar axes
plt.subplots(2, 2, subplot_kw=dict(polar=True))

# Share a X axis with each column of subplots
plt.subplots(2, 2, sharex='col')

# Share a Y axis with each row of subplots
plt.subplots(2, 2, sharey='row')

# Share a X and Y axis with all subplots
plt.subplots(2, 2, sharex='all', sharey='all')
# same as
plt.subplots(2, 2, sharex=True, sharey=True)

# Set margins around the figure
plt.subplots_adjust(left = 0.125,right = 0.9, bottom = 0.1, top = 0.9,
                wspace = 0.2, hspace = 0.2)

plt.show()



# matplotlib.pyplot.subplots_adjust(*args, **kwargs)

    #Tune the subplot layout.

    #call signature:

    #subplots_adjust(left=None, bottom=None, right=None, top=None,
                    #wspace=None, hspace=None)

    #The parameter meanings (and suggested defaults) are:

    #left  = 0.125  # the left side of the subplots of the figure
    #right = 0.9    # the right side of the subplots of the figure
    #bottom = 0.1   # the bottom of the subplots of the figure
    #top = 0.9      # the top of the subplots of the figure
    #wspace = 0.2   # the amount of width reserved for blank space between subplots
    #hspace = 0.2   # the amount of height reserved for white space between subplots

    #The actual defaults are controlled by the rc file
