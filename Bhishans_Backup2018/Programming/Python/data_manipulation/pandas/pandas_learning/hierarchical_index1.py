#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-18-2017 Sun
# Ref : https://pandas.pydata.org/pandas-docs/stable/advanced.html
# Imports
import pandas as pd
import numpy as np
import time
pd.set_option('display.width', None)

def main():
    
    arrays = [ ['A', 'B']*4 ]             # One line to index
    df     = pd.DataFrame(np.random.randn(5, 8),columns=arrays)
    #print(df)

    # Multi index from arrays
    arrays = [ ['', '']*4, ['A', 'B']*4 ] # Double line top index
    index  = pd.MultiIndex.from_arrays(arrays, names=['', '']) # leftmost index
    df     = pd.DataFrame(np.random.randn(5, 8), columns=index)

    # Multiindex from tuples
    arrays = [ ['foo', 'bar']*4, ['A', 'B']*4 ] # Double line top index
    NROWS  = 3 
    tuples = list(zip(*arrays))
    index  = pd.MultiIndex.from_tuples(tuples, names=['', '']) # leftmost index
    df     = pd.DataFrame(np.random.randn(NROWS, 8), index=range(NROWS), columns=index)
    print(df)

if __name__ == '__main__':
    main()
