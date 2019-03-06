#!/usr/bin/python

#cmd  : clear; python yield.py

# yield makes a function definition that returns a generator.

def f123():
    yield 1
    yield 2
    yield 3

for item in f123():
    print item
    
#example 2
print
def some_function():
    for i in xrange(4):
        yield i

for i in some_function():
    print i
    
# example 3

def simpleYield():
    yield "first time"
    yield "second time"
    yield "third time"
    yield "Now some useful value {}".format(12)

for i in simpleYield():
    print i
