#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 1. use double underscore for unused variable
filename = 'foobar.txt'
basename, __, ext = filename.rpartition('.')  # __ is .
print(basename)
print(ext)

# Many Python style guides recommend the use of a single underscore “_” for
# throwaway variables rather than the double underscore “__” recommended here.
# The issue is that “_” is commonly used as an alias for the gettext()
# function, and is also used at the interactive prompt to hold the value of the
# last operation. Using a double underscore instead is just as clear and
# almost as convenient, and eliminates the risk of accidentally interfering
# with either of these other use cases.
