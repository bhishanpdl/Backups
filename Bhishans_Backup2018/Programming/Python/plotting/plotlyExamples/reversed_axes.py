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
        x=[1, 2],
        y=[1, 2]
    )
]
layout = go.Layout(
    xaxis=dict(
        autorange='reversed'
    )
)
fig = go.Figure(data=data, layout=layout)
plot_url = py.plot(fig, filename='axes-reversed')
