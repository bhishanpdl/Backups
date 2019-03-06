#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016


# Imports
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0, 7, 0.01)

plt.subplot(2, 1, 1)
plt.plot(x, np.sin(x))

plt.subplot(2, 2, 3)
plt.plot(x, np.cos(x))

plt.subplot(2, 2, 4)
plt.plot(x, np.sin(x) * np.cos(x))

plt.show()
