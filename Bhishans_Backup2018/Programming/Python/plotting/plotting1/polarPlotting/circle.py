#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016
# Ref     : http://matthiaseisen.com/matplotlib/shapes/circle/



import matplotlib.pyplot as plt
import matplotlib.patches as patches

##=============================================================================
# 1   Hello Circle

fig1 = plt.figure()
ax1 = fig1.add_subplot(111, aspect='equal')
ax1.add_patch(
    patches.Circle(
        (0.5, 0.5),   # (x,y)
        0.2,          # radius
    )
)

#fig1.savefig('circle1.png', dpi=90, bbox_inches='tight')
plt.show()


##=============================================================================
# 2   Remove Background

fig2 = plt.figure()
ax2 = fig2.add_subplot(111, aspect='equal')
ax2.add_patch(
    patches.Circle(
        (0.5, 0.5),
        0.2,
        fill=False      # remove background
    )
)

#fig2.savefig('circle2.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================
#3a   Background Patterns


fig3 = plt.figure()
ax3 = fig3.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.25, 0.5), 0.2,
        hatch='/'
    ),
    patches.Circle(
        (0.75, 0.5), 0.2,
        hatch='\\',
        fill=False
    ),
]:
    ax3.add_patch(p)
#fig3.savefig('circle3.png', dpi=90, bbox_inches='tight')
plt.show()
##=============================================================================
#3b   Background Patterns

patterns = ['-', '+', 'x', 'o', 'O', '.', '*']  # more patterns
fig4 = plt.figure()
ax4 = fig4.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.1 + (i * 0.13), 0.5),
        0.05,
        hatch=patterns[i],
        fill=False
    ) for i in range(len(patterns))
]:
    ax4.add_patch(p)
#fig4.savefig('circle4.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================
#4   Background Alpha

fig5 = plt.figure()
ax5 = fig5.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.13, 0.5), 0.1,
        alpha=None,
    ),
    patches.Circle(
        (0.36, 0.5), 0.1,
        alpha=1.0
    ),
    patches.Circle(
        (0.59, 0.5), 0.1,
        alpha=0.6
    ),
    patches.Circle(
        (0.82, 0.5), 0.1,
        alpha=0.1
    ),
]:
    ax5.add_patch(p)
#fig5.savefig('circle5.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================
#5   Background Color

fig6 = plt.figure()
ax6 = fig6.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.13, 0.5), 0.1,
        facecolor=None      # Default
    ),
    patches.Circle(
        (0.36, 0.5), 0.1,
        facecolor="none"     # No background
    ),
    patches.Circle(
        (0.59, 0.5), 0.1,
        facecolor="red"
    ),
    patches.Circle(
        (0.82, 0.5), 0.1,
        facecolor="#00ffff"
    ),
]:
    ax6.add_patch(p)
#fig6.savefig('circle6.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================
#6   Border Color

fig7 = plt.figure()
ax7 = fig7.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.13, 0.5), 0.1, fill=False,
        edgecolor=None      # Default
    ),
    patches.Circle(
        (0.36, 0.5), 0.1, fill=False,
        edgecolor="none"     # No border
    ),
    patches.Circle(
        (0.59, 0.5), 0.1, fill=False,
        edgecolor="red"
    ),
    patches.Circle(
        (0.82, 0.5), 0.1, fill=False,
        edgecolor="#0000ff"
    ),
]:
    ax7.add_patch(p)
plt.show()

##=============================================================================
#7   Border Width

fig8 = plt.figure()
ax8 = fig8.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.13, 0.5), 0.1, fill=False,
        linewidth=None      # Default
    ),
    patches.Circle(
        (0.36, 0.5), 0.1, fill=False,
        linewidth=0
    ),
    patches.Circle(
        (0.59, 0.5), 0.1, fill=False,
        linewidth=0.5
    ),
    patches.Circle(
        (0.82, 0.5), 0.1, fill=False,
        linewidth=3
    ),
]:
    ax8.add_patch(p)
#fig8.savefig('circle8.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================
#8   Border Style

fig9 = plt.figure()
ax9 = fig9.add_subplot(111, aspect='equal')
for p in [
    patches.Circle(
        (0.13, 0.5), 0.1, fill=False,
        linestyle='solid'   # Default
    ),
    patches.Circle(
        (0.36, 0.5), 0.1, fill=False,
        linestyle='dashed'
    ),
    patches.Circle(
        (0.59, 0.5), 0.1, fill=False,
        linestyle='dashdot'
    ),
    patches.Circle(
        (0.82, 0.5), 0.1, fill=False,
        linestyle='dotted'
    ),
]:
    ax9.add_patch(p)
#fig9.savefig('circle9.png', dpi=90, bbox_inches='tight')
plt.show()

##=============================================================================


##=============================================================================
