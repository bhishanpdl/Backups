#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#



d = {1: [1,2], 2: [3,4]}
for v in d.itervalues():
    v[0] += 10

print(d)
