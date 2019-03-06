#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 07, 2016
# Ref     : https://stackoverflow.com/questions/3899980/how-to-change-the-font-size-on-a-matplotlib-plot

# Imports
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager

# Set the font dictionaries (for plot title and axis titles)
title_font = {'fontname':'Arial', 'size':'16', 'color':'black', 'weight':'normal',
              'verticalalignment':'bottom'} # Bottom vertical alignment for more space
axis_font = {'fontname':'Arial', 'size':'14'}

# Set the font properties (for use in legend)   
font_path = 'Library/Fonts/'
font_prop = font_manager.FontProperties(fname=font_path, size=14)

ax = plt.subplot() # Defines ax variable by creating an empty plot

# Set the tick labels font
for label in (ax.get_xticklabels() + ax.get_yticklabels()):
    label.set_fontname('Arial')
    label.set_fontsize(13)

x = np.linspace(0, 10)
y = x + np.random.normal(x) # Just simulates some data

plt.plot(x, y, 'b+', label='Data points')
plt.xlabel("x axis", **axis_font)
plt.ylabel("y axis", **axis_font)
plt.title("Misc graph", **title_font)
plt.legend(loc='lower right', prop=font_prop, numpoints=1)
plt.text(0, 0, "Misc text", **title_font)
plt.show()
