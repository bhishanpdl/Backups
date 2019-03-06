#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports
def triple_double(num1, num2):
    return any([i * 3 in str(num1) and i * 2 in str(num2) for i in '0123456789'])

num1 = 451999277  # 9 is consecutive repeated thrice
num2 = 41177722899 # same number 9 is repeated consecutively twice, so ans is 1
print(triple_double(num1, num2))
