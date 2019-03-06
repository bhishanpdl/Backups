#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 9, 2017
# Ref: http://pandas.pydata.org/pandas-docs/stable/comparison_with_sql.html

# Imports
import pandas as pd
import numpy as np
import wget
import pandasql as pdsql

# global data
# pandas.DataFrame
tips = pd.read_csv('tips.csv')


def pysql(q):
    """Useful function."""
    print(pdsql.sqldf(q, globals()))
    return None

def main():
    # UNION
    q = """
    DELETE FROM tips
    WHERE tip > 1;
    """

    mydf = tips.loc[tips['tip'] <= 1]
    print(mydf)
    print("\n")
    pysql(q)

if __name__ == '__main__':
    main()
