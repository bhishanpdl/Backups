# Bhishan Poudel
# Jan 26, 2016

import pylab as p
import numpy as np

# data
x = np.linspace(0, 3, 20)
y1 = np.linspace(0, 9, 20)
y  = x*x

# plotting
ax=p.subplot(111)
ax.plot(x, y, color='r',linewidth=1.0)
ax.xaxis.set_ticks_position('top')


# invert y axis and correspondingly the plot
ax=p.gca()
ax.set_ylim(ax.get_ylim()[::-1])

p.show()
