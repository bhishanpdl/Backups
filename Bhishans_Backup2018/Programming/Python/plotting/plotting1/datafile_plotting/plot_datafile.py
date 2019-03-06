#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
import numpy as np
import matplotlib.pyplot as plt


infile = 'bhishan.txt'
wavelength,flux = np.loadtxt(infile, comments="#", skiprows=0, usecols=(0,1), unpack=True)
plt.plot(wavelength, flux)
plt.xlabel('wavelength (Angstrom)')
plt.ylabel('specific intensity')
plt.title('Title')
plt.show()
