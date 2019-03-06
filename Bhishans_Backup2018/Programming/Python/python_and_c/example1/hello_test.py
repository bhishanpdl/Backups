# File: hello_test.py
# It needs three files hello.py, hello.o and _hello.so
# These three are created by swig using hello.c and hello.i
# swig = Simplified Wrapper and Interface Generator
# i is the interface file.

import hello

a = hello.fact(5)
print(('The value of a = ', a))
