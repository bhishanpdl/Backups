#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports
import random, string

##======================================================================
def random_char():
    import random, string

    return ''.join(random.choice('news'))

print (random_char())

##======================================================================
# palindrome check
a = 'abc'
print(a[::-1])
a = '0123443210'
print('\n')
print(a)
print(a[::-1])
print(a[0:5])
a5 = a[0:5]
a5last = a[5:]
a5rev = ''.join(reversed(a5last))
print(a5rev)

print("\n")
walk = '0123443210'
print(walk[0:5])
print(walk[5:])
print(walk[5::-1][::-1])

##======================================================================
##======================================================================

def isValidWalk(walk):

    if len(walk) != 10:
        return False

    if len(walk) == 10:
        if walk[0:5] == walk[5:][::-1]:
            return True
        else:
             return False

    else:
        return True

print (isValidWalk('newsew'))





##======================================================================
## method2
##======================================================================
def isValidWalk(walk):
    return len(walk) == 10 and walk.count('n') == walk.count('s') and walk.count('e') == walk.count('w')






##======================================================================
## method3
##======================================================================
def isValidWalk(walk):
    if (walk.count('n') == walk.count('s') and  # to reach same point n == s
        walk.count('e') == walk.count('w') and
        len(walk) == 10):
            return True
    return False
