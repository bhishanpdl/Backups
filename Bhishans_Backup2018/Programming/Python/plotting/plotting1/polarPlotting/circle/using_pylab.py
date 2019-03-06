#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016

# Imports
import pylab #Imports matplotlib and a host of other useful modules
cir1 = pylab.Circle((0,0), radius=0.75,  fc='y') #Creates a patch that looks like a circle (fc= face color)
cir2 = pylab.Circle((.5,.5), radius=0.25, alpha =.2, fc='b') #Repeat (alpha=.2 means make it very translucent)
ax = pylab.axes(aspect=1) #Creates empty axes (aspect=1 means scale things so that circles look like circles)
ax.add_patch(cir1) #Grab the current axes, add the patch to it
ax.add_patch(cir2) #Repeat
pylab.show()

# example 2
import pylab

pylab.axes()
cir = pylab.Circle((0,0), radius=0.75,  fc='y')
pylab.gca().add_patch(cir)
cir = pylab.Circle((.5,.5), radius=0.25, alpha =.2, fc='b')
pylab.gca().add_patch(cir)
pylab.axis('scaled')
pylab.savefig("circle.png")
pylab.show()
