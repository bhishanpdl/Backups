#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports
li=[("B", 1), ("A", 2)]
print(sorted(li, key=lambda x: x[1]))
#here I will sort according to the second element in the tuple (the number)
#[('B', 1), ('A', 2)]
print(sorted(li, key=lambda x: x[0]))
#here I will sort according to the first element in the tuple (the letter)
#[('A', 2), ('B', 1)]

##======================================================================
def mode(arr):
    some_dict = dict((x,arr.count(x)) for x in set(arr))
    return max(some_dict, key=some_dict.get)

a = mode([1,3,3,4])
print('{} {} {}'.format('\na = ',a, ''))
