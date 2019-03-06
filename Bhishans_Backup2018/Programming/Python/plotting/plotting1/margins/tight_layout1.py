#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 25, 2016
# Ref     : https://stackoverflow.com/questions/4042192/reduce-left-and-right-margins-in-matplotlib-plot

# Imports
import matplotlib.pyplot as plt

x = [1,2,3]
y = [1,4,9]

fig = plt.figure()
subplot1 = fig.add_subplot(121)
subplot1.plot(x,y)
subplot2 = fig.add_subplot(122)
subplot2.plot(y,x)


fig.tight_layout()

plt.show()
