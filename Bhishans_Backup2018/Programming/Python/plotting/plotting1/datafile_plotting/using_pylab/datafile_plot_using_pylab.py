#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016


# Imports
from __future__ import division
from __future__ import print_function
import pylab


filename='input.dat'
datalist = [ ( pylab.loadtxt(filename), label ) for filename, label in list_of_files ]

for data, label in datalist:
    pylab.plot( data[:,0], data[:,1], label=label )

pylab.legend()
pylab.title("Title of Plot")
pylab.xlabel("X Axis Label")
pylab.ylabel("Y Axis Label")
