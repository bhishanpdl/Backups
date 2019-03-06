#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author    : Bhishan Poudel
# Date      : Jun 30, 2016
 

# Imports
import glob
import matplotlib.pyplot as plt
import numpy as np


for fname in glob.glob('*.sed'):

    # pring readin file
    print('{} {} {}'.format('\nreading file : ',fname, ''))

    # get the data
    x,y = np.genfromtxt(fname,delimiter=None,usecols=(0,1),dtype=float,unpack=True)

    fig, ax = plt.subplots()
    ax.plot(x,y)

    title = str(fname)
    ax.set_title(title)
    ax.set_xlabel('wavelength (nm)',fontsize=16,fontweight="bold")
    ax.set_ylabel('Flux',fontsize=16,fontweight="bold")
    
    ## save figure
    imagename = fname[0:-4] + '.png'
    print('{} {}'.format('output image : ',imagename ))
    plt.savefig(imagename)
    #plt.show()


