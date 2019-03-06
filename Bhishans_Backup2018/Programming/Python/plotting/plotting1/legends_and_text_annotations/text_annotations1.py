#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : http://matplotlib.org/users/text_intro.html

# Imports
import matplotlib.pyplot as plt

fig = plt.figure()
fig.suptitle('bold figure suptitle', fontsize=14, fontweight='bold')

ax = fig.add_subplot(111)
fig.subplots_adjust(top=0.85)
ax.set_title('axes title')

ax.set_xlabel('xlabel')
ax.set_ylabel('ylabel')

ax.text(3, 8, 'boxed italics text in data coords', style='italic',
        bbox={'facecolor':'red', 'alpha':0.5, 'pad':10})

ax.text(2, 6, r'an equation: $E=mc^2$', fontsize=15)

ax.text(3, 2, u'unicode: Institut f\374r Festk\366rperphysik')

ax.text(0.95, 0.01, 'colored text in axes coords',
        verticalalignment='bottom', horizontalalignment='right',
        transform=ax.transAxes,
        color='green', fontsize=15)


ax.plot([2], [1], 'o')
ax.annotate('annotate', xy=(2, 1), xytext=(3, 4),
            arrowprops=dict(facecolor='black', shrink=0.05))

ax.axis([0, 10, 0, 10])

plt.show()


##=============================================================================
#Basic text commands

#The following commands are used to create text in the pyplot interface

    #text() - add text at an arbitrary location to the Axes; matplotlib.axes.Axes.text() in the API.

    #xlabel() - add an axis label to the x-axis; matplotlib.axes.Axes.set_xlabel() in the API.

    #ylabel() - add an axis label to the y-axis; matplotlib.axes.Axes.set_ylabel() in the API.

    #title() - add a title to the Axes; matplotlib.axes.Axes.set_title() in the API.

    #figtext() - add text at an arbitrary location to the Figure; matplotlib.figure.Figure.text() in the API.

    #suptitle() - add a title to the Figure; matplotlib.figure.Figure.suptitle() in the API.

    #annotate() - add an annotation
