#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 03, 2016
# Ref     : https://plot.ly/python/axes/

# Import
import plotly.plotly as py
import plotly.graph_objs as go

data = [
    go.Scatter(
        x=[2, 4, 6],
        y=[-3, 0, 3]
    )
]
layout = go.Layout(
    showlegend=False,
    xaxis=dict(
        rangemode='tozero',
        autorange=True
    ),
    yaxis=dict(
        rangemode='nonnegative',
        autorange=True
    )
)
fig = go.Figure(data=data, layout=layout)
plot_url = py.plot(fig, filename='axes-range-mode')
