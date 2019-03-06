#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016
# Ref     : http://matplotlib.org/1.5.0/users/pyplot_tutorial.html

# Imports
import numpy as np
import matplotlib.pyplot as plt

def f(t):
    return np.exp(-t) * np.cos(2*np.pi*t)

t1 = np.arange(0.0, 5.0, 0.1)
t2 = np.arange(0.0, 5.0, 0.02)

plt.figure(1)
plt.subplot(211)
plt.plot(t1, f(t1), 'bo', t2, f(t2), 'k')

plt.subplot(212)
plt.plot(t2, np.cos(2*np.pi*t2), 'r--')
plt.show()

# The figure() command here is optional because figure(1) will be created by default,
# just as a subplot(111) will be created by default if you don’t manually specify any axes.

# The subplot() command specifies numrows, numcols, fignum where fignum
# ranges from 1 to numrows*numcols.

# The commas in the subplot command are
# optional if numrows*numcols<10. So subplot(211) is identical to subplot(2, 1, 1).

# You can create an arbitrary number of subplots and axes. If you want to place
# an axes manually, i.e., not on a rectangular grid, use the axes() command,
# which allows you to specify the location as axes([left, bottom, width, height])
# where all values are in fractional (0 to 1) coordinates.
# See pylab_examples example code: axes_demo.py for an example of placing axes
# manually and pylab_examples example code: subplots_demo.py for an example
# with lots of subplots.

# You can create multiple figures by using multiple figure() calls with an
# increasing figure number. Of course, each figure can contain as many
# axes and subplots as your heart desires:

# You can clear the current figure with clf() and the current axes with cla().
# If you find it annoying that states (specifically the current image,
# figure and axes) are being maintained for you behind the scenes, don’t despair:
# this is just a thin stateful wrapper around an object oriented API, which
# you can use instead (see Artist tutorial)

If you are making lots of figures, you need to be aware of one more thing: the memory required for a figure is not completely released until the figure is explicitly closed with close(). Deleting all references to the figure, and/or using the window manager to kill the window in which the figure appears on the screen, is not enough, because pyplot maintains internal references until close() is called.
