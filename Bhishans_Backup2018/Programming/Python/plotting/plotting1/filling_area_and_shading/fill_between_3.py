#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016


# Syntax:
# fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)


# Imports
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec


gs = gridspec.GridSpec(3, 3)
ax1 = plt.subplot(gs[0, :])


y=np.random.uniform(0,1,30)
x=np.arange(30)

ax1.set_ylabel('Plot 1')
ax1.plot(x,y)
ax1.fill_between(x,y,0.5,where=y>0.5,interpolate=True)


plt.show()
