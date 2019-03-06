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
    df = pd.DataFrame({'a': [1, 2, 3], 'b': [2, 4, 6], 'c': [1, 1, 1]})
    # print(df)
    # a  b  c
    # 0  1  2  1
    # 1  2  4  1
    # 2  3  6  1

    # print(df[['a', 'b']].sum())  # a b and 6 12 two columns
    print(df[['a']].sum().sum())  # 6
    print(df[['b']].sum().sum())  # 12
    print(df[['a', 'b']].sum().sum())  # 18
    # print(df[['a', 'b']].sum(axis=1))  # 0 1 2 and 3 6 9 two columns
    # print(df[['a', 'b']].sum(axis=1).sum())  # 18
    # print(df[['a', 'b']].values.sum())  # 18
    # print(df.sum().sum())  # 21
    # print(df.sum(axis=0))  # 6 12 3
    # print(df.sum(axis=1))  # 4 7 10

if __name__ == '__main__':
    main()
