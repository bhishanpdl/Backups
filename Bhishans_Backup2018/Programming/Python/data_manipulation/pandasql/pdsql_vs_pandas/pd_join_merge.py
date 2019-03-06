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

# Global data
df1 = pd.DataFrame({'key': ['A', 'B', 'C', 'D'],
                    'value': np.random.randn(4)})
df2 = pd.DataFrame({'key': ['B', 'D', 'D', 'E'],
                    'value': np.random.randn(4)})

def pysql(q):
    """Useful function."""
    print(pdsql.sqldf(q, globals()))
    return None
    
def main():




    # INNER JOIN
    q = """
    SELECT *
    FROM df1
    INNER JOIN df2
      ON df1.key = df2.key;
    """

    mydf = pd.merge(df1, df2, on='key')
    indexed_df2 = df2.set_index('key')
    mydf = pd.merge(df1, indexed_df2, left_on='key', right_index=True)
    print(mydf)
    print("\n")
    pysql(q)


    # LEFT OUTER JOIN
    q = """
    -- show all records from df1
    SELECT *
    FROM df1
    LEFT OUTER JOIN df2
      ON df1.key = df2.key;
    """

    mydf = pd.merge(df1, df2, on='key', how='left')
    print(mydf)
    print("\n")
    pysql(q)


    # RIGHT JOIN
    q = """
    -- show all records from df2
    SELECT *
    FROM df1
    RIGHT OUTER JOIN df2
      ON df1.key = df2.key;
    """

    mydf = pd.merge(df1, df2, on='key', how='right')
    print(mydf)
    print("\n")
    # pysql(q)

if __name__ == '__main__':
    main()
