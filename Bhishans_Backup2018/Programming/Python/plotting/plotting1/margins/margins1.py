#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016


# Imports
import matplotlib
from matplotlib import pyplot as plt
from textwrap import wrap
import pylab

data = range(5)

fig = plt.figure()
ax = fig.add_subplot(111)

ax.plot(data, data)
plot_margin = 0.25

x0, x1, y0, y1 = plt.axis()
plt.axis((x0 - plot_margin,
          x1 + plot_margin,
          y0 - plot_margin,
          y1 + plot_margin))

plt.show()
