#!/usr/bin/python


#cmd  : clear; python doubleAsteric.py


def mysum(a, b):
    return a + b


# use of double asteric
# The double star ** does the same, only using a dictionary

values = { 'a': 1, 'b': 2 }
s = mysum(**values)

print(s)
