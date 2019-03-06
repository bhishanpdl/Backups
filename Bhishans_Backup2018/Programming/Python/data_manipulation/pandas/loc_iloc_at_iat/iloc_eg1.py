#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 7, 2017
# Last update :
# Est time    :

# Imports
import pandas as pd
import numpy as np

def main():
    
    df = pd.DataFrame(np.random.randn(10, 4))
    print(df)

    # select all columns which have (last row) value>0
    df1 = df[df.columns[df.iloc[-1] > 0]]
    print(df1)

if __name__ == '__main__':
    main()
