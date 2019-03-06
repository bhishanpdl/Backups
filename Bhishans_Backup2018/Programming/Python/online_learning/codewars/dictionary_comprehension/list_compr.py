#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports

mylist = [20, 30, 25, 20]
a = [i for i, x in enumerate(mylist) if mylist.count(x) > 1]
# this is O(n^2) i.e for 10^3 elements it will check for 10^6 times.
#print('{} {} {}'.format('a = ',a, ''))





##======================================================================
## Better way
##======================================================================
from collections import Counter
mylist = [20, 30, 25, 20]
a = [k for k,v in Counter(mylist).items() if v>1]
#print(a)


# If you need to know the indices,

from collections import defaultdict
D = defaultdict(list)
for i,item in enumerate(mylist):
    D[item].append(i)
D = {k:v for k,v in D.items() if len(v)>1}
#print(D)


##======================================================================
# compress a list such that the first item in my new list was
# the average of the first ten items in the original list,
# the second was the average of the next ten items and so on.
import random
data =  [random.randint(0,i) for i in range(20) ] # Several thousand numbers
print(data)
bin = 10
compressed_data = [ float(sum(data[n*bin:(n+1)*bin]))/bin
                    for n in range(len(data)/bin)]
print('{} {} {}'.format('compressed_data = ',compressed_data, ''))

