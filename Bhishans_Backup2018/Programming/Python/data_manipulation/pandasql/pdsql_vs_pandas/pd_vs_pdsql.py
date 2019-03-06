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

# Data
tips = pd.read_csv('tips.csv')
frame = pd.DataFrame({'col1': ['A', 'B', np.NaN, 'C', 'D'],
                          'col2': ['F', np.NaN, 'G', 'H', 'I']})

def pysql(q):
    """Useful function."""
    print(pdsql.sqldf(q, globals()))
    return None

def main():
    

    # download the data
    # url = 'https://raw.github.com/pandas-dev/pandas/master/pandas/tests/' +\
    # 'data/tips.csv'
    # wget.download(url)

    # pandas.DataFrame
    

    # head 5 lines
    q = """
    SELECT *
    From tips
    LIMIT 5;
    """

    # pysql(q)
    # print(tips.head())


    # SELECT
    q = """
    SELECT total_bill, tip, smoker, time
    From tips
    LIMIT 5;
    """

    df1 = tips[['total_bill', 'tip', 'smoker', 'time']].head(5)
    # print(df1)
    # pysql(q)


    # WHERE
    q = """
    SELECT *
    FROM tips
    WHERE time = 'Dinner'
    LIMIT 5;
    """

    # df1 = tips[tips['time'] == 'Dinner'].head(5)
    # print(df1)
    # pysql(q)
    # is_dinner = tips['time'] == 'Dinner'
    # print(is_dinner.value_counts())
    # print(tips[is_dinner].head(5))


    # OR and AND
    q = """
    -- tips of more than $5.00 at Dinner meals
    SELECT *
    FROM tips
    WHERE time = 'Dinner' AND tip > 5.00;
    """

    df1 = tips[(tips['time'] == 'Dinner') &
               (tips['tip'] > 5.00)]
    # print(df1)
    # pysql(q)


    # OR and AND
    q = """
    -- tips by parties of at least 5 diners OR bill total was more than $45
    SELECT *
    FROM tips
    WHERE size >= 5 OR total_bill > 45;
    """

    # df1 = tips[(tips['size'] >= 5) |
    #            (tips['total_bill'] > 45)]
    # print(df1)
    # pysql(q)


    #  notnull() and isnull()
    frame = pd.DataFrame({'col1': ['A', 'B', np.NaN, 'C', 'D'],
                          'col2': ['F', np.NaN, 'G', 'H', 'I']})
    q = """
    SELECT *
    FROM frame
    WHERE col2 IS NULL -- we can also use IS NOT NULL;
    """

    df1 = frame[frame['col2'].isnull()]  # notnull
    # print(frame)
    # print(df1)
    # print("\n")
    # pysql(q)


    #  GROUP BY
    q = """
    SELECT sex, count(*)
    FROM tips
    GROUP BY sex;
    """

    df1 = tips.groupby('sex').size()  # size = sql_count
    df2 = tips.groupby('sex').count()
    df3 = tips.groupby('sex')['total_bill'].count()
    # print(df1)
    # print(df2)
    # print(df3)
    # print("\n")
    # pysql(q)


    # Multiple functions using agg
    q = """
    SELECT day, AVG(tip), COUNT(*)
    FROM tips
    GROUP BY day;
    """

    # df1 = tips.groupby('day').agg(
    #     {'tip': np.mean, 'day': np.size})
    # print(df1)
    # print("\n")
    # pysql(q)

    # Grouping by more than one column
    q = """
    SELECT smoker, day, COUNT(*), AVG(tip)
    FROM tips
    GROUP BY smoker, day;
    """

    df1 = tips.groupby(['smoker', 'day']).agg(
        {'tip': [np.size, np.mean]})
    print(df1)
    print("\n")
    pysql(q)

if __name__ == '__main__':
    main()
