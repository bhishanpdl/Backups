#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 23, 2016
# Program : plot parametric helix equation
# Ref     : https://plot.ly/python/3d-plots-tutorial/#8.2-A-helix-curve-in-3D

# x = cos(t) y= sin(t) z= t

# Imports
import numpy as np
from numpy import cos, sin

# (*) To communicate with Plotly's server, sign in with credentials file
import plotly.plotly as py

# (*) Useful Python/Plotly tools
import plotly.tools as tls

# (*) Graph objects to piece together plots
from plotly.graph_objs import *

import numpy as np  # (*) numpy for math functions and arrays

# Define a function generating the helix coordinates
def helix(t):
    x = cos(t)
    y = sin(t)
    z = t
    return x, y, z

# Next, get the coordinates of the helix:


from numpy import pi  # import pi for this cell

# Make a linear space from 0 to 4pi (i.e. 2 revolutions), get coords
t = np.linspace(0, 4*pi, 200)
x, y, z = helix(t)

# For this figure, we will use the Scatted3d object which shares the
#  same functionality as its 2D version.
# help(Scatter3d)



trace1 = Scatter3d(
    x=x,  # x coords
    y=y,  # y coords
    z=z,  # z coords
    mode='lines',      # (!) draw lines between coords (as in Scatter)
    line=Line(
        color='black', # black line segments
        width=3        # set line segment width
    )
)

# Package the trace dictionary into a data object
data = Data([trace1])

# Make a layout object
layout = Layout(
    title='Fig 8.2: Helix curve'
)

# Make a figure object
fig = Figure(data=data, layout=layout)

# Send to Plotly and show in notebook
plot_url = py.plot(fig, filename='parametric_helix')


