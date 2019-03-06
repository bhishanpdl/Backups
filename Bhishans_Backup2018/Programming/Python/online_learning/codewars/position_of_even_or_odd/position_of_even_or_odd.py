#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# iq_test("2 4 7 8 10") => 3 // Third number is odd, while the rest of the numbers are even
# iq_test("1 2 1 1") => 2 // Second number is even, while the rest of the numbers are odd

def iq_test(num_str):

    num = [int(s) for s in num_str.split(' ')]

    o = len([n for n in num if n%2 == 0])
    e = len([n for n in num if n%2 != 0])

    idx = 0
    if o>e:
        idx = [i+1 for i,v in enumerate(num) if v%2 != 0][0]

    if e>o:
        idx = [i+1 for i,v in enumerate(num) if v%2 == 0][0]

    return idx

#print(iq_test("1 2 1 1"))




##======================================================================
## method2
##======================================================================
def iq_test(numbers):
    ebool = [int(i) % 2 == 0 for i in numbers.split()]
    #print(numbers.split())
    #print(ebool)
    return ebool.index(True) + 1 if ebool.count(True) == 1 else ebool.index(False) + 1

#print(iq_test("1 2 1 1"))





##======================================================================
## method3
##======================================================================
from collections import Counter
def iq_test(numbers):

    print(numbers.split()) # ['1', '2', '1', '1']
    e = [int(num) % 2 for num in numbers.split()]
    print(e) # [1, 0, 1, 1]

    counter = Counter(e)
    print(counter) # Counter({1: 3, 0: 1})

    most_common = counter.most_common()
    print(most_common) # [(1, 3), (0, 1)]

    least_list = most_common[1] # 0 is most common
    print(least_list) # (0,1)

    least_idx = least_list[0]
    print(least_idx) # 0


    # least_idx = Counter(e).most_common()[1][0]

    return e.index(least_idx) + 1

#print(iq_test("1 2 1 1"))
print(iq_test("2 4 8 7 10"))

