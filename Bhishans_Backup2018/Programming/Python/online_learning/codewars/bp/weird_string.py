#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports

def to_weird_case(mystr):
    mystrs = mystr.split()
    for i,val in enumerate(mystrs):
        mystrs[i] = "".join(v.upper() if i%2 == 0 else v.lower() for i, v in enumerate(val))


    return ' '.join(mystrs)

print(to_weird_case('This is a test'))





##======================================================================
## method2
##======================================================================
def to_weird_case(mystring):
    return(' '.join(''.join(l.upper() if i%2==0 else l.lower()
                   for i,l in enumerate(w)) for w in mystring.split(' ')))

