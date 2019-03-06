#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 07, 2016
# Ref     : https://stackoverflow.com/questions/3899980/how-to-change-the-font-size-on-a-matplotlib-plot

# Imports
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager

# Set the font properties (can use more variables for more fonts
# ls /Library/Fonts/*
font_path = '/Library/Fonts/Marion.ttc'
font_prop = font_manager.FontProperties(fname=font_path, size=14)

ax = plt.subplot() # Defines ax variable by creating an empty plot

# Define the data to be plotted
x = np.linspace(0, 10)
y = x + np.random.normal(x)
plt.plot(x, y, 'b+', label='Data points')

for label in (ax.get_xticklabels() + ax.get_yticklabels()):
    label.set_fontproperties(font_prop)
    label.set_fontsize(13) # Size here overrides font_prop

plt.title("Exponentially decaying oscillations", fontproperties=font_prop,
          size=16, verticalalignment='bottom') # Size here overrides font_prop
plt.xlabel("Time", fontproperties=font_prop)
plt.ylabel("Amplitude", fontproperties=font_prop)
plt.text(0, 0, "Misc text", fontproperties=font_prop)

lgd = plt.legend(loc='lower right', prop=font_prop) # NB different 'prop' argument for legend
lgd.set_title("Legend", prop=font_prop)

plt.show()
