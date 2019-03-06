#!python
# -*- coding: utf-8 -*-#
"""
Find the index of negative values in a numpy array.
    
@author: Bhishan Poudel
    
@date:  Mar 27, 2018
    
"""
# Imports
import numpy as np

for i in range(2):
    arr = np.array([[1,2,3], 
                    [0, 1, 0], 
                    [-7, 0, 2]])
                    
    # a = np.argwhere(arr < 0)
    # print(a)
    print(arr[2])
