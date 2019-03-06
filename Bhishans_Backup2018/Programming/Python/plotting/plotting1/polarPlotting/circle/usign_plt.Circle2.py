#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016

# Imports
import matplotlib.pyplot as plt


fig = plt.gcf()

circle1=plt.Circle((0,0),2,color='r')

# now make a circle with no fill, which is good for hilighting key results
circle2=plt.Circle((5,5),.5,color='b',fill=False)
circle3=plt.Circle((10,10),2,color='g',clip_on=False)
ax = plt.gca()
ax.cla() # clear things for fresh plot

# change default range so that new circles will work
ax.set_xlim((0,10))
ax.set_ylim((0,10))


# some data
ax.plot(range(11),'o',color='black')

# key data point that we are encircling
ax.plot((5),(5),'o',color='y')

fig.gca().add_artist(circle1)
fig.gca().add_artist(circle2)
fig.gca().add_artist(circle3)

plt.show()

#A Circle is a subclass of an Artist, and an axes has an add_artist method.
