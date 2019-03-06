#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : https://stackoverflow.com/questions/11244514/modify-tick-label-text

# Imports
import pylab as plt

# data to plot
x = [0,1,2,3]
y = [90,40,65,150]


# labels
#lxabels = ['high', 'low', 37337,5]
xlabels_empty = ['']

# plot
plt.plot(x,y, 'k')

# Add or remove labels
#plt.xticks(x, xlabels, rotation='vertical')
plt.xticks(x, xlabels_empty)


# show the plot
plt.show()


