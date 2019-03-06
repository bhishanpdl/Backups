#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : Mar 24, 2016

# Imports
import matplotlib.pyplot as plt
import numpy as np


# data
x = np.arange(0,10,1)
y = np.exp(x)

# subplots
fig, ax = plt.subplots()
plt.plot(x,y,color='k',linestyle="--")

# title and axes labels
plt.title('title')
plt.xlabel('xlabel', fontsize=10)
plt.ylabel('ylabel', fontsize=10)

# axes limit
plt.xlim(0,6)
plt.ylim(0,1000)

# text marker
txt = r'$\mu=100,\  \sigma=15$'
plt.text(4, 500, txt)

# major ticks
plt.xticks(np.arange(min(x), max(x)+1, 2))
plt.yticks(np.arange(0, 1000+0.001, 200))

# minor ticks
x_minor_ticks = np.arange(min(x), max(x)+1, 1 )
y_minor_ticks = np.arange(0, 1000+0.001, 100)
ax.set_xticks(x_minor_ticks, minor=True)
ax.set_yticks(y_minor_ticks, minor=True)


# grid
plt.grid(False)

# save and show plot
#plt.savefig("fig1.png",dpi = 200, height = 14, width = 14)
plt.show()
