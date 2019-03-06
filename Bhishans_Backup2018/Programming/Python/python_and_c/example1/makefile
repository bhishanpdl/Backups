# Program : Makefile for swig program to convert c to python3
# Author  : Bhishan Poudel
# Date    : Jun 30, 2017 Fri
#
#
#
# Convension: There should be foo.c and foo.i and module name should be foo.
# Python3 include path: python3-config --includes
# Python3 librarty path: python3-config --ldflags
#
# Description:
# 1. swig -python hello.i    (NOTE: python, not python3)
#    This creates three files: hello.py hello.o hello_wrap.c
#    hello.py is required by python in future.
#    hello.o and hello_wrap.c are intermediate files.
#
# 2. gcc -O2  -fpic -c hello.c hello_wrap.c -I /Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m
#
#    This creates hello_wrap.o
#    This is intermediate file.
#
# 3. gcc -O2  -L/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin -lpython3.6m -shared hello.o hello_wrap.o -o _hello.so
#
#   This will create _hello.so.
#   This is required by future python program.
# 
# Note: python needs three files: hello.py hello.o and _hello.so
#       hello.c and hello.c are created by user. 
#
#       For python2 use appropriate INCLUDE and LIB directory.
#
# TO INSTALL SWIG:
# First install pcre-8.39, then install swig usig configure,make,makefile. 

CC=gcc -O2 
INC=-I /Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m
LIB=-L/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin -lpython3.6m -shared
PRG=hello


# Execute program and clean it
default: all


all : swig_ wrap_ build_ clean_
swig_ :
	swig -python $(PRG).i

wrap_ :
	$(CC) -fpic -c $(PRG).c $(PRG)_wrap.c $(INC)

build_ :
	$(CC) $(LIB) $(PRG).o $(PRG)_wrap.o -o _$(PRG).so

clean_ :
	rm -f $(PRG).pyc $(PRG)_wrap.c $(PRG)_wrap.o
	rm -rf __pycache__ .DS_Store



# Utility targets
.PHONY: clean

clean:
	rm -f $(PRG).pyc $(PRG)_wrap.c $(PRG)_wrap.o
	rm -rf __pycache__ .DS_Store
	rm -f $(PRG).py $(PRG).py _$(PRG).so




#swig -python hello.i
#gcc -O2 -fpic -c hello.c hello_wrap.c -I/Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m 

#gcc -O2 -L/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin -lpython3.6m -shared hello.o hello_wrap.o -o _hello.so
#clear; python3 hello_test.py
#rm -f hello_wrap.c hello_wrap.o hello.pyc
