#!/usr/bin/python

# cmd : clear; python osmkdir.py

import os


# Create a directory "test"
if not os.path.exists("test"):
    os.mkdir("test")

print "new directory called test is created"
