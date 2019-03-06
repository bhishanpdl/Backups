#!/usr/bin/bash

# Ref: https://en.wikibooks.org/wiki/Python_Programming/Extending_with_C
# Ref: http://www.expobrain.net/2011/01/23/swig-tutorial-for-mac-os-x/
# To get python include: python-config --include

# swig creates two files: foo.py and foo_wrap.c 
swig -python hello.i

# gcc will create two .o files:  foo.o and foo_wrap.o
gcc -fpic -c hello.c hello_wrap.c -I/System/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7

# shared will create one module file needed by python: _foo.so
gcc -shared hello.o hello_wrap.o -o _hello.so -lpython

# python needs three files foo.o foo.py and __foo.so
python hello_test.py

# remove unwanted files
rm -f hello_wrap.c hello_wrap.o hello.pyc
