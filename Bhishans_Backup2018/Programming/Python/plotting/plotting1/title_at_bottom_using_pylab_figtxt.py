#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016


# Imports
#from pylab import *

#figure()
#gca().set_position((.1, .3, .8, .6)) # to make a bit of room for extra text
#plot([1,2], [3,4])
#figtext(.95, .9, "This is text on the side of the figure", rotation='vertical')
#figtext(.02, .02, "This is text on the bottom of the figure.\nHere I've made extra room for adding more text.\n" + ("blah "*16+"\n")*3)
#xlabel("an interesting axis label")
#show()

import pylab as pl

pl.figure()
pl.gca().set_position((.1, .3, .8, .6)) # to make a bit of room for extra text
pl.plot([1,2], [3,4])
pl.figtext(.95, .9, "This is text on the side of the figure", rotation='vertical')
pl.figtext(.02, .02, "This is text on the bottom of the figure.\nHere I've made extra room for adding more text.\n" + ("blah "*16+"\n")*3)
pl.xlabel("an interesting axis label")
pl.show()
