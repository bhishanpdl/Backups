#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
# syntax: { key:value for item in list if conditional }
#
# Imports
numbers = [i for i in xrange(1,11)] + [i for i in xrange(1,6)]
#print(numbers)

unique_numbers = list(set(numbers))
#print(unique_numbers)



data = [
  {'id': 10, 'data': '...'},
  {'id': 11, 'data': '...'},
  {'id': 12, 'data': '...'},
  {'id': 10, 'data': '...'},
  {'id': 11, 'data': '...'},
]

lst = { d['id']:d for d in data }.values()
print(lst)
