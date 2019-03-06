#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
import math


def countBits(n):
    return len([x for x in str(bin(10)) if x == '1'])





##======================================================================
## method2
##======================================================================
def countBits(n):
    return bin(n).count("1")





##======================================================================
## method3
##======================================================================
countBits = lambda n: bin(n).count('1')





##======================================================================
## method3 using map  Can you do using map?
##======================================================================
def countBits(n):
  return sum(map(int, bin(n)[2:]))  # bin(n) is 0b then numbers

print(bin(10))
# Cities.
names = ["San Jose", "San Francisco", "Santa Fe", "Houston"]

# Sum result of map.
count = sum(map(lambda s: s.startswith("San"), names))

# Count of cities starting with San.
print(count)
print("\n")

# An input list.
items = [1, 2, 3]

# Apply lambda to all elements with map.
for r in map(lambda x: x + 1, items):
    print(r)
