#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 30, 2016
# Ref     : http://stackoverflow.com/questions/13555069/saving-multiple-plots

# Imports
import re
import numpy as np
import matplotlib.pyplot as plt
import pylab as pl
import os

rootdir='~/OneDrive/Programming/Python/pyprograms/plotting/datafile_plotting/Plotting_all_files_in_a_folder/Plot/'

for subdir,dirs,files in os.walk(rootdir):
 for file in files:
  f=open(os.path.join(subdir,file),'r')
  print file
  data=np.loadtxt(f)

  #plot data
  pl.plot(data[:,1], data[:,2], 'gs')

  #Put in the errors
  pl.errorbar(data[:,1], data[:,2], data[:,3], data[:,4], fmt='ro')

  #Dashed lines showing pmRa=0 and pmDec=0
  pl.axvline(0,linestyle='--', color='k')
  pl.axhline(0,linestyle='--', color='k')

fileNameTemplate = r'~/OneDrive/Programming/Python/pyprograms/plotting/datafile_plotting/Plotting_all_files_in_a_folder/Plot{0:02d}.png'

for subdir,dirs,files in os.walk(rootdir):
    for count, file in enumerate(files):
        # Generate a plot in `pl`
        pl.savefig(fileNameTemplate.format(count), format='png')
        pl.clf()  # Clear the figure for the next loop
