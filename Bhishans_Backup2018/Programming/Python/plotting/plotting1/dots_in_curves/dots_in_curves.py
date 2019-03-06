#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016


# Imports
import matplotlib.pyplot as plt
import numpy as np

plt.plot(range(10), linestyle='--', marker='o', color='b')

# shortcut method
plt.plot(range(10), '--bo')
plt.show()

# Example 2
import matplotlib.pyplot as plt
plt.plot([1,2,3,4], [1,4,9,16])       # Your original list
plt.plot(2, 4, 'go')                 # Additional point
plt.plot(3, 5, 'yo')                 # Additional point
plt.axis([0, 5, 0, 20])              # Modified axis
plt.show()

# Example 3
xs = np.linspace(-np.pi, np.pi, 30)
ys = np.sin(xs)
markers_on = [12, 17, 18, 19]
plt.plot(xs, ys, 'g-')
plt.plot(xs[markers_on], ys[markers_on], 'rD')
plt.show()

### Markers in python plot
#================    ===============================
#character           description
#================    ===============================
#``'-'``             solid line style
#``'--'``            dashed line style
#``'-.'``            dash-dot line style
#``':'``             dotted line style
#``'.'``             point marker
#``','``             pixel marker
#``'o'``             circle marker
#``'v'``             triangle_down marker
#``'^'``             triangle_up marker
#``'<'``             triangle_left marker
#``'>'``             triangle_right marker
#``'1'``             tri_down marker
#``'2'``             tri_up marker
#``'3'``             tri_left marker
#``'4'``             tri_right marker
#``'s'``             square marker
#``'p'``             pentagon marker
#``'*'``             star marker
#``'h'``             hexagon1 marker
#``'H'``             hexagon2 marker
#``'+'``             plus marker
#``'x'``             x marker
#``'D'``             diamond marker
#``'d'``             thin_diamond marker
#``'|'``             vline marker
#``'_'``             hline marker
#================    ===============================
