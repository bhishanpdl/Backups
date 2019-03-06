#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports




# If you're working with last lists and/or memory is a concern,
# using the itertools module is an even better option.

from itertools import count
alist = ['a1', 'a2', 'a3']
blist = ['b1', 'b2', 'b3']

for i, a, b in zip(count(), alist, blist):
    print (i, a, b)

# it is faster and uses less memory.

