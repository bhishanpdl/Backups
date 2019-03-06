#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 04, 2016
# Ref     : https://scipy-cookbook.readthedocs.org/items/Matplotlib_Multiple_Subplots_with_One_Axis_Label.html

# Imports
import matplotlib.pyplot as plt
import numpy as np
import pylab

figprops = dict(figsize=(8., 8. / 1.618), dpi=128)                                          # Figure properties
adjustprops = dict(left=0.1, bottom=0.1, right=0.97, top=0.93, wspace=0.2, hspace=0.2)       # Subplot properties

fig = pylab.figure(**figprops)                                                              # New figure
fig.subplots_adjust(**adjustprops)                                                          # Tunes the subplot layout

ax = fig.add_subplot(3, 1, 1)
bx = fig.add_subplot(3, 1, 2, sharex=ax, sharey=ax)
cx = fig.add_subplot(3, 1, 3, sharex=ax, sharey=ax)

ax.plot([0,1,2], [2,3,4], 'k-')
bx.plot([0,1,2], [2,3,4], 'k-')
cx.plot([0,1,2], [2,3,4], 'k-')

pylab.setp(ax.get_xticklabels(), visible=False)
pylab.setp(bx.get_xticklabels(), visible=False)

bx.set_ylabel('This is a long label shared among more axes', fontsize=14)
cx.set_xlabel('And a shared x label', fontsize=14)

plt.show()
