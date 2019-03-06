#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 4, 2016
# Ref     : http://matplotlib.org/examples/pylab_examples/subplots_adjust.html

# Imports
import matplotlib.pyplot as plt
import numpy as np

plt.subplot(211)
plt.imshow(np.random.random((100, 100)), cmap=plt.cm.BuPu_r)
plt.subplot(212)
plt.imshow(np.random.random((100, 100)), cmap=plt.cm.BuPu_r)

plt.subplots_adjust(bottom=0.1, right=0.8, top=0.9)
cax = plt.axes([0.85, 0.1, 0.075, 0.8])
plt.colorbar(cax=cax)

#plt.tight_layout()   # alternative
plt.show()



# matplotlib.pyplot.subplots_adjust(*args, **kwargs)

    #Tune the subplot layout.

    #call signature:

    #subplots_adjust(left=None, bottom=None, right=None, top=None,
                    #wspace=None, hspace=None)

    #The parameter meanings (and suggested defaults) are:

    #left  = 0.125  # the left side of the subplots of the figure
    #right = 0.9    # the right side of the subplots of the figure
    #bottom = 0.1   # the bottom of the subplots of the figure
    #top = 0.9      # the top of the subplots of the figure
    #wspace = 0.2   # the amount of width reserved for blank space between subplots
    #hspace = 0.2   # the amount of height reserved for white space between subplots

    #The actual defaults are controlled by the rc file
