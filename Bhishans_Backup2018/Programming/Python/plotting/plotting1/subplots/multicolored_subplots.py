#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author    : Bhishan Poudel
# Date      : Jul 08, 2016
 

# Imports
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm

x = np.arange(10)
ys = [i+x+(i*x)**2 for i in range(10)]

# example
colors = cm.rainbow(np.linspace(0, 1, len(ys)))

# example
number = len(ys)
cmap = plt.get_cmap('gnuplot')
colors = [cmap(i) for i in np.linspace(0, 1, number)]

for y, c in zip(ys, colors):
    plt.scatter(x, y, color=c)


plt.show()
