#!/usr/bin/python

#ref  : (its good)
#ref  : https://docs.python.org/2/tutorial/inputoutput.html
#cmd  : clear; python repr.py

s = 'Hello World.'
print str(s)

print repr(s)


print str(1.0/7.0)
print repr(1.0/7.0)


x = 10 * 3.25
y = 200 * 200
s = 'The value of x is ' + repr(x) + ', and y is ' + repr(y) + '...'
print s

# The repr() of a string adds string quotes and backslashes:
hello = 'hello, world\n'
hellos = repr(hello)
print hellos

# The argument to repr() may be any Python object:
repr((x, y, ('spam', 'eggs')))




#    The str() function is meant to return 
#    representations of values which are 
#    fairly human-readable, while repr() is 
#    meant to generate representations which can 
#    be read by the interpreter
