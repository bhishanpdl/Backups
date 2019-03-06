#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Write a function that will return the count of distinct case-insensitive
# alphabetic characters that occur more than once in the input string.
# The input string can be assumed to contain only alphanumeric characters,
# including digits, uppercase and lowercase alphabets.
from collections import OrderedDict,Counter
import collections


def duplicate_count(text):
    from collections import Counter

    count_dict = Counter(text.lower())
    dic_values = list(count_dict.values())
    lst        = [x for x in dic_values if x >1]
    return len(lst)


text = 'aabbccdDefg'

print(duplicate_count(text))





##======================================================================
## method2
##======================================================================
def duplicate_count(s):
  return len([c for c in set(s.lower()) if s.lower().count(c)>1])
print(duplicate_count(text))





##======================================================================
## method3
##======================================================================
from collections import Counter

def duplicate_count(text):
    return sum(1 for c, n in Counter(text.lower()).iteritems() if n > 1)
print(duplicate_count(text))




##======================================================================
## method4
##======================================================================
from collections import Counter

def duplicate_count(text):
    counter = Counter(text.lower())
    return len([counter.keys() for i in counter.values() if i>1])
print(duplicate_count(text))




##======================================================================
## method5 using Counter and itervalues
##======================================================================
from collections import Counter

def duplicate_count(text):
    return sum(n > 1 for n in Counter(text.lower()).itervalues())
print(duplicate_count(text))






##======================================================================
## method6  using set
#
# len([c for c in set(s.lower()) if s.lower().count(c)>1])
##======================================================================
def duplicate_count(text):
    r = 0
    for char in set(text):
         if text.lower().count(char) > 1:
             r += 1
    return r

text = 'aabbccdDefg'
print(set(text))
