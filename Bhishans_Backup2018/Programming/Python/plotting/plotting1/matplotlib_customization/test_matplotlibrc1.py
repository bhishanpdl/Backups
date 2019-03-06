#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016

# Imports
import matplotlib.pyplot as plt

# Use convenience functions for modifying rc settings
import matplotlib as mpl
plt.rc('lines', linewidth=2, color='r')

plt.plot(range(10))
plt.show()
