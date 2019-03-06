#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016
# Ref     : http://stackoverflow.com/questions/12998430/remove-xticks-in-a-matplot-lib-plot

# Imports
from matplotlib import pyplot as plt

# data to plot
plt.plot(range(10))

# tick parameters
plt.tick_params(
    axis='x',          # changes apply to the x-axis
    which='both',      # both major and minor ticks are affected
    bottom='off',      # ticks along the bottom edge are off
    top='off',         # ticks along the top edge are off
    labelbottom='off') # labels along the bottom edge are off

plt.show()
#plt.savefig('plot')
plt.clf()
