#!/usr/bin/python

# pre: touch test1.txt
# cmd: clear; python osrename.py

import os

# Rename a file from test1.txt to test2.txt
os.rename( "test1.txt", "test2.txt" )
