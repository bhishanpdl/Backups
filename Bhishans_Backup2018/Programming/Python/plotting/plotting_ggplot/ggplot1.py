#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 09, 2016
# Ref     : http://blog.yhat.com/posts/ggplot-for-python.html

# Imports
from ggplot import *

print ggplot(mtcars, aes('mpg', 'qsec')) + \
  geom_point(colour='steelblue') + \
  scale_x_continuous(breaks=[10,20,30],  \
                     labels=["horrible", "ok", "awesome"])
