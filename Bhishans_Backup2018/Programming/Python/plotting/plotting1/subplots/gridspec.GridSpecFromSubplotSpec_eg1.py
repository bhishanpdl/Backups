#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016
# Ref     : http://matplotlib.org/users/gridspec.html

# Note:
#ax = plt.subplot2grid((2,2),(0, 0))

#is identical to

#ax = plt.subplot(2,2,1)
#ax = plt.subplot(221)

Note that, unlike matplotlib’s subplot, the index starts from 0 in gridspec.

# Imports
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

def make_ticklabels_invisible(fig):
    for i, ax in enumerate(fig.axes):
        ax.text(0.5, 0.5, "ax%d" % (i+1), va="center", ha="center")
        for tl in ax.get_xticklabels() + ax.get_yticklabels():
            tl.set_visible(False)



# gridspec inside gridspec

f = plt.figure()

gs0 = gridspec.GridSpec(1, 2)

gs00 = gridspec.GridSpecFromSubplotSpec(3, 3, subplot_spec=gs0[0])

ax1 = plt.Subplot(f, gs00[:-1, :])
f.add_subplot(ax1)
ax2 = plt.Subplot(f, gs00[-1, :-1])
f.add_subplot(ax2)
ax3 = plt.Subplot(f, gs00[-1, -1])
f.add_subplot(ax3)


gs01 = gridspec.GridSpecFromSubplotSpec(3, 3, subplot_spec=gs0[1])

ax4 = plt.Subplot(f, gs01[:, :-1])
f.add_subplot(ax4)
ax5 = plt.Subplot(f, gs01[:-1, -1])
f.add_subplot(ax5)
ax6 = plt.Subplot(f, gs01[-1, -1])
f.add_subplot(ax6)

plt.suptitle("GirdSpec Inside GridSpec")
make_ticklabels_invisible(plt.gcf())

plt.show()

