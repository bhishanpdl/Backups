#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016


# Imports
import random
import pylab as plt

signal = [round(random.random() * 100) for i in xrange(0, 1000000)]
plt.plot(signal, '.')
plt.show()


