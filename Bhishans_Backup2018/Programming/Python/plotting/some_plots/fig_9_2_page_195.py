#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Program : Fig 9.2 (page 195 of James B. Hartle)
#           Plot of effective and Newtonian potential for Schwarzschild geom
#           V_eff(r) = -M/r + l^2/2r^2 - Ml^2/r^3
#           V_eff(x) = -1/x + 0.5 A^2/x^2 - A^2/x^3
#                      where, x = r/M and A = l/M = 4.3 for this example
#           V_eff(x) = -1/x + 9.2/x^2 - 18.5/x^3

# Imports
import numpy as np
import matplotlib.pyplot as plt


x = np.arange(0.001, 40.0, 0.001)

y = np.array( (-1.0/x) + (9.2/(x**2)) - (18.5/(x**3)) )
y2 = np.array( (-1.0/x) + (9.2/(x**2)) )


# Set axes limits
plt.ylim(-0.04,0.06)

# Plots
plt.plot(x,y,color='k')
plt.plot(x,y2,color='k',linestyle="--")

# Draw hr line at x=0
plt.axhline(y=0.0,color='k',linestyle='-')

# Text annotation
plt.annotate('Newtonian', xy=(9, 0.02))

# labels
plt.xlabel(r'$\frac{r}{M}$')
plt.ylabel(r'$V_{eff}$')

# tickmarks
plt.xticks(np.arange(min(x), max(x)+1, 10.0))
plt.yticks(np.arange(-0.02, 0.04+0.001, 0.02))

# Save figure to png
plt.savefig("fig_9_2_page_195.png",dpi = 200, height = 14, width = 14)


# show the plot
plt.show()
