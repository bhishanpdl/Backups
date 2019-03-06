#!/usr/bin/python
# -*- coding: utf-8 -*-


# clear; python plot.py 

import pylab as pl
import numpy as np

# Create a figure of size 8x6 inches, 80 dots per inch
pl.figure(figsize=(8, 6), dpi=80)

# Create a new subplot from a grid of 1x1
pl.subplot(1, 1, 1)

X = np.linspace(-np.pi, np.pi, 256, endpoint=True)
C, S = np.cos(X), np.sin(X)

# Plot cosine with a red continuous line of width 1 (pixels)
pl.plot(X, C, color="red", linewidth=1.0, linestyle="--")

# Plot sine with a green continuous line of width 1 (pixels)
pl.plot(X, S, color="green", linewidth=1.0, linestyle="-")

# Set x limits
pl.xlim(-4.0, 4.0)

# Set x ticks
pl.xticks(np.linspace(-4, 4, 9, endpoint=True))

# Set y limits
pl.ylim(-1.0, 1.0)

# Set y ticks
pl.yticks(np.linspace(-1, 1, 5, endpoint=True))

# Save figure using 72 dots per inch
#savefig("exercice_2.png", dpi=72)

# Adding a Legend
pl.plot(X, C, color="blue", linewidth=0.5, linestyle="--", label="cosine")
pl.plot(X, S, color="red",  linewidth=2.5, linestyle="-", label="sine")

pl.legend(loc='upper left')



# Setting tick labels
pl.xticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi],
          [r'$-\pi$', r'$-\pi/2$', r'$0$', r'$+\pi/2$', r'$+\pi$'])

pl.yticks([-1, 0, +1],
          [r'$-1$', r'$0$', r'$+1$'])


# Annotatate some points
#Let’s annotate some interesting points using the annotate command. 
#We chose the 2π/3 value and we want to annotate both the sine and the cosine. 
#We’ll first draw a marker on the curve as well as a straight dotted line. 
#Then, we’ll use the annotate command to display some text with an arrow.

t = 2 * np.pi / 3
pl.plot([t, t], [0, np.cos(t)], color='blue', linewidth=2.5, linestyle="--")
pl.scatter([t, ], [np.cos(t), ], 50, color='blue')

pl.annotate(r'$sin(\frac{2\pi}{3})=\frac{\sqrt{3}}{2}$',
            xy=(t, np.sin(t)), xycoords='data',
            xytext=(+10, +30), textcoords='offset points', fontsize=16,
            arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2"))

pl.plot([t, t],[0, np.sin(t)], color='red', linewidth=2.5, linestyle="--")
pl.scatter([t, ],[np.sin(t), ], 50, color='red')

pl.annotate(r'$cos(\frac{2\pi}{3})=-\frac{1}{2}$',
            xy=(t, np.cos(t)), xycoords='data',
            xytext=(-90, -50), textcoords='offset points', fontsize=16,
            arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2"))

pl.show()
# moving spines
#ax = pl.gca()  # gca stands for 'get current axis'
#ax.spines['right'].set_color('none')
#ax.spines['top'].set_color('none')
#ax.xaxis.set_ticks_position('bottom')
#ax.spines['bottom'].set_position(('data',0))
#ax.yaxis.set_ticks_position('left')
#ax.spines['left'].set_position(('data',0))


# Show result on screen
pl.show()


