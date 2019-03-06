#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016
# Ref     : http://www.python-course.eu/matplotlib.php

# Syntax:
# fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)


# Imports
import numpy as np
import matplotlib.pyplot as plt
n = 256
X = np.linspace(-np.pi,np.pi,n,endpoint=True)
Y = np.sin(2*X)
plt.plot (X, Y, color='blue', alpha=1.00)
plt.fill_between(X, 0, Y, color='blue', alpha=.1)
plt.show()

# Example 2
import numpy as np
import matplotlib.pyplot as plt
n = 256
X = np.linspace(-np.pi,np.pi,n,endpoint=True)
Y = np.sin(2*X)
plt.plot (X, Y, color='blue', alpha=1.00)
plt.fill_between(X, Y, 1, color='blue', alpha=.1)
plt.show()



#The general syntax of fill_between:

#fill_between(x, y1, y2=0, where=None, interpolate=False, **kwargs)

#The parameters of fill_between:
#Parameter 	Meaning
#x 	An N-length array of the x data
#y1 	An N-length array (or scalar) of the y data
#y2 	An N-length array (or scalar) of the y data
#where 	If None, default to fill between everywhere.
#If not None, it is an N-length numpy boolean array
#and the fill will only happen over the regions where where==True.
#interpolate 	If True, interpolate between the two
#lines to find the precise point of intersection. Otherwise,
#the start and end points of the filled region will only occur
#on explicit values in the x array.
#kwargs 	Keyword args passed on to the PolyCollection
