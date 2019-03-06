#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : https://stackoverflow.com/questions/16122362/python-matplotlib-how-to-put-text-in-the-corner-of-equal-aspect-figure
# Note    : annotate is better than text

# Imports
import matplotlib.pyplot as plt

fig, axes = plt.subplots(nrows=2, subplot_kw=dict(aspect=1))

axes[0].plot(range(1, 4))
axes[1].plot(range(10, 40, 10), range(1, 4))

for ax in axes:
    ax.annotate('Test', xy=(1, 0), xycoords='axes fraction', fontsize=16,
                horizontalalignment='right', verticalalignment='bottom')
plt.show()


# offset form corner
import matplotlib.pyplot as plt

fig, axes = plt.subplots(nrows=2, subplot_kw=dict(aspect=1))

axes[0].plot(range(1, 4))
axes[1].plot(range(10, 40, 10), range(1, 4))

for ax in axes:
    ax.annotate('Test', xy=(1, 0), xycoords='axes fraction', fontsize=16,
                xytext=(-5, 5), textcoords='offset points',
                ha='right', va='bottom')
plt.show()

# outside the figure
import matplotlib.pyplot as plt

fig, axes = plt.subplots(nrows=2, subplot_kw=dict(aspect=1))

axes[0].plot(range(1, 4))
axes[1].plot(range(10, 40, 10), range(1, 4))

for ax in axes:
    ax.annotate('Test', xy=(1, 0), xycoords='axes fraction', fontsize=16,
                xytext=(0, -15), textcoords='offset points',
                ha='right', va='top')
plt.show()
