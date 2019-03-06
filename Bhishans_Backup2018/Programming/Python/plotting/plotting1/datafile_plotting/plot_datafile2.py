#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
from matplotlib import pyplot as plt
import numpy as np


x,y = np.loadtxt('test.csv',
                 unpack=True,
                 delimiter = ',')

plt.plot(x,y)

plt.title('Title')
plt.ylabel('Y axis')
plt.xlabel('X axis')

plt.show()
