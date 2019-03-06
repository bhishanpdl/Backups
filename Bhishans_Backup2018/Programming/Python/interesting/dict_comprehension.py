#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : May 12, 2017 Fri
# Last update : 
#

# Imports
import time

# dictionary comprehension
lst1 = list('abcd')
lst2 = list(range(4))
d = {k:v for k,v in zip(lst1,lst2)}
print(d)

# example 2
d1 = {'a':10, 'b': 34, 'A': 7, 'Z':3}
d2 = {k: d1[k]+ 5 for k in d1.keys()}
print(d2)

# example 3
d1 = {'a':10, 'b': 34, 'A': 7, 'Z':3}
d2 = {k.lower(): d1.get(k.lower(),0) + d1.get(k.upper(), 0)
                 for k in d1.keys()}
print(d2)


# example 4
mylist = list('bcd')
d3 = { (k + 'plus10' if k in mylist else k):(v+10 if k in mylist else v)
        for k, v in d1.items() }
print("\n")
print(d1)
print(d3)
