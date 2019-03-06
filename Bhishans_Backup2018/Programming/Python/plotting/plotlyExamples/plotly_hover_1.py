#!/usr/bin/env python

# Bhishan Poudel
# Jan 15, 2016

# ref: https://plot.ly/python/3d-parametric-plots/


import plotly.plotly as py
import plotly.graph_objs as go

data = [
    go.Scatter(
        x=[0, 1, 2],
        y=[1, 3, 2],
        mode='markers',
        text=['Text A', 'Text B', 'Text C']
    )
]
layout = go.Layout(
    title='Hover over the points to see the text'
)
fig = go.Figure(data=data, layout=layout)
plot_url = py.plot(fig, filename='hover-chart-basic')
