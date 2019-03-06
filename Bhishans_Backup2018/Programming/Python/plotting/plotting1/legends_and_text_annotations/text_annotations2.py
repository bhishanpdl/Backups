#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : http://matplotlib.org/users/annotations_intro.html

# Imports
import numpy as np
import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_subplot(111)

t = np.arange(0.0, 5.0, 0.01)
s = np.cos(2*np.pi*t)
line, = ax.plot(t, s, lw=2)

ax.annotate('local max', xy=(2, 1), xytext=(3, 1.5),
            arrowprops=dict(facecolor='black', shrink=0.05),
            )

            

# second text
ax.text(0.1, 0.9,'matplotlib',
     horizontalalignment='center',
     verticalalignment='center',
     transform = ax.transAxes)

     
ax.set_ylim(-2,2)
plt.show()
