#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016

# Imports
import matplotlib.pyplot as plt
import numpy as np

# Generate some data...
# Note that all of these are _2D_ arrays, so that we can use meshgrid
# You'll need to "grid" your data to use pcolormesh if it's un-ordered points
theta, r = np.mgrid[0:2*np.pi:20j, 0:1:10j]
z = np.random.random(theta.size).reshape(theta.shape)


fig, (ax1, ax2) = plt.subplots(ncols=2, subplot_kw=dict(projection='polar'))


ax1.scatter(theta.flatten(), r.flatten(), c=z.flatten())
ax1.set_title('Scattered Points')

ax2.pcolormesh(theta, r, z)
ax2.set_title('Cells')

for ax in [ax1, ax2]:
    ax.set_ylim([0, 1])
    ax.set_yticklabels([])

plt.show()
