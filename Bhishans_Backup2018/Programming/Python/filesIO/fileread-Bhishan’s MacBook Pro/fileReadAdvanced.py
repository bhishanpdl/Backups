#!/usr/bin/python
#programmer: Bhishan Poudel
#cmd       : clear; python fileReadAdvanced.py

#ref       : https://stackoverflow.com/questions/10979847/how-to-store-the-contents-of-files-in-arrays-using-python

import os

path = '/Users/poudel/Copy/Programming/Python/pyprograms/filesIO/fileread'
fnames = [ 'file{0}.txt'.format(i) for i in (5, 10, 15, 20) ]

f = []
for fname in fnames:
    with open(os.path.join(path, fname), 'r') as fr:
        f.append(fr.readlines())
