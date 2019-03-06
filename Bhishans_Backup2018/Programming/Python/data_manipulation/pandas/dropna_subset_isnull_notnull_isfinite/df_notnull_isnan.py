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
    
    df = pd.read_csv('mydata.csv', sep='\s+')
    print(df)

    df1 = df[df.EPS.notnull()]
    df1 = df[~df.EPS.isnull()]
    df1 = df[~np.isnan(df.EPS)]
    df1 = df[np.isfinite(df['EPS'])]
    df1 = df.dropna(subset=['EPS'])

    # df1 = df.dropna(subset=[3]) # does not work IDK why?
    print(df1.columns)

    print(df1)

    # example of boolean
    df1 = df[(df.EPS > 2.0) & (df.EPS < 4.0)]
    # print(df1)

if __name__ == '__main__':
    main()
