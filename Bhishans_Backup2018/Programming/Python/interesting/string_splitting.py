#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Author: Bhishan Poudel <poudel>
# @Date:   25-Oct-2016 11:10
# @Last modified by:   poudel
# @Last modified time: 17-Nov-2016 19:11

import re

text = "f606w_devauc1.fits"

line = 'asdf fjdk; afed, fjek,asdf,      foo'
fields = re.split(r'(;|,|\s)\s*', line)
print(fields)


# example 3
txt = '1999-05-03 10:37:00'
a = re.split('[- :]', txt)
print(a)


# example
print("\n")
delimiters = "a", "...", "(c)"
example = "stackoverflow (c) is awesome... isn't it?"
regexPattern = '|'.join(map(re.escape, delimiters))
fields = re.split(regexPattern, example)
print(fields)


# example
print("\n")
delimiters = "_", "."
regexPattern = '|'.join(map(re.escape, delimiters))
fields = re.split(regexPattern, text)
print(fields)


# example
a = text.replace('devauc', 'bulge')
print(a)
