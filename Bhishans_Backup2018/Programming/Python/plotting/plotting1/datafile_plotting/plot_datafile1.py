#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : May 02, 2016


# Imports
import matplotlib.pyplot as plt

plt.plotfile('test.dat', delimiter=' ', cols=(2,4), 
              names=('col1','col2','col3','col4','col5'), marker='o')
plt.show()
