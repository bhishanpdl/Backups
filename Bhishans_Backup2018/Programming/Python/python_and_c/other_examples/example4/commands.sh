#!/usr/bin/bash

# Ref: https://en.wikibooks.org/wiki/Python_Programming/Extending_with_C
# To get python include: python-config --include
swig -python hello.i
gcc -fpic -c hellomodule.c hello_wrap.c -I/System/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7
gcc -shared hellomodule.o hello_wrap.o -o _hello.so -lpython
python hello_test.py
rm -f hello_wrap.c hello_wrap.o hello.pyc hello.py hellomodule.o hello.i
