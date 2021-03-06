#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 03, 2016
# Ref     : https://plot.ly/python/axes/

# Import
import plotly.plotly as py
import plotly.graph_objs as go

# Learn about API authentication here: https://plot.ly/python/getting-started
# Find your api_key here: https://plot.ly/settings/api

import numpy as np
x = np.linspace(0, 10, 100)
y = np.random.randint(1, 100, 100)

trace = go.Scatter(x=x, y=y, mode='markers')
data = [trace]
layout = go.Layout(title='Reversed Axis with Min/Max', xaxis=dict(autorange='reversed', range=[0, 10]))

fig = go.Figure(data=data, layout=layout)
py.plot(fig, filename='example-reversed-axis-with-min-max')
