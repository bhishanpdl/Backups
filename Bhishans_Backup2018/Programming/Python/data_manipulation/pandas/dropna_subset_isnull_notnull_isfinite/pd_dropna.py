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
    
    df = pd.DataFrame(np.random.randn(10, 3))
    df.ix[::2, 0] = np.nan
    df.ix[::4, 1] = np.nan
    df.ix[::3, 2] = np.nan

    # print(df)

    df1 = df.dropna()  # drop all rows that have any NaN values
    # print(df1)

    df1 = df.dropna(how='all')     # drop only if ALL columns are NaN
    # print(df1)

    df1 = df.dropna(thresh=2)   # Drop row if it does not have at least two
    # print(df1)

    df1 = df.dropna(subset=[1])  # Drop only if NaN in specific column
    # print(df1)

    df1 = df[pd.notnull(df[1])]  # suggested by Wes (author of Pandas)
    print(df1)

if __name__ == '__main__':
    main()
