#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
import numpy as np
import matplotlib.pyplot as plt

infile = 'bhi.txt'
col1,col2 = np.loadtxt(infile, comments="#", skiprows=0, usecols=(0,1), unpack=True)
plt.plot(col1, col2)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Title')
plt.show()
