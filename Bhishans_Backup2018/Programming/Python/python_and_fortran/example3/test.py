#!/usr/bin/env python
 
import hello
from numpy import *
a = arange(0.0, 10.0, 1.0)
len_a = len(a)
 
print("foo:")
hello.test.foo(len_a)
 
print("bar:")
a_out = hello.test.bar(len_a, a)
print(a_out)
 
print("sub:")
a_out = hello.test.sub(a, len_a)
print(a_out)
