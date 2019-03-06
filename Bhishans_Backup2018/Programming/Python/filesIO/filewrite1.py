#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016
# Ref     : http://infoheap.com/python-file-read-write/

# Imports
from __future__ import division
from __future__ import print_function


# no need to close file
with open("out.txt", "w") as f:
  f.write("hello world\nhello world2\n")
  print (f)
print (f)


# need to close file
f = open("out.txt", "w")
f.write("hello world\nhello world2\n")
print (f)
f.close()
print (f)


# Read whole file
with open("out.txt", "r") as f:
  content = f.read()
  print (content)
  print (f)
print (f)

# iterate over lines from file
with open("out.txt", "r") as f:
  for line in f :
    print ("=line=")
    print (line)



