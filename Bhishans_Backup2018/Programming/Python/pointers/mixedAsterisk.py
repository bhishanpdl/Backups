#!/usr/bin/python3

#ref  : https://stackoverflow.com/questions/2921847/what-does-the-star-operator-mean-in-python?lq=1

#cmd  : clear; python3 mixedAsteric.py



# use of double asteric
# The double star ** does the same, only using a dictionary
def mysum(a, b):
    return a + b
    
values = { 'a': 1, 'b': 2 }
s = mysum(**values)

print(s)



#def mysum(a, b, c, d):
    #return a + b + c + d

#values1 = (1, 2) # tuple will need single *
#values2 = { 'c': 10, 'd': 15 } # dict will need double **
#s = mysum(*values1, **values2)

#print(s)
