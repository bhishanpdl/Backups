#!/usr/bin/python

#cmd  : clear; python yield2.py

def get_odd_numbers(i):
    return range(1, i, 2)
def yield_odd_numbers(i):
    for x in range(1, i, 2):
       yield x
foo = get_odd_numbers(10)
bar = yield_odd_numbers(10)
print foo  # [1, 3, 5, 7, 9]
print bar  # <generator object yield_odd_numbers at 0x1029c6f50>
print bar.next() # 1
print bar.next() # 3
print bar.next() # 5



#    As we can see, in the first case foo holds 
#    the entire list in memory at once. 
#    It's not a big deal for a list with 5 elements, 
#    but what if you want a list of 5 million? 
#    Not only is this a huge memory eater, it also costs 
#    a lot of time to build at the time that the function is called
