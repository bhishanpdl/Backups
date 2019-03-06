#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016


# Imports
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 20, 500)
y = np.cos(3*x) - 2*np.cos(5*x) + 0.5*np.cos(6*x)

a = 5
b = 15

plt.axvspan(a, b, color='y', alpha=0.5, lw=0)
plt.plot(x, y)
#plt.savefig('shade.png', dpi=300)
plt.show()
