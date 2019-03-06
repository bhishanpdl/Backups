

# (*) Import plotly package
import plotly

# Check plolty version (if not latest, please upgrade)
print(plotly.__version__)

# (*) To communicate with Plotly's server, sign in with credentials file
import plotly.plotly as py

# (*) Useful Python/Plotly tools
import plotly.tools as tls

# (*) Graph objects to piece together plots
from plotly.graph_objs import *

import numpy as np  # (*) numpy for math functions and arrays

# (*) Import the math functions needed in this cell
from numpy import pi, cos, exp

# Define the function to be plotted
def fxy(x, y):
    A = 1  # choose a maximum amplitude
    return A*(cos(pi*x*y))**2 * exp(-(x**2+y**2)/2.)

# Choose length of square domain, make row and column vectors
L = 4
x = y = np.arange(-L/2., L/2., 0.1)  # use a mesh spacing of 0.1
yt = y[:, np.newaxis]  # (!) make column vector

# Get surface coordinates!
z = fxy(x, yt)

#help(Surface)  # call help()!

trace1 = Surface(
    z=z,  # link the fxy 2d numpy array
    x=x,  # link 1d numpy array of x coords
    y=y   # link 1d numpy array of y coords
)

# Package the trace dictionary into a data object
data = Data([trace1])

# Axes in 3D Plotly plots work in little differently than in 2D: axes are bound to a Scene .
# help(Scene)  # call help()!

# For now, consider the layout object:
# Dictionary of style options for all axes
axis = dict(
    showbackground=True, # (!) show axis background
    backgroundcolor="rgb(204, 204, 204)", # set background color to grey
    gridcolor="rgb(255, 255, 255)",       # set grid line color
    zerolinecolor="rgb(255, 255, 255)",   # set zero grid line color
)

# Make a layout object
layout = Layout(
    title='$f(x,y) = A \cos(\pi x y) e^{-(x^2+y^2)/2}$', # set plot title
    scene=Scene(  # (!) axes are part of a 'scene' in 3d plots
        xaxis=XAxis(axis), # set x-axis style
        yaxis=YAxis(axis), # set y-axis style
        zaxis=ZAxis(axis)  # set z-axis style
    )
)

# Make a figure object
fig = Figure(data=data, layout=layout)

# (@) Send to Plotly and show in notebook
py.iplot(fig, filename='s8_surface')

plot_url = py.plot(fig, filename='a_plot')




