#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports

d1 = {i: i**2 for i in range(1, 5)}
d2 = {k: v**3 for (k, v) in zip('abcde', range(5))}
d3 = {k: v**3 for (k, v) in zip('abcde', range(5)) if v%2 == 0 }

#print(d)



##======================================================================
##   dict zip keys values
##======================================================================
keys = ['a', 'b', 'c']
values = [1, 2, 3]
d = dict(zip(keys, values))
#print(d)



##======================================================================
## dictkeys
##======================================================================
d = dict.fromkeys(range(1, 3), 500)  # all have values 500
#print(d)





##======================================================================
##
##======================================================================
my_list = ["a", "b", "a", "c", "c", "a", "c"]
my_dict = {i:my_list.count(i) for i in my_list}
print (my_dict)
from collections import Counter
a = dict(Counter(my_list))
print (a)

