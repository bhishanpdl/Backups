#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-22-2016 Sat
# Last update :
#
##
# triple_double(451999277, 41177722899) == 1 // num1 has straight triple 999s and
                                          # // num2 has straight double 99s

# triple_double(1222345, 12345) == 0 // num1 has straight triple 2s but num2 has only a single 2

# triple_double(12345, 12345) == 0

# triple_double(666789, 12345667) == 1

def triple_double(num1, num2):
    from itertools import groupby

    a = [x[0] for x in
          [ [k,len(list(g)) ] for k,g in groupby(str(num1)) if len(list(g))> 2 ]   ]
    b = [x[0] for x in
          [ [k,len(list(g)) ] for k,g in groupby(str(num2)) if len(list(g))> 1 ]   ]

    try:
        c = b.count(a[0])
    except IndexError:
        c = 0


    return c


num1 = 451999277
num2 = 41177722899
print(triple_double(num1, num2))





##======================================================================
## method2
##======================================================================
def triple_double(num1, num2):
    return any([i * 3 in str(num1) and i * 2 in str(num2) for i in '0123456789'])

print(triple_double(num1, num2))





##======================================================================
## method3
##======================================================================
def triple_double(num1, num2):
    for x in range(10):
        if str(x) * 3 in str(num1):
            if str(x) * 2 in str(num2):
                return 1
    return 0

print(triple_double(num1, num2))





##======================================================================
## method4
##======================================================================
import re
def triple_double(num1, num2):
    str_ = "{0}|{1}".format(num1,num2)
    regex = re.compile(r'(\d)(\1){2}.*\|.*(\1){2}')
    match = regex.search(str_)
    return True if match else False
print(triple_double(num1, num2))





##======================================================================
## method5
##======================================================================
def triple_double(num1, num2):
    num1 = str(num1)
    num2 = str(num2)
    nums = ['1','0','2','3','4','5','6','7','8','9','0']
    for i in nums:
        if i * 3 in num1 and i * 2 in num2:
            return 1
    return 0
print(triple_double(num1, num2))




