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

def main():
    

    df1 = pd.DataFrame(np.random.randn(10, 4), columns=['a', 'b', 'c', 'd'])
    print(df1)

    mask = df1.applymap(lambda x: x < -0.7)
    df1 = df1[-mask.any(axis=1)]
    mask = df1.applymap(lambda x: x >= -0.7)
    df1 = df1[mask.any(axis=1)]
    print(df1)

    sLength = len(df1['a'])
    print('sLength = ', sLength)

    # add new column to df1
    e = pd.Series(np.random.randn(sLength))
    df1 = df1.assign(e=e.values)
    print(df1)

if __name__ == '__main__':
    main()
