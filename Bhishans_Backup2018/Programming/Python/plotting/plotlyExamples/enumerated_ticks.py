#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 03, 2016
# Ref     : https://plot.ly/python/axes/

# Import
import plotly.plotly as py
from plotly.graph_objs import Scatter, Data, Layout

data = Data([Scatter(x=[0,1,2,3,4,5,6], y=[0,1,2,3,4,5] )])

layout = dict(
        yaxis = dict(
            type = 'log',
            tickvals = [ 1.5, 2.53, 5.99999 ]
        ),
        xaxis = dict(
            ticktext = [
                "green eggs",
                "& ham",
                "H2O",
                "Gorgonzola"
            ],
            tickvals = [ 0, 1, 2, 3, 4, 5 ]
        )
    )

fig = { 'data':data, 'layout':layout }
url = py.plot( fig, filename='enumerated-ticks' )
