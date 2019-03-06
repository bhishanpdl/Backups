#!/usr/bin/python

#ref  : https://stackoverflow.com/questions/2921847/what-does-the-star-operator-mean-in-python?lq=1

#cmd  : clear; python mixedptr.py



# The double pointer uses a dictionary

def mysum(a, b, c, d):
    return a + b + c + d

values1 = (1, 2) # tuple will need single *
values2 = { 'c': 10, 'd': 15 } # dict will need double **
s = mysum(*values1, **values2)
print(s)

#example 2
def mysum2(*values, **options):
    s = 0
    for i in values:
        s = s + i
    if "neg" in options:
        if options["neg"]:
            s = -s
    return s

s = mysum2(1, 2, 3, 4, 5)            # returns 15
s = mysum2(1, 2, 3, 4, 5, neg=True)  # returns -15
s = mysum2(1, 2, 3, 4, 5, neg=False) # returns 15

print(s)
