#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016

# Imports
import matplotlib.pyplot as plt

circle1=plt.Circle((0,0),.2,color='r')
plt.gcf().gca().add_artist(circle1)
plt.show()


# gcf() means Get Current Figure
# gca() means Get Current Axis

# scatter plot method
import matplotlib.pyplot as plt
x=[1,2,3,4,5]
y=[10,20,30,40,50]
r=[100,80, 60, 40, 20] # in points, not data units
fig, ax = plt.subplots(1,1)
ax.scatter(x, y, s=r)
plt.show()

