#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016
# Ref     : http://stackoverflow.com/questions/4325733/save-a-subplot-in-matplotlib

# Imports
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

# Make an example plot with two subplots...
fig = plt.figure()
ax1 = fig.add_subplot(2,1,1)
ax1.plot(range(10), 'b-')

ax2 = fig.add_subplot(2,1,2)
ax2.plot(range(20), 'r^')

# Save the full figure...
fig.savefig('full_figure.png')

# Save just the portion _inside_ the second axis's boundaries
extent = ax2.get_window_extent().transformed(fig.dpi_scale_trans.inverted())
fig.savefig('ax2_figure.png', bbox_inches=extent)

# Pad the saved area by 10% in the x-direction and 20% in the y-direction
fig.savefig('ax2_figure_expanded.png', bbox_inches=extent.expanded(1.1, 1.2))
