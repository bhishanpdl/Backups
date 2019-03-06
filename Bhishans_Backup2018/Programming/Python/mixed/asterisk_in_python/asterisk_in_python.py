#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jun 21, 2017 Wed
# Last update : 
#
# Imports
import numpy as np


def mysum(a, b):
    return a + b




if __name__ == '__main__':
    s = mysum(1, 2)
    print(s)
    
    # Using *
    values = (1,2)
    print(mysum(*values))
    
    # Using **
    mydict = {'a':10, 'b':20}
    print(mysum(**mydict))
    
    # Using * for dict
    print("\n")
    print(*mydict)
    print(mydict.keys())
    print(mydict.values())
    print(mydict['a'])
    

