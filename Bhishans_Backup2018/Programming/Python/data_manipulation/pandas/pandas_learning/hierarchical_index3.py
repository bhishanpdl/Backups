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
    
    arrays = [[1, 2]*3, ['A', 'B', 'C']*2]
    columns = pd.MultiIndex.from_arrays(arrays, names=['foo', 'bar'])

    df = pd.DataFrame(np.random.randn(2,6),
                      columns=columns,
                      index= pd.date_range('20000103',periods=2))
                      
    print(df)

    #  foo                1         2         1         2         1         2
    #  bar                A         B         C         A         B         C
    #  2000-01-03  1.114346  0.603305 -0.449497  1.128801  1.931790 -0.506344
    #  2000-01-04 -1.669579  2.312531  0.172168  1.092751 -1.667941 -0.106373

if __name__ == '__main__':
    main()
