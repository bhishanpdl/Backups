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
df1 = pd.DataFrame({'city': ['Chicago', 'San Francisco',
                                   'New York City'],
                    'rank': range(1, 4)})
df2 = pd.DataFrame({'city': ['Chicago', 'Boston', 'Los Angeles'],
                    'rank': [1, 4, 5]})


def pysql(q):
    """Useful function."""
    print(pdsql.sqldf(q, globals()))
    return None

def main():
    
    # UNION
    q = """
    SELECT city, rank
    FROM df1
    UNION ALL
    SELECT city, rank
    FROM df2;
    """

    mydf = pd.concat([df1, df2])
    print(mydf)
    print("\n")
    pysql(q)


    # UNION
    q = """
    SELECT city, rank
    FROM df1
    UNION
    SELECT city, rank
    FROM df2;
    -- notice that there is only one Chicago record this time
    """

    mydf = pd.concat([df1, df2]).drop_duplicates()
    print(mydf)
    print("\n")
    pysql(q)

if __name__ == '__main__':
    main()
