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

def main():
    

    data=pd.read_csv("data.csv")
    print(data)
    #rno,marktheory1,marklab1,marktheory2,marklab2
    #1,78,45,34,54
    #2,23,54,87,46

    # Make hierarchical df
    arrays = [[ '', 'Subject1', 'Subject1', 'Subject2', 'Subject2'], data.columns]
    df = pd.DataFrame(data.values, columns=arrays)
    print(df)

    # Another method
    data_pieces = [data.ix[:, [0]], data.ix[:, [1, 2]], data.ix[:, [3,4]]]
    df = pd.concat(data_pieces, axis=1, keys=['','Subject1', 'Subject2'])
    print(df)

if __name__ == '__main__':
    main()
