#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
from __future__ import division, unicode_literals, print_function

from re import sub
def printer_error(s):
    print('re.sub ')
    print(sub("[a-m]", '', s)) # nopxys for mnopabcxyz , a-m chars are neglected
    return "{}/{}".format(len(sub("[a-m]", '', s)),len(s))


print(printer_error('mnopabcxyz'))
##==================================================================


def printer_error(s):
    print([x for x in s if not x in "abcdefghikklm"])
    return "{}/{}".format(len([x for x in s if x not in "abcdefghijklm"]), len(s) )

print("\nusing list comprehension")
print(printer_error('klmpqrst'))

##======================================================================

def printer_error(s):
    import re
    print('\nre.findall returns list of characters')
    print(re.findall('[n-r]', s))
    return str(len(re.findall('[n-z]', s))) + "/" + str(len(s))


print(printer_error('jklmnop'))
