#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jul 03, 2017 Mon
# Last update : 
#
# Imports
import numpy as np

names = ['Raymond', 'Rachel', 'Mathew']
colors = ['red', 'green', 'blue', 'yellow']

for color in reversed(colors):
    print(color)
    
    
for i, color in enumerate(colors):
    print(i, color)



print("\n")
for name, color in zip(names,colors):
    print(name, ' = ', color)


print("\n")
for color in sorted(colors, reverse=True):
    print(color)


# Sort by lenth of letters
print("\n")
print(sorted(colors, key=len))

# Break the loop
def find(seq, tgt):
    for i, value in enumerate(seq):
        if value == tgt:
            break
    else: return -1
    return 1
