#!/usr/bin/env python
# Bhishan Poudel
# Jan 18, 2016
# clear; python polarPlot2.py; rm *~

import matplotlib.pyplot as plt
import numpy as np
theta = np.linspace(-np.pi, np.pi, 200)  
r = 1 - np.sin(3*theta)
plt.figure()
ax = plt.axes(polar=True)
plt.plot(theta, r)
plt.show()

# customizing the plot 
#import matplotlib.pyplot as plt
#import numpy as np
theta = np.linspace(-np.pi, np.pi, 200)  
r1 = 1 - np.sin(3*theta)
ax = plt.axes(polar=True,
axisbg='Azure')
plt.plot(theta, r1,
color = '#A30000',
linestyle = '--',
linewidth = 3,
)
plt.title('3-fold Clover\n') 
plt.show()

# The Background Grid
theta = np.linspace(-np.pi, np.pi, 200)  
r1 = 1 - np.sin(3*theta)
plt.figure()
ax = plt.axes(polar=True,
axisbg='Azure')
ax.set_rticks([0.5, 1, 1.5])
plt.rc('ytick', labelsize='large', color='#A30000')
plt.rc('xtick', labelsize='medium')
ax.grid(color = '#316931', 
linewidth = 2, 
linestyle = '-.')
xtickslbls = ['0', r'$\frac{\pi}{4}$', r'$\frac{\pi}{2}$', r'$\frac{3\pi}{4}$',
r'$\pi$', r'$\frac{5\pi}{4}$', r'$\frac{3\pi}{2}$', r'$\frac{7\pi}{4}$']
ax.set_xticklabels(xtickslbls)
plt.plot(theta, r1,
color = '#A30000',
linestyle = '-',
linewidth = 3,
)
ax.set_rmax(2.2)
plt.title('3-fold Clover\n') 
plt.show()
plt.close()




