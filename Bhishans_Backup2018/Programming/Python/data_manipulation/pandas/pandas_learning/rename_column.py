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
    
    df = pd.DataFrame({'$a': [1, 2], '$b': [10, 20]})

    df1 = copy.deepcopy(df)
    df1.columns = ['a', 'b']
    df1.columns = [col.strip('$') for col in df.columns]
    # df1.columns = df1.columns.str.replace('$', '')
    # df1 = df.rename(columns=lambda x: x[1:])
    # df1 = df.rename(columns=lambda x: x.replace('$', ''))
    df1 = df.rename(columns=lambda x: x.lstrip('$'))
    print(df)
    print(df1)

if __name__ == '__main__':
    main()
