#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 09, 2016


# Imports
import pandas as pd
from ggplot import *

meat_lng = pd.melt(meat, id_vars=['date'])

p = ggplot(aes(x='date', y='value'), data=meat_lng)
p + geom_point() + \
    stat_smooth(colour="red") + \
    facet_wrap("variable")

p + geom_hist() + facet_wrap("color")

p = ggplot(diamonds, aes(x='price'))
p + geom_density() + \
    facet_grid("cut", "clarity")

p = ggplot(diamonds, aes(x='carat', y='price'))
p + geom_point(alpha=0.25) + \
    facet_grid("cut", "clarity")
