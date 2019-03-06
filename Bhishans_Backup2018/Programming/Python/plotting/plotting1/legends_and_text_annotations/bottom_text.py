#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016

# Imports
from matplotlib import pyplot as plt
import numpy as np

x = np.arange(0,3,.25)
y = np.sin(x)
txt = '''
    Fig. Lorem ipsum dolor sit amet, consectetur adipisicing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
    reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
    culpa qui officia deserunt mollit anim id est laborum.'''

fig = plt.figure()

ax1 = fig.add_axes((.1,.4,.8,.5))

ax1.bar(x,y,.2)

fig.text(.1,.1,txt)

plt.show()
