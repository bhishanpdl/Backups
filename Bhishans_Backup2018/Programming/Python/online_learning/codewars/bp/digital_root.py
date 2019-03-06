#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
import numpy as np

def digital_root(n):

    while len(str(n)) > 1:
        n = sum([int(i) for i in str(n)])

    return n


print(digital_root(1235))




##======================================================================
## method 2
##======================================================================

def digital_root(n):
    return n if n < 10 else digital_root(sum(map(int,str(n))))
print(digital_root(1235))


