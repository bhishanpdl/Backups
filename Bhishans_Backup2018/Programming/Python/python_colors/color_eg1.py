#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Thu Feb 23, 2017
# Last update :
# Ref         :http://seaborn.pydata.org/tutorial/color_palettes.html

# Imports
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

colors = sns.husl_palette(8)  # circular
colors = sns.cubehelix_palette(8)  # sequential, my best
colors = sns.cubehelix_palette(8, start=2.0, reverse=True)

# colors = sns.color_palette("hls", 8)
# colors = sns.color_palette("Blues", 8)
# colors = sns.color_palette("Greens", 8)
# colors = sns.color_palette("Reds", 8)
# colors = sns.color_palette("Purples", 8)
# colors = sns.color_palette("BuGn_r", 8)
# colors = sns.color_palette("GnBu_d", 8)
# colors = sns.color_palette("cubehelix", 8)

# colors = sns.light_palette("navy", 8, reverse=True)
# colors = sns.dark_palette("palegreen", 8, reverse=False)

for i in range(8):
    plt.plot([0, 1], [0, i], color=colors[i], lw=3)


plt.show()
