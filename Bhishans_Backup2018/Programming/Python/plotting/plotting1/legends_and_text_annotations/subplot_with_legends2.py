#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016


# Imports
import numpy as np
import matplotlib.pylab as plt
from mpl_toolkits.axes_grid1 import host_subplot

# Sent for figure
plt.font = {'size'   : 12}

# Setup figure and subplots
plt.f0 = plt.figure(num = 0, figsize = (12, 8))#, dpi = 300)
plt.f0.suptitle("Oscillation decay", fontsize=14)
plt.ax01 = plt.subplot2grid((2, 2), (0, 0))
plt.ax02 = plt.subplot2grid((2, 2), (0, 1))
plt.ax03 = plt.subplot2grid((2, 2), (1, 0), colspan=2, rowspan=1)
plt.ax04 = plt.ax03.twinx()
#tight_layout()

# Set titles of subplots
plt.ax01.set_title('Position vs Time')
plt.ax02.set_title('Velocity vs Time')
plt.ax03.set_title('Position and Velocity vs Time')

# set y-limits
plt.ax01.set_ylim(0,2)
plt.ax02.set_ylim(-6,6)
plt.ax03.set_ylim(-0,5)
plt.ax04.set_ylim(-10,10)

# sex x-limits
plt.ax01.set_xlim(0,5.0)
plt.ax02.set_xlim(0,5.0)
plt.ax03.set_xlim(0,5.0)
plt.ax04.set_xlim(0,5.0)

# Turn on grids
plt.ax01.grid(True)
plt.ax02.grid(True)
plt.ax03.grid(True)

# set label names
plt.ax01.set_xlabel("x")
plt.ax01.set_ylabel("py")
plt.ax02.set_xlabel("t")
plt.ax02.set_ylabel("vy")
plt.ax03.set_xlabel("t")
plt.ax03.set_ylabel("py")
plt.ax04.set_ylabel("vy")


# Data Placeholders
yp1 = np.zeros(0)
yv1 = np.zeros(0)
yp2 = np.zeros(0)
yv2 = np.zeros(0)
t = np.zeros(0)

# set plots
p011, = plt.ax01.plot(t,yp1,'b-', label="yp1")
p012, = plt.ax01.plot(t,yp2,'g-', label="yp2")

p021, = plt.ax02.plot(t,yv1,'b-', label="yv1")
p022, = plt.ax02.plot(t,yv2,'g-', label="yv2")

p031, = plt.ax03.plot(t,yp1,'b-', label="yp1")
p032, = plt.ax04.plot(t,yv1,'g-', label="yv1")

# set lagends
plt.ax01.legend([p011,p012], [p011.get_label(),p012.get_label()])
plt.ax02.legend([p021,p022], [p021.get_label(),p022.get_label()])
plt.ax03.legend([p031,p032], [p031.get_label(),p032.get_label()])

# Data Update
xmin = 0.0
xmax = 5.0

t  = np.arange(xmin, xmax, 0.01)
yp1  = 1 + np.exp(-t) * np.sin(2 * np.pi * t)
yv1 = - np.exp(-t) * np.sin(2 * np.pi * t) + np.exp(-t) * np.cos(2 * np.pi * t) * 2 * np.pi
yp2 = 0.5 * yp1
yv2 = 0.5 * yv1

# Plot Update
plt.figure(0)
plt.p011.set_data(t,yp1)
plt.p012.set_data(t,yp2)

plt.p021.set_data(t,yv1)
plt.p022.set_data(t,yv2)

plt.p031.set_data(t,yp1)
plt.p032.set_data(t,yv1)

#savefig("test.png")
plt.show()
