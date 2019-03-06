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


plt.subplots_adjust(left=0.1, right=0.9, top=0.9, bottom=0.4)

#fig.subplots_adjust(bottom=0.2)
# plt.tight_layout()

plt.show()
