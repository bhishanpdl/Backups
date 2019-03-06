#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-20-2017 Tue
# Last update : 
#
#
# Imports
import numpy as np
import pandas as pd
from tabulate import tabulate

def main():
    
    df = pd.DataFrame({'col_two' : [0.0001, 1e-005 , 1e-006, 1e-007],
                       'column_3' : ['ABCD', 'ABCD', 'long string', 'ABCD']})
    print(tabulate(df, headers='keys', tablefmt='psql'))

if __name__ == '__main__':
    main()
