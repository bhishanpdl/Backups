#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 14, 2016
# Topic   : hw 4 qn 5b

# Imports
import numpy as np
import matplotlib.pyplot as plt

# subplots
fig, ax = plt.subplots()

# constants
Er = 664.7             # kev
gamma = 39.0           # kev
gammaP = 0.39 * gamma  # gammaP/gamma = 0.39
omegaGamma = 6.2       # kev
gamma_alpha = gamma - gammaP


# data
E = np.arange(500.00001, 800.0, 0.1)     # E = Energy in kev  x = E
y = np.array( gammaP*gamma_alpha / ( (E-Er)**2 + (gamma**2/4.0) )      )
y = np.array(y/4.0)
scale = 50.0/0.25    # after plotting figure and comparing with graph on paper
y = np.array(y*scale)


# Plots
plt.plot(E,y,color='k')


# Set axes limits
#plt.ylim(-0.04,0.06)

# Add text marker
text = r'$^1H(^{18}F,\alpha)^{15} O $'
plt.text(725, 45, text)

# Labels
plt.xlabel(r'$E_{c.m.} (keV)$')
plt.ylabel(r'$d\sigma / d\Omega \  (mb/sr) $')  # space is \space



# Tickmarks
x_major_ticks = np.arange(500, 801, 50)
x_minor_ticks = np.arange(500, 801, 25)
y_major_ticks = np.arange(0, 51, 20)
y_minor_ticks = np.arange(0, 51, 5)
ax.set_xticks(x_major_ticks)
ax.set_xticks(x_minor_ticks, minor=True)
ax.set_yticks(y_major_ticks)
ax.set_yticks(y_minor_ticks, minor=True)


# Save figure to png
#plt.savefig("fig2b.png",dpi = 200, height = 14, width = 14)

# Show the plot
plt.show()

