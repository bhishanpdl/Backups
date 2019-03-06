#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016


# Syntax:
# fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)


# Imports
from matplotlib import pyplot as pl
import numpy as np

x = np.linspace(0, 30, 30)
y = np.sin(x/6*np.pi)
error = np.random.normal(0.1, 0.02, size=y.shape)
y += np.random.normal(0, 0.1, size=y.shape)

pl.plot(x, y, 'k-')
pl.fill_between(x, y-error, y+error)
pl.show()
