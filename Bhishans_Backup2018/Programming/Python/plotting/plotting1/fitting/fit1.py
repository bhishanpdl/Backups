# Bhishan Poudel
# Dec 3, 2015 Thu

# clear; python fit1.py; rm *~

import numpy as np
import matplotlib.pyplot as plt

points = np.array([(1, 1), (2, 4), (3, 1), (9, 3)])
# get x and y vectors
x = points[:,0]
y = points[:,1]

# calculate polynomial
z = np.polyfit(x, y, 3)
f = np.poly1d(z)

# calculate new x's and y's
x_new = np.linspace(x[0], x[-1], 50)
y_new = f(x_new)

plt.plot(x,y,'o', x_new, y_new)
plt.xlim([x[0]-1, x[-1] + 1 ])
plt.show()

#I suggest you to start with simple polynomial fit, scipy.optimize.curve_fit 
#tries to fit a function f that you must know to a set of points.

#This is a simple 3 degree polynomial fit using numpy.polyfit and poly1d, 
#the first performs a least squares polynomial fit and the second calculates the new points:


