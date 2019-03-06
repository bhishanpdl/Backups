#!/usr/bin/python

# cmd: clear; python oswrite.py

import os, sys

# Open or create a file to append data
fd = os.open( "foo.txt", os.O_RDWR|os.O_CREAT )

# Get one duplicate file descriptor
d_fd = os.dup( fd )

# Write one string using duplicate fd
os.write(d_fd, "This is test")

# Close a single opened file
os.closerange( fd, d_fd)

print "Closed all the files successfully!!"
