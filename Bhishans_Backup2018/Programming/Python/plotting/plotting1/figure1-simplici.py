#!/usr/bin python
# -*- coding: utf-8 -*-

# Bhishan Poudel
# Feb 14, 2016

# Imports
import numpy as np
import matplotlib.pyplot as plt

# data
x = np.arange(0,1,0.05)
y = np.power(x, 2)

# plot
fig = plt.figure()
ax = fig.gca()
ax.set_xticks(np.arange(0,1,0.1))
ax.set_yticks(np.arange(0,1.,0.1))
plt.scatter(x,y,label='scatterplot')
plt.xlabel('x')
plt.ylabel('y')
plt.title('simple plot')
plt.legend(loc='upper right')
plt.grid()
plt.show()
