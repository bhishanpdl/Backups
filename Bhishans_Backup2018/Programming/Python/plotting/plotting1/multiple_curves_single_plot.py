#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 04, 2016

# Imports
import numpy as np
import matplotlib.pyplot as plt

# data
x = np.linspace(0.0,10,num=100,endpoint=True)
a = np.cos(x)
b = np.sin(x)
c = np.exp(x/10)
d = np.exp(-x/10)

# plot
plt.plot(x,a,'b-',label='cosine')
plt.plot(x,b,'r--',label='sine')
plt.plot(x,c,'gx',label='exp(+x)')
plt.plot(x,d,'y-', linewidth = 5,label='exp(-x)')

plt.legend(loc='upper left')
plt.xlabel('xaxis')
plt.ylabel('yaxis')

plt.show()
