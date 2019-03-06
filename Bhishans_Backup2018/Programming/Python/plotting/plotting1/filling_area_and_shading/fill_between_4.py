#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016


# Syntax:
# fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)


# Imports
import numpy as np
import matplotlib.pyplot as plt

y = [0,0,0,0,0,0,0,0,0,0,0,863,969,978,957,764,767,1009,1895,980,791]
x = np.arange(len(y))

fig, (ax1) = plt.subplots(1,1); 
ax1.fill_between(x, 0, y)
plt.show()

# example 2
import numpy as np
import matplotlib.pyplot as plt

y = [0,0,0,0,0,0,0,0,0,0,0,863,969,978,957,764,767,1009,1895,980,791,0]
x = np.arange(len(y))


fig2, ax2 = plt.subplots()
ax2.fill(x, y)

plt.show()
