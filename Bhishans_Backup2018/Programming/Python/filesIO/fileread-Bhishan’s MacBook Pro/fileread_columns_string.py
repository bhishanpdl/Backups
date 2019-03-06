#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016
# Ref     : http://stackoverflow.com/questions/7485458/python-reading-text-file

# Imports
from __future__ import division
from __future__ import print_function

col0=[]
col1=[]
col2=[]
col3=[]
crs = open("file.txt", "r")
for columns in ( raw.strip().split() for raw in crs ):
    print (columns[0])
    #print (columns[1])
    #print(type(columns[0]))
    col0.append( columns[0] );
    col1.append( columns[1] );
    col2.append( columns[2] );
    col3.append( columns[3] );


print(col0)
print(col0[0],col0[1])



## ====================================================
# If you want to convert columns to rows, use zip.
# If you have blank lines, filter them before using zip.

crs = open("file.txt", "r")
rows = (row.strip().split() for row in crs)
columns = zip(*(row for row in rows if row))

# print(rows)  # generator object
print("\n")
print(columns[0])
print(columns[1])
print(columns[2])
print(columns[3])
print(columns[3][0])


# similarly



