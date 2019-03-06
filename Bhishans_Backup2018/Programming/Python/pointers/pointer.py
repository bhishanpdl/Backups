#!/usr/bin/python

#ref  : https://stackoverflow.com/questions/2921847/what-does-the-star-operator-mean-in-python?lq=1

#cmd  : clear; python pointer.py


def mysum(a, b):
    return a + b

values = (1, 2)

# the use of *  will unpack the tuple so that it actually executes as:
# s = mysum(1, 2)

s = mysum(*values)

print(s)


# example 2

def mysum(*values):
    s = 0
    for v in values:
        s = s + v
    return s

s = mysum(1, 2, 3, 4, 5)
print(s)


# Built in method
print(sum([1, 2, 3, 4, 5]))
