#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016
# Ref     : http://matlab.izmiran.ru/help/techdoc/ref/subplot.html

# Imports
import matplotlib.pyplot as plt

# define fig object
fig = plt.figure()

#top left
# fig.add_subplot(221) is equivalent to
# plt.subplot(2,2,1)   is equivalent to
# plt.subplot(221)     if row*col<10
fig.add_subplot(221)
plt.title('221')


#top right
fig.add_subplot(222)
plt.title('222')

#bottom left
fig.add_subplot(223)
plt.title('223')

#bottom right
plt.subplot(224)
plt.title('224')

# show the figure
plt.show()

