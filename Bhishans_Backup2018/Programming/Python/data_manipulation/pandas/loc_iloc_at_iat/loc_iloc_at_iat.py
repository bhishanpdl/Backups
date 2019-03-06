#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 9, 2017
# Ref: http://pandas.pydata.org/pandas-docs/stable/comparison_with_sql.html

# Imports
import pandas as pd
import numpy as np

def main():

    df = pd.DataFrame({'A': ['a', 'b', 'c'],
                       'B': [54, 67, 89]},
                      index=[100, 200, 300])

    # print(df)
    # print(df.loc[100])
    # print(df.iloc[0])


    df2 = df.set_index([df.index, 'A'])
    print(df)
    print(df2)
    print(df2.ix[100, 'a'])

if __name__ == '__main__':
    main()
