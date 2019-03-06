#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : https://stackoverflow.com/questions/24988448/how-to-draw-vertical-lines-on-a-given-plot-in-matplotlib

# Imports
import matplotlib.pyplot as plt


# method 1
# vertical lines (black solid)
plt.axvline(x=0.2, color='k', linestyle='-')
plt.axvline(x=0.8, color='k', linestyle='-')

# horizontal lines (red dashed)
plt.axhline(y=0.42,color='r',linestyle='--')
plt.axhline(y=0.62,color='r',linestyle='--')


##=============================================================================
# method 2
# vertical lines (black solid)
xposition = [0.22,0.90]
for xc in xposition:
    plt.axvline(x=xc, color='k', linestyle='-')

# horizontal lines (red dashed)
yposition = [0.4,0.6]
for yc in yposition:
    plt.axhline(y=yc, color='r', linestyle='--')
##=============================================================================

plt.show()

