#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 7, 2017
# Last update :
# Est time    :

# Imports
import pandas as pd
import pandasql as pdsql


# Data    
aadhaar_data = pd.read_csv('aadhaar_data.csv')

def main():
    # rename
    aadhaar_data.rename(
        columns=lambda x: x.replace(' ', '_').lower(), inplace=True)
    print(aadhaar_data.head())

    #q = """
    #SELECT district, SUM(aadhaar_generated)
    #FROM aadhaar_data
    #GROUP BY district;
    #"""

    #q = """
    #SELECT district,sub_district, SUM(aadhaar_generated)
    #FROM aadhaar_data
    #GROUP BY district,sub_district;
    #"""

    #q = """
    #SELECT district,sub_district, SUM(aadhaar_generated)
    #FROM aadhaar_data where age > 60
    #GROUP BY district,sub_district;
    #"""

    # Write a query that will select from the aadhaar_data table how many men and
    # how many women over the age of 50 have had aadhaar generated for
    # them in each district.
    #q = """
    #SELECT gender,district, SUM(aadhaar_generated)
    #FROM aadhaar_data where age > 50
    #GROUP BY gender,district;
    #"""

    #print(pdsql.sqldf(q, locals()))

if __name__ == '__main__':
    main()
