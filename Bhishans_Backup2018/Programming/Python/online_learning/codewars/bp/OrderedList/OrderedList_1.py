#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports
from collections import OrderedDict,Counter
import collections


text = 'aabbccdDefg'
results = Counter(text.lower())
print(results)



##======================================================================
s = 'abbccdDefg'
dic = {i:s.count(i) for i in set(s)}
#print(dic)

##======================================================================
for c in sorted(dic, key=dic.get, reverse=True):
  #print ('%s %6d' % (c, dic[c]))
  pass

##======================================================================
# dictionary comprehension
dic = {i:text.count(i) for i in text}
#print(dic)


