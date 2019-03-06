#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
import matplotlib.pyplot as plt
import csv

x = []
y = []

with open('input.dat','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=' ')
    for row in plots:
        x.append(int(row[0]))
        y.append(int(row[1]))

plt.plot(x,y, label='Loaded from file!')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Interesting Graph\nCheck it out')
plt.legend()
plt.show()
