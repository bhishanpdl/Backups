#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 03, 2016
# Ref     : https://plot.ly/python/axes/

# Import
import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Scatter(
    x=[0, 1, 2, 3, 4, 5, 6, 7, 8],
    y=[8, 7, 6, 5, 4, 3, 2, 1, 0]
)
trace2 = go.Scatter(
    x=[0, 1, 2, 3, 4, 5, 6, 7, 8],
    y=[0, 1, 2, 3, 4, 5, 6, 7, 8]
)
data = [trace1, trace2]
layout = go.Layout(
    xaxis=dict(
        showgrid=True,
        zeroline=True,
        showline=True,
        mirror='ticks',
        gridcolor='#bdbdbd',
        gridwidth=2,
        zerolinecolor='#969696',
        zerolinewidth=4,
        linecolor='#636363',
        linewidth=6
    ),
    yaxis=dict(
        showgrid=True,
        zeroline=True,
        showline=True,
        mirror='ticks',
        gridcolor='#bdbdbd',
        gridwidth=2,
        zerolinecolor='#969696',
        zerolinewidth=4,
        linecolor='#636363',
        linewidth=6
    )
)
fig = go.Figure(data=data, layout=layout)
plot_url = py.plot(fig, filename='axes-lines')
