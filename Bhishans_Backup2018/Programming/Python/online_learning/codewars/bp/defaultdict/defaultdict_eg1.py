#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports
from collections import defaultdict
import random


def max_count(num_list):
    counter = defaultdict(lambda: 0)
    for i in num_list:
        counter[i] += 1

    item, amount = sorted(counter.items(), key=lambda x: x[1], reverse=True)[0]

    #print ('item %s is the most common with %s occurrances' % (item, amount))
    return [item,amount]

num_list=[3,1,7,6,4,1,1,5,4,7,9,0,9,7,7,43,2,6,87,67,4,2,532]
print(max_count(num_list))


##======================================================================
import statistics
num_list=[3,1,7,6,4,1,1,5,4,7,9,0,9,7,7,43,2,6,87,67,4,2,532]
print(statistics.mode(num_list))


