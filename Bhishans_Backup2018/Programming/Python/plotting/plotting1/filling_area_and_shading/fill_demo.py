#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016
# Ref     : http://matplotlib.org/api/pyplot_api.html#matplotlib.pyplot.fill

# Imports
import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 1)
y = np.sin(4 * np.pi * x) * np.exp(-5 * x)

plt.fill(x, y, 'grey')
plt.grid(True)
plt.show()
