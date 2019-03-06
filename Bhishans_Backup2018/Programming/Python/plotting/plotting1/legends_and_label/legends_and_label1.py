#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 08, 2016
# Ref     : https://stackoverflow.com/questions/12732614/python-plot-legend-markers-appear-twice


# Imports
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np


# remove legend line and marker
#mpl.rcParams['legend.markerscale']   = 0 # removes line and triangle
mpl.rcParams['legend.handlelength']  = 0  # removes dotted line in legends

# data to plot
x1 = y1 = np.linspace(0, 10, 100)
x2 = np.sin(x1)
y2 = np.cos(y1)

# plot
plt.plot(x1,x2,'g--^', label='regional')
plt.plot(y1,y2,'b-o', label='local')
plt.legend(loc='best', numpoints=1)
plt.show()
