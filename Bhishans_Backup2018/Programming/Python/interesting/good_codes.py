#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-22-2016 Sat
# Last update :
#
#
# Imports



# convert to string
num = 1000200
print(num.__str__())
print(num.__str__().count('0'))
print(num.__str__().rstrip('0'))
a = str(num)
b = a.rstrip('0') # b = str(num).rstrip('0')
print(len(a) - len(b) )

print(len(str(num)) - len(str(num).rstrip('0')) )


