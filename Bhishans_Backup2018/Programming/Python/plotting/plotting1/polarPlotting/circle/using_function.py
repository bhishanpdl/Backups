#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016

# Imports
import matplotlib.pyplot as plt
import numpy as np

def xy(r,phi):
  return r*np.cos(phi), r*np.sin(phi)

fig = plt.figure()
ax = fig.add_subplot(111,aspect='equal')  

phis=np.arange(0,6.28,0.01) # 2pi = 6.28
r =1.5
ax.plot( *xy(r,phis), c='r',ls='-' )
plt.show()
