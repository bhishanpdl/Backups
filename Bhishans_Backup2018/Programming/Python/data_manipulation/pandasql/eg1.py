#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 7, 2017
# Last update :
# Note: SQL stands for Structured Query Language
# SQL Clauses
# DISTINCT FROM WHERE ORDER BY GROUP BY HAVING BETWEEN


# Imports
import pandasql as pdsql
import pandas as pd
import numpy as np

#meat = pdsql.load_meat()
products = pd.read_csv('Products.csv', sep='\s+', lineterminator='\r')
#print(products)

# print(meat)  # [827 rows x 8 columns]



def main():
    
    # queries
    #q = "select beef,veal from meat;"
    #q = "select * from meat where beef>2450 and veal>10;"
    #q = "select * from meat where beef>2450 and veal>10 order by lamb_and_mutton;"
    #q = "select * from meat limit 3;"
    q = "select * from products where price between 20 and 50;"
    print(pdsql.sqldf(q, locals()))


    ##################################################################
    """sql comments
    eg1: SELECT * FROM Customers -- WHERE City='Berlin';

    /*Select all the columns
    of all the records
    in the Customers table:*/

    """

    # example LIKE
    # SELECT * FROM Customers WHERE Country LIKE '%land%';
    """
    SQL Query Types

    SELECT Statement	Retrieve records from a table
    SELECT LIMIT Statement	Retrieve records from a table and limit results
    SELECT TOP Statement	Retrieve records from a table and limit results
    INSERT Statement	Insert records into a table
    UPDATE Statement	Update records in a table
    DELETE Statement	Delete records from a table
    TRUNCATE TABLE Statement	Delete all records from a table (no rollback)
    UNION Operator	Combine 2 result sets (removes duplicates)
    UNION ALL Operator	Combine 2 result sets (includes duplicates)
    INTERSECT Operator	Intersection of 2 result sets
    MINUS Operator	Result set of one minus the result set of another
    EXCEPT Operator	Result set of one minus the result set of another
    SQL Comparison Operators

    Comparison Operators	Operators such as =, <>, !=, >, <, and so on
    SQL Joins

    JOIN Tables	Inner and Outer joins
    SQL Aliases

    ALIASES	Create a temporary name for a column or table
    SQL Clauses

    DISTINCT Clause	Retrieve unique records
    FROM Clause	List tables and join information
    WHERE Clause	Filter results
    ORDER BY Clause	Sort query results
    GROUP BY Clause	Group by one or more columns
    HAVING Clause	Restrict the groups of returned rows
    SQL Functions

    COUNT Function	Return the count of an expression
    SUM Function	Return the sum of an expression
    MIN Function	Return the min of an expression
    MAX Function	Return the max of an expression
    AVG Function	Return the average of an expression
    SQL Conditions

    AND Condition	2 or more conditions to be met
    OR Condition	Any one of the conditions are met
    AND & OR	Combining AND and OR conditions
    LIKE Condition	Use wildcards in a WHERE clause
    IN Condition	Alternative to multiple OR conditions
    NOT Condition	Negate a condition
    IS NULL Condition	Test for NULL value
    IS NOT NULL Condition	Test for NOT NULL value
    BETWEEN Condition	Retrieve within a range (inclusive)
    EXISTS Condition	Condition is met if subquery returns at least one row
    SQL Tables and Views

    CREATE TABLE	Create a table
    CREATE TABLE AS	Create a table from another table's definition and data
    ALTER TABLE	Add, modify or delete columns in a table; rename a table
    DROP TABLE	Delete a table
    GLOBAL TEMP Tables	Tables that are distinct within SQL session
    LOCAL TEMP Tables	Tables that are distinct within modules and embedded SQL
    SQL VIEW	Virtual tables (views of other tables)
    SQL Keys, Constraints and Indexes

    Primary Keys	Create or drop primary keys
    Indexes	Create and drop indexes (performance tuning)
    SQL Data Types

    Data Types	Data Types in SQL
    SQL Programming

    Comments	How to create comments within your SQL statement
    """
if __name__ == '__main__':
    main()
