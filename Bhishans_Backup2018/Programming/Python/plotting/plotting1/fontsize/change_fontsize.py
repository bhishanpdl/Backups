#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 07, 2016
# Ref     : https://stackoverflow.com/questions/12444716/how-do-i-set-figure-title-and-axes-labels-font-size-in-matplotlib

# Imports
from matplotlib import pyplot as plt    

fig = plt.figure()

data = range(10)
plt.plot(data)
fig.suptitle('test title', fontsize=20)
plt.xlabel('xlabel', fontsize=8)
plt.ylabel('ylabel', fontsize=16)


# method 2
# xx-small, x-small, small, medium, large, x-large, xx-large, smaller, larger.
#plt.rcParams.update({'axes.titlesize': 'x-large'})


plt.show()
