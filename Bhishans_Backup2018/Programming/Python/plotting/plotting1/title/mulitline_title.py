#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016


# Imports
import matplotlib
from matplotlib import pyplot as plt
from textwrap import wrap
import pylab

data = range(5)

fig = plt.figure()
ax = fig.add_subplot(111)

ax.plot(data, data)

text = "Some really really long long long title I really really need \
        - and just can't - just can't - make it any - simply any - shorter - at all."
title = ax.set_title("\n".join(wrap(text, 60)))

fig.tight_layout()
title.set_y(1.05)
fig.subplots_adjust(top=0.8)

# add the margin
pylab.gca().set_position((.2, .4, .6, .4)) # [left, bottom, width, height] where each value is between 0 and 1
#plt.ylabel(  r"My long label with unescaped {\LaTeX} $\Sigma_{C}$ math"    "\n"     r"continues here with $\pi$"   )

plt.ylabel(r"My long label with $\Sigma_{C}$ math" + "\n" + "continues here")
plt.show()

## example 2
#import matplotlib.pylab as plt

#fig = plt.figure()#num=0,figsize=(8.27, 11.69), dpi=300)
#ax  = fig.add_subplot(2, 2, 1)
#ax.set_title('Normalized occupied \n Neighbors')

#plt.show()
