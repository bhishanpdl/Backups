#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016


# Imports
from matplotlib import pyplot as plt
import numpy as np

x=np.linspace(-np.pi, np.pi, 100)

y1=np.sin(x)
y2=np.cos(x)
y3=y1*y2

plt.subplot(221)      # sinx=221   cosx=222
plt.plot(x, y1)       #   sinx*cosx=212
plt.title('sin(x)')

plt.subplot(222)
plt.plot(x, y2)
plt.title('cos(x)')

plt.subplot(212)
plt.plot(x, y3)
plt.title('sin(x)*cos(x)')

plt.show()


# method 2            # sinx*cosx=121    sinx=222
plt.subplot(222)      #                  cosx=224
plt.plot(x, y1)
plt.title('sin(x)')

plt.subplot(224)
plt.plot(x, y2)
plt.title('cos(x)')

plt.subplot(121)
plt.plot(x, y3)
plt.title('sin(x)*cos(x)')

plt.show()
