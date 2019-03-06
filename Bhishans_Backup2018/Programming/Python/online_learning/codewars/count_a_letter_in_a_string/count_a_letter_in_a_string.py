#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports
import re
my_string = "Mary had a little lamb"
print(len(re.findall("a", my_string)))


sentence = 'Mary had a little lamb'
print(sentence.count('a'))

from collections import Counter
sentence = 'Mary had a little lamb'
print(Counter(list(sentence))['a'])
