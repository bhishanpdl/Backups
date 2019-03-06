#!/usr/bin/env python

# Bhishan Poudel
# Jan 18, 2016
# clear; python polarplot1.py  ; rm *~

# ref: http://stackoverflow.com/questions/23205990/graph-for-a-polar-equation-is-incomplete-in-matplotlib


import numpy as np
import matplotlib.pyplot as plt
from math import sin, pi

def plot_polar(f, start=0, end=2*pi):
    theta = np.linspace(start, end, 1000)
    r = map(f, theta)
    ax = plt.subplot(111, polar=True)
    ax.plot(theta, r)
    ax.grid(True)
    plt.show()
    
plot_polar(lambda theta: 4 * sin(2 * theta))

#r = map(f, theta)
#to be
#r = map(abs(f), theta)
