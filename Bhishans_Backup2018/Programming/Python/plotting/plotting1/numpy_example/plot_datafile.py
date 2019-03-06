#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
import numpy as np
import matplotlib.pyplot as plt


inE = 'bhi.txt'
wavelength,flux = np.loadtxt(inE, comments="#", skiprows=0, usecols=(0,1), unpack=True)
plt.plot(wavelength, flux)
plt.xlabel('wavelength (Angstrom)')
plt.ylabel('specific intensity')
plt.title('Title')
plt.show()
