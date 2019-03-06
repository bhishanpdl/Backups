#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 7,2017
# Ref: http://stackoverflow.com/questions/13413590/how-to-drop-rows-of-pandas
#  -dataframe-whose-value-in-certain-columns-is-nan

# Imports
import pandas as pd
import numpy as np
import copy

def main():
    
    df = pd.DataFrame({'a': [1, 2], 'b': [10, 20], 'c': [10, 20]})

    # axis = 0 for row
    df1 = df.drop(['a'], axis=1, errors='ignore', inplace=False)
    df1 = df.drop(df.columns[[0, 1]], axis=1, errors='ignore')
    print(df1)

if __name__ == '__main__':
    main()
