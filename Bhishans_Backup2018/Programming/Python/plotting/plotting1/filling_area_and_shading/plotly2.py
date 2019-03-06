import plotly.plotly as py
import plotly.graph_objs as go
import matplotlib.pyplot as plt
import numpy as np

# plot values
xx = np.arange(0.001, 25.0, 0.1)
A = 4.3
yy = np.array( (-1.0/xx) + (0.5*A*A/(xx**2)) - (A*A/(xx**3)) )

# Traces and data
trace1 = go.Scatter(
    x=xx,
    y=yy,
    fill='tozeroy'
)


data = [trace1]

# Set axes limits
layout = go.Layout(
    title='Plot Title',
    xaxis=dict(
        title='x Axis',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    ),
    yaxis=dict(
        title='y Axis',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    )
)


fig = go.Figure(data=data, layout=layout)
plot_url = py.plot(data, filename='basic-area')
