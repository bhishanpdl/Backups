#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : May 09, 2017
# Last update : 
#

# Imports
import numpy as np
import matplotlib.pyplot as plt


def plot_with_twiny():
    fig = plt.figure()
    ax1 = fig.add_subplot(111)
    ax2 = ax1.twiny()

    X = np.linspace(0,1,1000)
    Y = np.cos(X*20)

    ax1.plot(X,Y)

    x2labels = np.arange(0,1,step=.10)

    ax1.set_xlim(ax1.get_xlim())
    ax1.set_xticks(x2labels)
    ax1.set_xticklabels(x2labels)
    ax1.set_xlabel(r"Original x-axis")

    ax2.set_xlim(ax1.get_xlim())
    ax2.set_xticks(x2labels)
    ax2.set_xticklabels(x2labels)
    ax2.set_xlabel(r"Modified x-axis")


    x1labels = ['zero', 'one', 'two','three','four','five', 'six',
               'seven', 'eight',  'nine']
    ax1.set_xticklabels(x1labels,rotation='vertical')
    ax1.xaxis.grid(True)
    ax1.yaxis.grid(True)
    plt.subplots_adjust(bottom=0.2)
    plt.show()

if __name__ == '__main__':
    plot_with_twiny()
