#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 07, 2016
# Ref     : https://python4mpia.github.io/plotting/advanced.html

# Imports
import numpy as np
import matplotlib.pyplot as plt

# example 1
fig = plt.figure()
ax1 = fig.add_axes([0.1, 0.1, 0.4, 0.8])
ax2 = fig.add_axes([0.5, 0.1, 0.4, 0.8])

# example 2
fig = plt.figure()
ax1 = fig.add_axes([0.1, 0.1, 0.8, 0.8])
ax2 = fig.add_axes([0.72, 0.72, 0.16, 0.16])

plt.show()
