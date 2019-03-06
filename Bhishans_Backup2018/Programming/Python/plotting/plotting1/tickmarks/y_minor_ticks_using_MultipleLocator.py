#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016

# Imports
import numpy as np
from matplotlib import pyplot as plt
from matplotlib.ticker import MultipleLocator

a = np.arange(100)
ml = MultipleLocator(5)

plt.plot(a)

plt.axes().yaxis.set_minor_locator(ml)

plt.show()
