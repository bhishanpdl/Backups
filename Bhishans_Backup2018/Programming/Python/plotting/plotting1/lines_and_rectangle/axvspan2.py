#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016


# Imports
import matplotlib.pyplot as plt

fig, ax = plt.subplots()
ax.plot(range(20))
ax.axvspan(8, 14, alpha=0.5, color='red')

plt.show()


# example 2
import matplotlib.pyplot as plt

fig, ax = plt.subplots()
ax.plot(range(20))
ax.axvspan(8, 14, ymin=0.1, ymax=0.9, alpha=0.5, color='red')

plt.show()
