# Bhishan Poudel
# Nov 27, 2015 Fri

# clear; python eg1.py; rm *~

# minimal plot of spectrum in python, now with loadtxt
import sys
import os
import numpy
from pylab import *
import matplotlib.pyplot
import pylab


inE = 'somedata.txt'
wavelength,flux,sigma = numpy.loadtxt(inE, comments="#", skiprows=3, usecols=(0,1,2), unpack=True)
plot(wavelength, flux)
xlabel('wavelength (Angstrom)')
ylabel('specific intensity)')
title('This was a bit easier')
show()

matplotlib.pyplot.scatter(data.col1, data.col2) # See? columns are in col1, col2, etc...
matplotlib.pyplot.show()


