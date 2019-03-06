#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports

d = {'a': 1, 'b': 2}
dvi = d.itervalues()
print(dvi.next()) # 1

d['x'] = 'foobar'    # adding a new key:value pair during iterarion
print(d)
# print(dvi.next())  # gives error, create iterable before using next

##======================================================================
d = {1: [1,2], 2: [3,4]}
for v in d.itervalues():
    v[0] += 10

print(d)

d2 = {i:i**2 for i in range(1, 5)}
print(d2)
