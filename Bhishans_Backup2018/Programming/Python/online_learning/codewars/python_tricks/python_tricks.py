#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
#
# Ref: http://www.petercollingridge.co.uk/book/export/html/362
# Imports

n = 5
if n < 0:
    result = 'n is negative'
else:
    result = 'n is positive'

# We can write:

result = n < 0 and 'n is negative' or 'n is positive'
print(result)
