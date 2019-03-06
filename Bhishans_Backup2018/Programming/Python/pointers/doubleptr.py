#!/usr/bin/python


#cmd  : clear; python doubleptr.py


def mysum(a, b):
    return a + b


# use of double asteric
# The double star ** does the same, only using a dictionary

values = { 'a': 1, 'b': 2 }
s = mysum(**values)

print(s)

#example 2
def get_a(**values):
    return values['a']

s = get_a(a=1, b=2)      # returns 1
print(s)
